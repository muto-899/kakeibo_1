class HomeController < ApplicationController
  
  def index
    @chart_date = AprDate.group(:pay_category).sum(:pay)
  end
  
end
