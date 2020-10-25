class CustomersController < ApplicationController
  def new
    # TODO: user.rbよりもcustomer.rbの読み込みが早いので最初の1回はエラーになる
    @customer = User.new(type: Customer.to_s)
  end

  def create
    @customer = User.new(permit_params)
    if @customer.valid?
      @customer.save
      flash[:notice] = I18n.t('notice.registrate', model: "#{@customer.nick_name}さん")
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:customer).permit(:first_name, :last_name, :email, :gender, :age,
                                     :nick_name, :job_name, :household_income, :savings,
                                     :married, :dependent_count, :housemate_count, :type)
  end
end
