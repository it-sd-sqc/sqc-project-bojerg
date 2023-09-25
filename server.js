import 'dotenv/config'
import express from 'express'
import pkg from 'pg'
const { Pool } = pkg

const port = process.env.PORT || 5163
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
})

export const query = async function (sql, params) {
  let client
  let results = []
  try {
    client = await pool.connect()
    const response = await client.query(sql, params)
    if (response && response.rows) {
      results = response.rows
    }
  } catch (err) {
    console.error(err)
  }
  if (client) client.release()
  return results
}

export const getTableOfContents = async function () {
  const sql = 
  `SELECT * FROM section;`

  const chapters = await query(sql)
  chapters.forEach( (c) => {
    console.log(c)
  })
}

express()
  .use(express.static('./public/'))
  .set('views', 'views')
  .set('view engine', 'ejs')
  .get('/', function (req, res) {
    res.render('pages/index')
  })
  .get('/about', function (req, res) {
    res.render('pages/about')
  })
  .get('/book', async function (req, res) {
    getTableOfContents()
    //res.render('pages/book', {chapters, sections})
  })
  .get('/book/:ch(\\d+)', async function (req, res) {
    res.render('pages/book')
  })
  .listen(port, () => { console.log(`app listening on port ${port}`) })