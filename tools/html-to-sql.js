import { parse } from 'node-html-parser'
import { closeSync, openSync, readFileSync, writeFileSync } from 'node:fs'

const dstPath = 'docs/generated-schema.sql'
const src = readFileSync('data/book.html', 'utf8')
const domRoot = parse(src)
const sqlHeader = `SET client_encoding = 'UTF8';
DROP TABLE IF EXISTS chapter CASCADE;
DROP TABLE IF EXISTS section CASCADE;
DROP TABLE IF EXISTS element_type CASCADE;
DROP TABLE IF EXISTS element;

CREATE TABLE chapter (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE section (
  id SERIAL PRIMARY KEY,
  chapter_id INT NOT NULL, 
  title TEXT NOT NULL,
  number INT NOT NULL,
  FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

CREATE TABLE element_type (
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL
);

CREATE TABLE element (
  id SERIAL PRIMARY KEY,
  section_id INT NOT NULL,
  element_type_id INT NOT NULL,
  index INT NOT NULL,
  content TEXT NOT NULL,
  FOREIGN KEY (section_id) REFERENCES section(id),
  FOREIGN KEY (element_type_id) REFERENCES element_type(id)
);

INSERT INTO element_type (description)
  VALUES ('paragraph'),
         ('letter'),
         ('footnote'),
         ('no_indent'),
         ('diagram'),
         ('code'), 
         ('non_section_header'),
         ('image'),
         ('list');

INSERT INTO chapter (title) VALUES
`
const sqlInsertSection = 'INSERT INTO section (chapter_id, title, number) VALUES'
const sqlInsertElement = 'INSERT INTO element (section_id, element_type_id, index, content) VALUES'

// This object mirrors database element_type table
const TYPE_CODE = {
  paragraph: 1,
  letter: 2,
  footnote: 3,
  no_indent: 4,
  diagram: 5,
  code: 6,
  non_section_header: 7,
  image: 8,
  list: 9
}

// Used to compare against first char of 'letter' element. If it is not an upper-case letter, it would be
// reasonable to assume it is not a code block
const upperLetters = 'QWERTYUIOPASDFGHJKLZXCVBNM1234567890"“”'

// Breaking down the DOM of book.html
const bookParts = domRoot.querySelectorAll('.chapter')
const chapters = {}

// Only want content from the Guide portion of the book
const startFlag = 'I. Guide'
const stopFlag = 'II. Reference'
let collectDivs = false

bookParts.forEach(
  (div) => {
    let title = ''
    const headers = div.querySelectorAll('h2, h3')
    if (headers.length > 0) {
      title = headers[0].innerText
    }

    // collectDivs set to true at bottom of function, so we don't collect the "I. Guide" header node
    if (title === stopFlag) {
      collectDivs = false
    } else if (collectDivs) { // HERE Start collecting HTML and additional required data
      // Fix img paths
      div.querySelectorAll('img').forEach(
        (image) => {
          const oldSrc = image.getAttribute('src')
          const oldSrcTokens = oldSrc.split('/')
          const newSrc = `/images/${oldSrcTokens[oldSrcTokens.length - 1]}`
          image.setAttribute('src', newSrc)
        }
      )

      // Clean up collected HTML
      div.innerHTML = div.innerHTML.replaceAll('\r\n', '\n')
      div.innerHTML = div.innerHTML.trim()

      // Each h2/h3 tag has an anchor tab named something like chap01 or chap01.4 ...
      // We split into two parts, chapter and section
      const chapterAndSection = headers[0].querySelector('a').id.split('.')

      // remove the chap from the number
      chapterAndSection[0] = Number(chapterAndSection[0].substring(4))

      if (chapterAndSection.length === 1) {
        chapterAndSection.push(0) // If no section listed, we are working with chapter intro (section 0 for our purposes)
      } else {
        chapterAndSection[1] = Number(chapterAndSection[1])
      }

      // Remove chapter numbers from title string if present
      if (title.split('.').length > 1) {
        title = title.split('.')[1].replace(/[0-9]/g, '')
      }

      // Add chapter to object if not exists
      if (!(chapterAndSection[0] in chapters)) {
        chapters[chapterAndSection[0]] = {}
        chapters[chapterAndSection[0]].title = title
        chapters[chapterAndSection[0]].sections = {}
      }

      // Add section to object (reminder, treating intro to chapter as section 0)
      chapters[chapterAndSection[0]].sections[chapterAndSection[1]] = {}
      chapters[chapterAndSection[0]].sections[chapterAndSection[1]].title = title
      chapters[chapterAndSection[0]].sections[chapterAndSection[1]].parts = {}

      let index = -1
      div.childNodes.forEach(
        (part) => {
          if (index !== -1) { // Skip the first as title has been extracted already
            chapters[chapterAndSection[0]].sections[chapterAndSection[1]].parts[index] = {}

            // detect type, default is paragraph
            let type = TYPE_CODE.paragraph
            let content = part.innerText

            if (part.classList?.contains('letter')) {
                // letter blocks can also be code or a list... the first character of the text will likely be lower case if it is displaying code
                const first = part.innerText.trim().substring(0, 1)
                if (first === '◼') {
                    type = TYPE_CODE.list
                } else if (upperLetters.indexOf(first) === -1 || part.innerText.trim().split(' ').length < 3) {
                    // I also included a case where there are less than three spaces inside the text. This should cover all but the edgiest of edge cases
                    type = TYPE_CODE.code
                } else {
                    type = TYPE_CODE.letter
                }
            } else if (part.classList?.contains('footnote')) {
                type = TYPE_CODE.footnote
            } else if (part.classList?.contains('noindent')) {
                const first = part.innerText.trim().substring(0, 1)
                if (first === '◼') {
                    type = TYPE_CODE.list
                } else {
                    type = TYPE_CODE.no_indent
                }
            } else if (part.rawTagName === 'h4') {
                type = TYPE_CODE.non_section_header
            } else if (part.rawTagName === 'pre') {
                type = TYPE_CODE.diagram
                // Remove anchor tag
                content = '\t\t\t' + content.split('</a>')[1]
            } else if (part.classList?.contains('fig')) {
                type = TYPE_CODE.image
                // Remove figure div and store the image attributes as content
                const imgTagAttrs = part.querySelector('img').rawAttrs.split(' ')
                const label = part.querySelector('p').innerText
                // We customize the attributes to plug into an img tag on our view, then add the label so we can display it on our page too
                content = 'alt="' + label + '" ' + imgTagAttrs[2] + ' ' + imgTagAttrs[3] + ' ' + imgTagAttrs[4] + 'SPLIT!' + label
            }

            chapters[chapterAndSection[0]].sections[chapterAndSection[1]].parts[index].content = content
            chapters[chapterAndSection[0]].sections[chapterAndSection[1]].parts[index].type_id = type
          }
          index++
        }
      )
    }

    // Start collecting at the beginning of the guide section
    if (title === startFlag) {
      collectDivs = true
    }
  }
)

