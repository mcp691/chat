json.extract! room, :id, :name, :threads, :created_at, :updated_at
json.url room_url(room, format: :json)
