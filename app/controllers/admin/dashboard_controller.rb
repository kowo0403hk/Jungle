class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']

  def show
  end
end
