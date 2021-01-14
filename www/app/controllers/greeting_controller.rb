class GreetingController < ApplicationController
  def index
    expires_in 10.minutes, public: true, stale_while_revalidate: 60.seconds
    name = params[:name] || "Rails API"

    body = { greeting: sprintf("Hello! %s.", name),
             _links: { self: { href: request.path } } }

    begin
      JSON::Validator.validate!('schema/greeting.json', body)

      render content_type: "application/hal+json", json: body
    rescue => e
      logger.error e
      render content_type: "application/vnd.error+json", json: { message: e.message }, status: 500
    end
  end
end
