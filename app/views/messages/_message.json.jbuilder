json.extract! message, :id, :contents, :created_at, :updated_at
json.url message_url(message, format: :json)
