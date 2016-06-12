class PagesController < ApplicationController
  layout 'application', except: [:login]
  before_filter :authenticated?, except: [:login]
  def login
  end
  def index
  end
end
