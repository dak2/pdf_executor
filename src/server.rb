require 'sinatra'
require 'json'
require_relative 'extract'

set :bind, '0.0.0.0'
set :port, 3000

post '/extract_ruby' do
  content_type :json

  file = params.dig(:pdf_file)
  ruby_code = extract_ruby_code

  { code: ruby_code }.to_json
end
