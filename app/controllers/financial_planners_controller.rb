class FinancialPlannersController < ApplicationController
  def new
    @financial_planner = FinancialPlanner.new
  end

  def create
    @financial_planner = FinancialPlanner.new(permit_params)

    if @financial_planner.valid?
      @financial_planner.save
      session[:user_id] = @financial_planner.id
      redirect_to root_path, flash: { notice: I18n.t('flash.registrate', model: "#{ @financial_planner.full_name }さん") }
    else
      render :new
    end
  end

  def edit
    @financial_planner = FinancialPlanner.find(params[:id])
    @appointments = @financial_planner.appointments.order(:started_at)
  end

  def update
    @financial_planner = FinancialPlanner.find(params[:id])

    if @financial_planner.update(permit_params)
      redirect_to edit_financial_planner_path(@financial_planner),
                  notice: I18n.t('flash.updated', model: "#{ @financial_planner.full_name }さんのプロフィール")
    else
      @appointments = @financial_planner.appointments.order(:started_at)
      render :edit
    end
  end

  private

  def permit_params
    params.require(:financial_planner).permit(:first_name, :last_name, :email, :gender, :age, :career)
  end
end
