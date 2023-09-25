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
    const index = await query('SELECT * FROM section;')
    res.render('pages/book', { index })
  })
  .get('/book/:ch(\\d+)', async function (req, res) {
    const content = "?"
    res.render('pages/section', { content })
  })
  .listen(port, () => { console.log(`app listening on port ${port}`) })