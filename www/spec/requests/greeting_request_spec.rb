require 'rails_helper'

RSpec.describe "Greeting", type: :request do
  describe "GET /greeting" do
    it 'success' do
      get "/greeting"
      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/hal+json; charset=utf-8")
    end

    it 'greeting body' do
      get "/greeting"
      expect(response.body).to eq("{\"greeting\":\"Hello! Rails API.\",\"_links\":{\"self\":{\"href\":\"/greeting\"}}}")
    end

    it 'match response schema' do
      get "/greeting"
      expect(response).to match_response_schema "greeting"
    end
  end

  describe "GET /greeting" do
    it 'greeting with params' do
      get "/greeting/heyhey"
      expect(response.body).to eq("{\"greeting\":\"Hello! heyhey.\",\"_links\":{\"self\":{\"href\":\"/greeting/heyhey\"}}}")
    end
  end
end

RSpec::Matchers.define :match_response_schema do |resource|
  match do |response|
    JSON::Validator.validate! "schema/#{resource}.json", JSON.parse(response.body)
  end
end