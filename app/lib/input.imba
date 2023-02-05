import * as json from './element'

css .row d:flex g:16px

export default tag Input < div
	<self>
		if data.type == 'list'
			<div.row[mb:16px]>
				<input[fl:2] type='text' bind=data.name>
				<TypeSelector bind=data.type>
			<ListRow bind=data level=1>
		else
			<div.row>
				<input[fl:2] type='text' bind=data.name>
				<TypeSelector bind=data.type>
				<input[fl:4] type='text' bind=data.value.value>

tag ListRow < div
	level = 1

	<self.row[fld:column]>
		for e in data.value.value
			if e.type == 'list'
				<ListRow bind=e level=level+1>
			else
				<div.row[ml:{level * 32}px]>
					<TypeSelector bind=e.type>
					<input[fl:4] type='text' bind=e.value.value>
		<button[ml:{level * 32}px] @click=data.value.value.push(new json.JsonElement)> '+'

tag TypeSelector < div
	<self>
		<select[fl:1] bind=data>
			for t in json.types
				if t == data
					<option value=t selected> t
				else
					<option value=t> t
