class PageController < ApplicationController
  before_action :check_login
  before_action :active?
  def index
  end
end
