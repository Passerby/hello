json.array!(@admin_setting_educations) do |admin_setting_education|
  json.extract! admin_setting_education, :id, :name
  json.url admin_setting_education_url(admin_setting_education, format: :json)
end
