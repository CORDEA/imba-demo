export const types = [
	'string',
	'int',
	'bool',
	'list'
]

export class JsonValue
	get value
		return null

export class JsonString < JsonValue
	#value = ''

	get value
		return #value

	set value v
		#value = v

	def toJson
		return value

export class JsonInt < JsonValue
	#value = 0

	get value
		return #value

	set value v
		#value = parseInt(v)

	def toJson
		return value

export class JsonBool < JsonValue
	#value = false

	get value
		return #value

	set value v
		#value = v

	def toJson
		return value

export class JsonList < JsonValue
	#value = [new JsonElement]

	get value
		return #value

	set value v
		#value = v

	def toJson
		return value.map(do(e) e.value.toJson!)

export class JsonElement < JsonValue
	name = ''
	#value = new JsonString

	get value
		return #value

	set value v
		#value = v

	get type
		if value isa JsonString
			return 'string'
		if value isa JsonInt
			return 'int'
		if value isa JsonBool
			return 'bool'
		if value isa JsonList
			return 'list'

	set type v
		switch v
			when 'string'
				value = new JsonString
			when 'int'
				value = new JsonInt
			when 'bool'
				value = new JsonBool
			when 'list'
				value = new JsonList

	def toJson
		const json = {}
		json[name] = value.toJson!
		return json
