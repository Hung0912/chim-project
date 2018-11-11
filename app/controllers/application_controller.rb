class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # before_action :require_login
  before_filter :set_search

  def index
  end

  def set_search
    @q = Bird.search(params[:q])
  end
end
