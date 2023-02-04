export const types = [
	'string',
	'int',
	'bool'
]

export class JsonValue
	value = null

export class JsonString < JsonValue
	value = ''

	def toJson
		return value

export class JsonInt < JsonValue
	value = 0

	def toJson
		return value

export class JsonBool < JsonValue
	value = false

	def toJson
		return value

export class JsonElement < JsonValue
	name = ''
	value = new JsonString

	get type
		if value isa JsonString
			return 'string'
		if value isa JsonInt
			return 'int'
		if value isa JsonBool
			return 'bool'

	set type v
		switch v
			when 'string'
				value = new JsonString
			when 'int'
				value = new JsonInt
			when 'bool'
				value = new JsonBool

	def toJson
		const json = {}
		json[name] = value.toJson!
		return json
