json.array!(@admin_setting_cities) do |admin_setting_city|
  json.extract! admin_setting_city, :id, :name, :pinyin
  json.url admin_setting_city_url(admin_setting_city, format: :json)
end
