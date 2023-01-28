class DashboardsController < ApplicationController
  def index
    @company = Company.last
  end
end
