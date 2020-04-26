class HomeController < ApplicationController
  
  def index
    @chart_date = AprDate.group(:category).sum(:pay)
  end
  
end
