class GreetingController < ApplicationController
  def index
    expires_in 1.hours, public: true
    name = params[:name] || "Rails API"

    render content_type: "application/hal+json",
           json: { greeting: sprintf("Hello! %s.", name),
                   _links: { self: { href: request.path } } }
  end
end
