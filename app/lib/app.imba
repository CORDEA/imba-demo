import * as json from './element'

export default tag App < div
	elements = [new json.JsonElement]

	css w:50%
	css .container d:flex fld:column g:16px
	css .row d:flex g:16px

	<self>
		<h2[ta:start mb:64px]> 'Define API'
		<div.container>
			for el in elements
				<div.row>
					<input[fl:2] type='text' bind=el.name>
					<select[fl:1] bind=el.type>
						for t in json.types
							if t == el.type
								<option value=t selected> t
							else
								<option value=t> t
					if el.type != 'list'
						<input[fl:4] type='text' bind=el.value.value>
				if el.type == 'list'
					<div.container[ml:32px]>
						for e in el.value.value
							<div.row>
								<select[fl:1] bind=e.type>
									for t in json.types
										if t == e.type
											<option value=t selected> t
										else
											<option value=t> t
								<input[fl:4] type='text' bind=e.value.value>
						<button @click=el.value.value.push(new json.JsonElement)> '+'
		<button[w:100% mt:16px] @click=elements.push(new json.JsonElement)> '+'
		<div[ta:end mt:64px]>
			<button> 'Submit'
