import express from 'express'
const app = express()
const port = process.env.PORT || 5163

app.use(express.static('./public/'))
app.set('views', 'views')
app.set('view engine', 'ejs')

app.listen(port, () => {
  console.log(`app listening on port ${port}`)
})

app.get('/', function (req, res) {
  res.render('pages/index')
})

// adapted from https://expressjs.com/en/starter/hello-world.html
