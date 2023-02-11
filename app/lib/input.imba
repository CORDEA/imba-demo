import * as json from './element'

css .row d:flex g:16px

export default tag Input < div
	<self>
		if data.type == json.TYPE_LIST
			<div.row[mb:16px]>
				<input[fl:2] type='text' bind=data.name>
				<TypeSelector bind=data.type>
			<ListRow bind=data level=1>
		else
			<div.row>
				<input[fl:2] type='text' bind=data.name>
				<TypeSelector bind=data.type>
				<ValueInput[fl:4] bind=data>

tag ListRow < div
	level = 1

	<self.row[fld:column]>
		for e in data.value.value
			if e.type == json.TYPE_LIST
				<ListRow bind=e level=level+1>
			else
				<div.row[ml:{level * 32}px]>
					<TypeSelector bind=e.type>
					<ValueInput[fl:4] bind=e>
		<button[ml:{level * 32}px] @click=data.value.value.push(new json.JsonElement)> '+'

tag TypeSelector < div
	<self>
		<select[fl:1] bind=data>
			for t in [json.TYPE_STRING, json.TYPE_INT, json.TYPE_BOOL, json.TYPE_LIST]
				if t == data
					<option value=t selected> t
				else
					<option value=t> t

tag ValueInput < div
	<self>
		if data.type == json.TYPE_BOOL
			let v = data.value.value
			<select[w:100%] bind=v>
				for b in [true, false]
					if v == b
						<option value=b selected> b
					else
						<option value=b> b
		else
			<input[w:100%] type='text' bind=data.value.value>
