json.array!(@scaffold_tests) do |scaffold_test|
  json.extract! scaffold_test, :id, :text, :score
  json.url scaffold_test_url(scaffold_test, format: :json)
end
