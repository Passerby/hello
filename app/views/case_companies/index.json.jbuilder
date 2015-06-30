json.array!(@case_companies) do |case_company|
  json.extract! case_company, :id, :name, :img, :requirement, :usage, :effect, :lang, :active
  json.url case_company_url(case_company, format: :json)
end
