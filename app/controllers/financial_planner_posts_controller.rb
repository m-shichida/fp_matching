class FinancialPlannerPostsController < ApplicationController
  before_action :authenticated!, only: :index
  before_action :authenticated_financial_planner!, only: %i(new create edit update destroy)

  def index
    @q = FinancialPlannerPost.ransack(search_params)
    @posts = @q.result(distinct: true)
  end

  def new
    @post = FinancialPlannerPost.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def search_params
    return {} if params[:q].blank?

    params.require(:q).permit(:place_cont, :specialties_name_cont, :financial_planner_gender_eq).to_h
  end
end
