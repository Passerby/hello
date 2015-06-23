json.array!(@admin_setting_industries) do |admin_setting_industry|
  json.extract! admin_setting_industry, :id, :name
  json.url admin_setting_industry_url(admin_setting_industry, format: :json)
end
