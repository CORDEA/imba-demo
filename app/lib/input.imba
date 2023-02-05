import * as json from './element'

export default tag Input < div

	css .row d:flex g:16px

	<self>
		if data.type == 'list'
			<div.row>
				<input[fl:2] type='text' bind=data.name>
				<TypeSelector bind=data.type>
			<div[ml:32px]>
				for e in data.value.value
					<div.row>
						<TypeSelector bind=e.type>
						<input[fl:4] type='text' bind=e.value.value>
		else
			<div.row>
				<input[fl:2] type='text' bind=data.name>
				<TypeSelector bind=data.type>
				<input[fl:4] type='text' bind=data.value.value>

tag TypeSelector < div
	<self>
		<select[fl:1] bind=data>
			for t in json.types
				if t == data
					<option value=t selected> t
				else
					<option value=t> t
