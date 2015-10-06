json.array!(@grades) do |grade|
  json.extract! grade, :id, :assignment_name, :grade, :student_id
  json.url grade_url(grade, format: :json)
end
