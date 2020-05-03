class OctDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @oct_dates = OctDate.where(user_id: current_user.id)
    @chart_date = OctDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total = OctDate.where(user_id: current_user.id).sum(:income)
    @pay_total = OctDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @oct_date = OctDate.new
  end
  
  def income
    @oct_date = OctDate.new
  end
  
  def create
    @oct_date = OctDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @oct_date.save
      redirect_to("/oct_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @oct_date = OctDate.find_by(id: params[:id])
  end
  
  def show
    @oct_date = OctDate.find_by(id: params[:id])
  end
  
  def update
    @oct_date = OctDate.find_by(id: params[:id])
    if @oct_date.update(oct_date_params)
      redirect_to oct_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @oct_date = OctDate.find_by(id: params[:id])
    @oct_date.destroy
    redirect_to("/oct_dates/index")
  end
  
  private
    def oct_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end
