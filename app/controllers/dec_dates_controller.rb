class DecDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @dec_dates = DecDate.where(user_id: current_user.id)
    @chart_date = DecDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total =DecDate.where(user_id: current_user.id).sum(:income)
    @pay_total = DecDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @dec_date = DecDate.new
  end
  
  def income
    @dec_date = DecDate.new
  end
  
  def create
    @dec_date = DecDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @dec_date.save
      redirect_to("/dec_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @dec_date = DecDate.find_by(id: params[:id])
  end
  
  def show
    @dec_date = DecDate.find_by(id: params[:id])
  end
  
  def update
    @dec_date = DecDate.find_by(id: params[:id])
    if @dec_date.update(dec_date_params)
      redirect_to dec_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @dec_date = DecDate.find_by(id: params[:id])
    @dec_date.destroy
    redirect_to("/dec_dates/index")
  end
  
  private
    def dec_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end
