class Admin::AdminController < ApplicationController
  before_action :site_http_basic_authenticate_with if Rails.env.production?

  layout 'admin'

  private

    def site_http_basic_authenticate_with(options = {})
      authenticate_or_request_with_http_basic('Application') do |name, password|
        name == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
      end
    end
end
