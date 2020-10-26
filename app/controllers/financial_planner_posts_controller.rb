class FinancialPlannerPostsController < ApplicationController
  before_action :authenticated!, only: :index

  def index
    @q = FinancialPlannerPost.ransack(search_params)
    @posts = @q.result(distinct: true)
  end

  def new
    @post = FinancialPlannerPost.new
  end

  private

  def search_params
    return {} if params[:q].blank?

    params.require(:q).permit(:place_cont, :specialties_name_cont, :financial_planner_gender_eq).to_h
  end
end
