json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :salary, :description, :requirement, :comment, :endDate, :admin_setting_City_id, :company_id, :jobposter_id
  json.url job_url(job, format: :json)
end
