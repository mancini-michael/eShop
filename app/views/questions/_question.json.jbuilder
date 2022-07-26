json.extract! question, :id, :seller_id, :question, :reply, :created_at, :updated_at
json.url question_url(question, format: :json)
