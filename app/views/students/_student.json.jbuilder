json.extract! student, :id, :FirstName, :LastName, :user_id, :created_at, :updated_at
json.url student_url(student, format: :json)