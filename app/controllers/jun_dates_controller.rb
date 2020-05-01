class JunDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @jun_dates = JunDate.where(user_id: current_user.id)
    @chart_date = JunDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total = JunDate.where(user_id: current_user.id).sum(:income)
    @pay_total = JunDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @jun_date = JunDate.new
    @date = DateTime.now
  end
  
  def income
    @jun_date = JunDate.new
    @date = DateTime.now
  end
  
  def create
    @jun_date = JunDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay])
    if @jun_date.save
      redirect_to("/jun_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @jun_date = JunDate.find_by(id: params[:id])
  end
  
  def show
    @jun_date = JunDate.find_by(id: params[:id])
  end
  
  def update
    @jun_date = JunDate.find_by(id: params[:id])
    if @jun_date.update(jun_date_params)
      redirect_to jun_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @jun_date = JunDate.find_by(id: params[:id])
    @jun_date.destroy
    redirect_to("/jun_dates/index")
  end
  
  private
    def jun_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end
