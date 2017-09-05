json.extract! therapysession, :id, :created_at, :updated_at, :therapist_id, :client_id, :session_started_at, :session_duration_minutes, :location, :fee_pence, :new_client_assessment, :attendance
json.url therapysession_url(therapysession, format: :json)
