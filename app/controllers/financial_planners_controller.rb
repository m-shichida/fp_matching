class FinancialPlannersController < ApplicationController
  def new
    @financial_planner = FinancialPlanner.new
  end

  def create
    @financial_planner = FinancialPlanner.new(permit_params)

    if @financial_planner.valid?
      @financial_planner.save
      redirect_to root_path, flash: { notice: I18n.t('flash.registrate', model: "#{ @financial_planner.full_name }さん") }
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:financial_planner).permit(:first_name, :last_name, :email, :gender, :age, :self_introduction)
  end
end
