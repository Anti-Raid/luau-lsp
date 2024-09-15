-- @antiraid/message

-- Represents a message embed field
export type MessagePlugin_MessageEmbedField = {
	-- The name of the field
	name: string,
	-- The value of the field
	value: string,
	-- Whether the field should be inline
	inline: boolean
};

-- Represents a message embed
export type MessagePlugin_MessageEmbed = {
	-- The title set by the template
	title: string?,
	-- The description set by the template
	description: string?,
	-- The fields that were set by the template
	fields: {MessagePlugin_MessageEmbedField}
}

-- Represents a message that can be created by templates
export type MessagePlugin_Message = {
	-- Embeds [current_index, embeds]
	embeds: {MessagePlugin_MessageEmbed},
	-- What content to set on the message
	content: string?
}

export type __LSP_AntiRaidMessage = {
	-- Creates a new message table
	new_message: () -> MessagePlugin_Message,

	-- Creates a new message embed table
	new_message_embed: () -> MessagePlugin_MessageEmbed,

	-- Creates a new message embed field table
	new_message_embed_field: () -> MessagePlugin_MessageEmbedField,

	-- Formats a gwevent field into a string. These are exposed in places such as Audit Logs and other areas.
	format_gwevent_field: (field: any) -> string,

	-- Formats a categorized gwevent field into a string. These are exposed in places such as Audit Logs and other areas.
	format_gwevent_categorized_field: (field: any) -> string
}
