import {JsonElement} from './element'

let elements = [new JsonElement]

export default tag App < div
	css w:50%
	css .container d:flex fld:column g:16px
	css .row d:flex g:16px

	<self>
		<h2[ta:start mb:64px]> 'Define API'
		<div.container>
			for e in elements
				<div.row>
					<input[fl:1] type='text' bind=e.name>
					<input[fl:2] type='text' bind=e.value>
		<div[ta:end mt:16px]>
			<button @click=elements.push(new JsonElement)> '+'
		<div[ta:end mt:64px]>
			<button> 'Submit'
