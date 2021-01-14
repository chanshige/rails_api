class GreetingController < ApplicationController
  def index
    expires_in 1.hours, public: true
    name = params[:name] || "Rails API"

    body = { greeting: sprintf("Hello! %s.", name),
             _links: { self: { href: request.path } } }

    begin
      JSON::Validator.validate!('schema/greeting.json', body)

      render content_type: "application/hal+json", json: body
    rescue => e
      logger.error e
      render content_type: "application/vnd.error+json", json: { message: e.message }
    end
  end
end
