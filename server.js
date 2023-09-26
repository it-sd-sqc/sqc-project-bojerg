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

export const tableOfContents = async function () {
	const data = await query('SELECT chapter_id, title, number FROM section;')
	const table = {}
	data.forEach( (row) => {
		if(row.number === 0){
			table[row.chapter_id] = {}
		} 
		table[row.chapter_id][row.number] = row.title
	})
	
	return table
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
    const table = await tableOfContents()
	res.render('pages/book', { table })
  })
  .get('/book/:ch(\\d+)', async function (req, res) {
    const content = "?"
    res.render('pages/section', { content })
  })
  .listen(port, () => { console.log(`app listening on port ${port}`) })