@pragma {"lang":"lua"}
function (args) 
    local message_plugin = require "@antiraid/message"

    -- Make the embed
    local embed = message_plugin.new_message_embed()
    embed.title = args.event_titlename
    embed.description = "" -- Start with an empty description

    -- Add the fields to the description
    for key, value in pairs(args.fields) do
        local should_set = false

        if value ~= nil and value.field.type ~= "None" then
            should_set = true
        end
    
        if should_set then
            local formatted_value = message_plugin.format_gwevent_categorized_field(value)
            embed.description = embed.description .. "**" .. key:gsub("_", " "):upper() .. "**: " .. formatted_value .. "\n"
        end
    end

    local message = message_plugin.new_message()

    table.insert(message.embeds, embed)

    return message
end
