json.array!(@case_users) do |case_user|
  json.extract! case_user, :id, :name, :title, :company, :img, :content, :lang, :active
  json.url case_user_url(case_user, format: :json)
end
