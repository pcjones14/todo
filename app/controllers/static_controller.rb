class StaticController < ApplicationController
  def index
  end

  def about
  end

  def register
  	@user = User.new
  end

  def login
  end
end
