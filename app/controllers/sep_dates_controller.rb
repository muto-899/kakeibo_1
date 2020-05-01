class SepDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @sep_dates = SepDate.where(user_id: current_user.id)
    @chart_date = SepDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total = SepDate.where(user_id: current_user.id).sum(:income)
    @pay_total = SepDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @sep_date = SepDate.new
  end
  
  def income
    @sep_date = SepDate.new
  end
  
  def create
    @sep_date = SepDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @sep_date.save
      redirect_to("/sep_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @sep_date = SepDate.find_by(id: params[:id])
  end
  
  def show
    @sep_date = SepDate.find_by(id: params[:id])
  end
  
  def update
    @sep_date = SepDate.find_by(id: params[:id])
    if @sep_date.update(sep_date_params)
      redirect_to sep_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @sep_date = SepDate.find_by(id: params[:id])
    @sep_date.destroy
    redirect_to("/sep_dates/index")
  end
  
  private
    def sep_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end
