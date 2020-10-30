class FinancialPlannerPostsController < ApplicationController
  before_action :authenticated!, only: :index
  before_action :authenticated_financial_planner!, only: %i[new create edit update destroy]
  before_action :already_post_created, only: %i[new create]

  def index
    @q = FinancialPlannerPost.ransack(search_params)
    @posts = @q.result(distinct: true)
  end

  def new
    @post = current_financial_planner.build_post
  end

  def create
    @post = current_financial_planner.build_post(permit_params)

    if @post.valid?
      @post.save
      redirect_to edit_financial_planner_post_path(@post), flash: { notice: I18n.t('flash.created', model: FinancialPlannerPost.model_name.human) }
    else
      render :new
    end
  end

  def show
    @post = FinancialPlanner.find(params[:financial_planner_id]).post
  end

  def edit
    @post = current_financial_planner.post
  end

  def update
    @post = current_financial_planner.post

    if @post.update(permit_params)
      redirect_to edit_financial_planner_post_path(current_financial_planner), flash: { notice: I18n.t('flash.updated', model: FinancialPlannerPost.model_name.human) }
    else
      render :edit
    end
  end

  def destroy
    @post = current_financial_planner.post
    if @post.destroy
      redirect_to root_path, flash: { notice: I18n.t('flash.deleted', model: FinancialPlannerPost.model_name.human) }
    else
      redirect_to root_path,
                  flash: { notice: I18n.t('flash.already_deleted', model: FinancialPlannerPost.model_name.human) }
    end
  end

  private

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
          .permit(:financial_planner_id, :title, :description, :interview_method, :place, :url,
                  appointment_possibles_attributes: [:id, :financial_planner_id, :financial_planner_post_id, :from_date, :to_date, :_destroy])
  end

  def already_post_created
    return if current_financial_planner && current_financial_planner.post.nil?

    redirect_to root_path, flash: { danger: 'すでに自己紹介投稿がされているため投稿できません' }
  end
end
