json.extract! reservation, :id, :matiere_id, :mentor_id, :date, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)