import { writeChaptersToFile } from '../tools/html-to-sql.js'

describe('writeChaptersToFile function', () => {
  let mockWriteFileSync

  beforeEach(() => {
    // Mock fs.writeFileSync to avoid actual file writes
    mockWriteFileSync = spyOn(fs, 'writeFileSync').and.stub()
  })

  it('should write chapters to file correctly', () => {
    const fd = '../specs/test'
    const chapters = {
      1: { title: 'Chapter 1' },
      2: { title: 'Chapter 2' },
      3: { title: 'Chapter 3' }
    }
    const chapNums = ['1', '2', '3']

    writeChaptersToFile(fd, chapters, chapNums)

    // Check that writeFileSync was called with expected arguments
    expect(mockWriteFileSync.calls.allArgs()).toEqual([
      [fd, "('Chapter 1')"],
      [fd, ",\n('Chapter 2')"],
      [fd, ",\n('Chapter 3')"],
      [fd, ';\n\n']
    ])
  })
})
