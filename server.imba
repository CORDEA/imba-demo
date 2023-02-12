import express from 'express'
import index from './app/index.html'

const state = {
	json: {}
}

const app = express()
const port = process.env.PORT or 3000

const jsonBody = express.json({ limit: '1kb' })

app.get('/json') do(req, res)
	res.send(state.json)

app.post('/json', jsonBody) do(req, res)
	state.json = req.body
	res.send({})

app.get(/.*/) do(req,res)
	unless req.accepts(['image/*', 'html']) == 'html'
		return res.sendStatus(404)

	res.send(index.body)

imba.serve(app.listen(port))
