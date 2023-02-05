import * as json from './element'
import Input from './input'

export default tag App < div
	elements = [new json.JsonElement]

	def post
		let body = elements.map(do(e) e.toJson!)
		await window.fetch('/json', {
			method: 'POST'
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(body)
		})

	css w:50%
	css .container d:flex fld:column g:16px

	<self>
		<h2[ta:start mb:64px]> 'Define API'
		<div.container>
			for el in elements
				<Input bind=el>
		<button[w:100% mt:16px] @click=elements.push(new json.JsonElement)> '+'
		<div[ta:end mt:64px]>
			<button @click=post> 'Submit'
