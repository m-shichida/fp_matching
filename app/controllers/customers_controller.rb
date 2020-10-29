class CustomersController < ApplicationController
  before_action :authenticated_viewable_current_user!, only: %i[edit update]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(permit_params)

    if @customer.valid?
      @customer.save
      session[:user_id] = @customer.id
      redirect_to root_path, notice: I18n.t('flash.registrate', model: "#{ @customer.nick_name }さんのプロフィール")
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
    @appointments = @customer.appointments.order(:started_at)
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(permit_params)
      redirect_to edit_customer_path(@customer),
                  notice: I18n.t('flash.updated', model: "#{ @customer.nick_name }さんのプロフィール")
    else
      @appointments = @customer.appointments.order(:started_at)
      render :edit
    end
  end

  private

  def permit_params
    params.require(:customer).permit(:first_name, :last_name, :email, :gender, :age,
                                     :nick_name, :job_name, :household_income, :savings,
                                     :married, :dependent_count, :housemate_count)
  end
end
