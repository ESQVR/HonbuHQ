class HomeController < ApplicationController # rubocop:disable Style/Documentation
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end
end
