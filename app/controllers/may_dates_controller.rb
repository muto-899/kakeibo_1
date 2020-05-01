class MayDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @may_dates = MayDate.where(user_id: current_user.id)
    @chart_date = MayDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total = MayDate.where(user_id: current_user.id).sum(:income)
    @pay_total = MayDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @may_date = MayDate.new
  end
  
  def income
    @may_date = MayDate.new
  end
  
  def create
    @may_date = MayDate.new(
       user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @may_date.save
      redirect_to("/may_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @may_date = MayDate.find_by(id: params[:id])
  end
  
  def show
    @may_date = MayDate.find_by(id: params[:id])
  end
  
  def update
    @may_date = MayDate.find_by(id: params[:id])
    @may_date.pay = params[:pay]
    if @may_date.update(may_date_params)
      redirect_to may_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @may_date = MayDate.find_by(id: params[:id])
    @may_date.destroy
    redirect_to("/may_dates/index")
  end
  
  private
    def may_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
  
end
