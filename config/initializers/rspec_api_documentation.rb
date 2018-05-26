RspecApiDocumentation.configure do |config|
  config.format = %i[json combined_text html]
  config.curl_host = ENV['CURL_HOST']
  config.api_name = 'Example App API'
  config.api_explanation = 'API DNA BANK'
end
