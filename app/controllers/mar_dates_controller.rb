class MarDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @mar_dates = MarDate.where(user_id: current_user.id)
    @chart_date = MarDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total = MarDate.where(user_id: current_user.id).sum(:income)
    @pay_total = MarDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @mar_date = MarDate.new
    @date = DateTime.now
  end
  
  def income
    @mar_date = MarDate.new
    @date = DateTime.now
  end
  
  def create
    @mar_date = MarDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @mar_date.save
      redirect_to("/mar_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @mar_date = MarDate.find_by(id: params[:id])
  end
  
  def show
    @mar_date = MarDate.find_by(id: params[:id])
  end
  
  def update
    @mar_date = MarDate.find_by(id: params[:id])
    if @mar_date.update(mar_date_params)
      redirect_to mar_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @mar_date = MarDate.find_by(id: params[:id])
    @mar_date.destroy
    redirect_to("/mar_dates/index")
  end
  
  private
    def mar_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end
