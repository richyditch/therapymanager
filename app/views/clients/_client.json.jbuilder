json.extract! client, :id, :created_at, :updated_at, :client_name, :default_rate_pence
json.url client_url(client, format: :json)
