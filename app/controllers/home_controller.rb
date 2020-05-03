class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :time_now
  
  def top
  end
  
  def index
    
    @jan_income_total = JanDate.where(user_id: current_user.id).sum(:income)
    @jan_pay_total = JanDate.where(user_id: current_user.id).sum(:pay)
    @jan_money_total = @jan_income_total - @jan_pay_total
    
    @feb_income_total = FebDate.where(user_id: current_user.id).sum(:income)
    @feb_pay_total = FebDate.where(user_id: current_user.id).sum(:pay)
    @feb_money_total = @feb_income_total - @feb_pay_total
    
    @mar_income_total = MarDate.where(user_id: current_user.id).sum(:income)
    @mar_pay_total = MarDate.where(user_id: current_user.id).sum(:pay)
    @mar_money_total = @mar_income_total - @mar_pay_total
    
    @apr_income_total = AprDate.where(user_id: current_user.id).sum(:income)
    @apr_pay_total = AprDate.where(user_id: current_user.id).sum(:pay)
    @apr_money_total = @apr_income_total - @apr_pay_total
    
    @may_income_total = MayDate.where(user_id: current_user.id).sum(:income)
    @may_pay_total = MayDate.where(user_id: current_user.id).sum(:pay)
    @may_money_total = @may_income_total - @may_pay_total
    
    @jun_income_total = JunDate.where(user_id: current_user.id).sum(:income)
    @jun_pay_total = JunDate.where(user_id: current_user.id).sum(:pay)
    @jun_money_total = @jun_income_total - @jun_pay_total
    
    @jul_income_total = JulDate.where(user_id: current_user.id).sum(:income)
    @jul_pay_total = JulDate.where(user_id: current_user.id).sum(:pay)
    @jul_money_total = @jul_income_total - @jul_pay_total
    
    @aug_income_total = AugDate.where(user_id: current_user.id).sum(:income)
    @aug_pay_total = AugDate.where(user_id: current_user.id).sum(:pay)
    @aug_money_total = @aug_income_total - @aug_pay_total
    
    @sep_income_total = SepDate.where(user_id: current_user.id).sum(:income)
    @sep_pay_total = SepDate.where(user_id: current_user.id).sum(:pay)
    @sep_money_total = @sep_income_total - @sep_pay_total
    
    @oct_income_total = OctDate.where(user_id: current_user.id).sum(:income)
    @oct_pay_total = OctDate.where(user_id: current_user.id).sum(:pay)
    @oct_money_total = @oct_income_total - @oct_pay_total
    
    @nov_income_total = NovDate.where(user_id: current_user.id).sum(:income)
    @nov_pay_total = NovDate.where(user_id: current_user.id).sum(:pay)
    @nov_money_total = @nov_income_total - @nov_pay_total
    
    @dec_income_total = DecDate.where(user_id: current_user.id).sum(:income)
    @dec_pay_total = DecDate.where(user_id: current_user.id).sum(:pay)
    @dec_money_total = @dec_income_total - @dec_pay_total
    
    @chart_date = [
      ['１月', @jan_money_total],
      ['２月', @feb_money_total],
      ['３月', @mar_money_total],
      ['４月', @apr_money_total],
      ['５月', @may_money_total],
      ['６月', @jun_money_total],
      ['７月', @jul_money_total],
      ['８月', @aug_money_total],
      ['９月', @sep_money_total],
      ['１０月', @oct_money_total],
      ['１１月', @nov_money_total],
      ['１２月', @dec_money_total]
    ]
  end

end