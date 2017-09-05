json.extract! therapist, :id, :created_at, :updated_at, :therapist_name, :default_rate_pence, :default_location
json.url therapist_url(therapist, format: :json)
