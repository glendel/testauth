class HomeController < ApplicationController
  def index
  flash[:notice] = t(:welcome)
  end
end
