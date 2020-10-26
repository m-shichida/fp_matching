class FinancialPlannerPostsController < ApplicationController
  before_action :authenticated!, only: :index
  before_action :authenticated_financial_planner!, only: %i[new create edit update destroy]

  def index
    @q = FinancialPlannerPost.ransack(search_params)
    @posts = @q.result(distinct: true)
  end

  def new
    @post = current_financial_planner.posts.build
    @specialties = @post.specialties.build
  end

  def create
    @post = current_financial_planner.posts.build(permit_params)

    if @post.valid?
      @post.save
      redirect_to root_path, flash: { notice: I18n.t('flash.created', model: '投稿') }
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def search_params
    return {} if params[:q].blank?

    params.require(:q).permit(:place_cont, :specialties_name_cont, :financial_planner_gender_eq).to_h
  end

  def permit_params
    params.require(:financial_planner_post)
          .permit(:financial_planner_id, :title, :description, :interview_method, :place,
                  financial_planner_specialty_attributes: %i[id financial_planner_post_id name _destroy])
  end
end
