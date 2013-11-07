class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  if ENV["BASIC_AUTH_USERNAME"] && ENV["BASIC_AUTH_PASSWORD"]
    before_filter :basic_authentication
  end

  def basic_authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USERNAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
