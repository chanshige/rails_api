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
  end

  describe "GET /greeting" do
    it 'greeting with params' do
      get "/greeting/heyhey"
      expect(response.body).to eq("{\"greeting\":\"Hello! heyhey.\",\"_links\":{\"self\":{\"href\":\"/greeting/heyhey\"}}}")
    end
  end
end
