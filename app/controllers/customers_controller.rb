class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(permit_params)

    if @customer.valid?
      @customer.save
      redirect_to root_path, flash: { notice: I18n.t('flash.registrate', model: "#{ @customer.nick_name }さん") }
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:customer).permit(:first_name, :last_name, :email, :gender, :age,
                                     :nick_name, :job_name, :household_income, :savings,
                                     :married, :dependent_count, :housemate_count)
  end
end
