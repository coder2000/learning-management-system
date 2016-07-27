class PagesController < ApplicationController
  layout 'application', except: [:login]
  before_filter :check_if_logged_in, only: [:login]
  def login
  end
  def index
  end

end
