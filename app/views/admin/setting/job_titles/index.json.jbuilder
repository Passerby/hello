json.array!(@admin_setting_job_titles) do |admin_setting_job_title|
  json.extract! admin_setting_job_title, :id, :name
  json.url admin_setting_job_title_url(admin_setting_job_title, format: :json)
end
