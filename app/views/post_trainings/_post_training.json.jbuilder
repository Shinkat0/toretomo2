json.extract! post_training, :id, :user_id, :note, :exercise, :weight, :rep, :bodyweight, :created_at, :updated_at
json.url post_training_url(post_training, format: :json)
