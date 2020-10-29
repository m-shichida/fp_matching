class AppointmentsController < ApplicationController
  before_action :authenticated!, only: %i[new create destroy]

  def new
    @financial_planner = FinancialPlanner.find(params[:financial_planner_id])
    @appointment = current_customer.appointments.build
    @appointments = @financial_planner.appointments
  end

  def create
    @appointment = current_customer.appointments.build(permit_params)

    if @appointment.valid?
      @appointment.save
      redirect_to root_path, notice: I18n.t('flash.appointment')
    else
      @financial_planner = FinancialPlanner.find(permit_params[:financial_planner_id])
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(parrams[:id])

    if @appointment.destroy
      redirect_to root_path, notice: I18n.t('flash.deleted', model: Appointment.model_name.human)
    else
      redirect_to root_path, notice: I18n.t('flash.already_deleted', model: Appointment.model_name.human)
    end
  end

  private

  def permit_params
    params.require(:appointment).permit(:customer_id, :financial_planner_id, :ended_at, :interview_method,
                                        :place, :appointment_date, :appointment_time, :url)
  end
end
