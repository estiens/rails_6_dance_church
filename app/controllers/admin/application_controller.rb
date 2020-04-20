# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      login = Rails.application.credentials.dig(:admin_login) || 'foo'
      password = Rails.application.credentials.dig(:admin_password) || 'bar'

      http_basic_authenticate_with name: login, password: password
    end
  end
end
