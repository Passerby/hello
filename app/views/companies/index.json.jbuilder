json.array!(@companies) do |company|
  json.extract! company, :id, :name, :description, :jobposter_id
  json.url company_url(company, format: :json)
end
