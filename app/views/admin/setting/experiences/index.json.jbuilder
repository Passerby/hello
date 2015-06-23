json.array!(@admin_setting_experiences) do |admin_setting_experience|
  json.extract! admin_setting_experience, :id, :name
  json.url admin_setting_experience_url(admin_setting_experience, format: :json)
end
