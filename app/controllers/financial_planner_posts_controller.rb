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
      redirect_to root_path, flash: { notice: I18n.t('flash.created', model: FinancialPlannerPost.model_name.human) }
    else
      render :new
    end
  end

  def show; end

  def edit
    @post = find_current_fp_post
  end

  def update
    @post = find_current_fp_post
    if @post.update(permit_params)
      redirect_to root_path, flash: { notice: I18n.t('flash.updated', model: FinancialPlannerPost.model_name.human) }
    else
      render :edit
    end
  end

  def destroy
    @post = find_current_fp_post
    if @post.destroy
      redirect_to root_path, flash: { notice: I18n.t('flash.deleted', model: FinancialPlannerPost.model_name.human) }
    else
      redirect_to root_path,
                  flash: { notice: I18n.t('flash.already_deleted', model: FinancialPlannerPost.model_name.human) }
    end
  end

  private

  def find_current_fp_post
    current_financial_planner.posts.find(params[:id])
  end

  def search_params
    params[:q] ||= {}
    if params[:q].blank?
      params[:q].reverse_merge!(
        financial_planner_first_name_or_financial_planner_last_name_cont: '',
        place_cont: '',
        financial_planner_gender_eq: ''
      )
    end

    params.require(:q).permit(:financial_planner_first_name_or_financial_planner_last_name_cont,
                              :place_cont, :financial_planner_gender_eq)
  end

  def permit_params
    params.require(:financial_planner_post)
          .permit(:financial_planner_id, :title, :description, :interview_method, :place,
                  financial_planner_specialty_attributes: %i[id financial_planner_post_id name _destroy])
  end
end
