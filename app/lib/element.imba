export const TYPE_STRING = 'string'
export const TYPE_INT = 'int'
export const TYPE_BOOL = 'bool'
export const TYPE_LIST = 'list'

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
		#value = Boolean(v)

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
			return TYPE_STRING
		if value isa JsonInt
			return TYPE_INT
		if value isa JsonBool
			return TYPE_BOOL
		if value isa JsonList
			return TYPE_LIST

	set type v
		switch v
			when TYPE_STRING
				value = new JsonString
			when TYPE_INT
				value = new JsonInt
			when TYPE_BOOL
				value = new JsonBool
			when TYPE_LIST
				value = new JsonList

	def toJson
		const json = {}
		json[name] = value.toJson!
		return json
