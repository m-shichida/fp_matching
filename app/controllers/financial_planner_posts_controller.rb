class FinancialPlannerPostsController < ApplicationController
  before_action :authenticated!, only: :index

  def index
    @q = FinancialPlannerPost.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def new
    @post = FinancialPlannerPost.new
  end
end
