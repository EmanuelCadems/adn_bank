RspecApiDocumentation.configure do |config|
  config.format = %i[json combined_text html]
  config.curl_host = 'http://localhost:3000'
  config.api_name = 'Example App API'
  config.api_explanation = 'API Example Description'
end