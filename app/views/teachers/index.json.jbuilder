json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :email, :password_digest
  json.url teacher_url(teacher, format: :json)
end