// Now, we need to insert our JavaScript object into a completed SQL statement
// The insert statement for chapters was already started in sqlHeader
const chapNums = Object.keys(chapters)
const fd = openSync(dstPath, 'w')
writeFileSync(fd, sqlHeader)

// Insert chapters
writeFileSync(fd, `('${chapters[chapNums[0]].title}')`)
chapNums.slice(1).forEach(
  (key) => {
    writeFileSync(fd, `,\n('${chapters[key].title}')`)
  }
)
writeFileSync(fd, ';\n\n')

// Insert sections -- (chapter_id, title, number)
let first = true
writeFileSync(fd, sqlInsertSection)
chapNums.forEach(
  (chapKey) => {
    const chapter = chapters[chapKey]
    const sectNums = Object.keys(chapter.sections)
    if (first) {
      writeFileSync(fd, `('${chapKey}', '${chapter.sections[0].title}', '${sectNums[0]}')`)
      sectNums.slice(1).forEach(
        (sectKey) => {
          writeFileSync(fd, `,\n('${chapKey}', '${chapter.sections[sectKey].title}', '${sectKey}')`)
        }
      )

      first = false
    } else {
      sectNums.forEach(
        (sectKey) => {
          writeFileSync(fd, `,\n('${chapKey}', '${chapter.sections[sectKey].title}', '${sectKey}')`)
        }
      )
    }
  }
)
writeFileSync(fd, ';\n\n')

// Insert elements (AKA "parts") -- (section_id, element_type_id, index, content)
// Note: I regret naming a database table the same name as a restricted word in JavaScript!
let sectId = 1
first = true // Piggy-backing sentinel variable from previous loop
writeFileSync(fd, sqlInsertElement)
chapNums.forEach(
  (chapKey) => {
    const chapter = chapters[chapKey]
    const sectNums = Object.keys(chapter.sections)
    sectNums.forEach(
      (sectKey) => {
        const section = chapter.sections[sectKey]
        const partIndicies = Object.keys(section.parts)
        if (first) {
          writeFileSync(fd, `('${sectId}', '${section.parts[0].type_id}', '${partIndicies[0]}', '${section.parts[0].content}')`)
          partIndicies.slice(1).forEach(
            (i) => {
              writeFileSync(fd, `,\n('${sectId}', '${section.parts[i].type_id}', '${i}', '${section.parts[i].content}')`)
            }
          )

          first = false
        } else {
          partIndicies.forEach(
            (i) => {
              writeFileSync(fd, `,\n('${sectId}', '${section.parts[i].type_id}', '${i}', '${section.parts[i].content}')`)
            }
          )
        }

        sectId++
      }
    )
  }
)
writeFileSync(fd, ';\n\n')

closeSync(fd)
