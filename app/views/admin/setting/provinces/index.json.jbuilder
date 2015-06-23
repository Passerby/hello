json.array!(@admin_setting_provinces) do |admin_setting_province|
  json.extract! admin_setting_province, :id, :name, :pinyin
  json.url admin_setting_province_url(admin_setting_province, format: :json)
end
