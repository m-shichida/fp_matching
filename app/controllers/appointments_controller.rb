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
    @appointment = Appointment.find(params[:id])

    if @appointment.destroy
      redirect_to root_path, notice: I18n.t('flash.deleted', model: Appointment.model_name.human)
    else
      redirect_to root_path, notice: I18n.t('flash.already_deleted', model: Appointment.model_name.human)
    end
  end

  def appointment_possible_dates
    target_date = params[:target_date].to_date
    appointments = Appointment.without_past
                              .appointed_to_fp(params[:financial_planner_id])
                              .appointed_in_target_day(target_date)
    appointment_hours = appointments.map { |a| [a.started_at.strftime('%H:%M'), a.ended_at.strftime('%H:%M')].join(' ~ ') }

    if target_date.saturday?
      render json: view_context.saturday_appointment_possible_hours - appointment_hours
    else
      render json: view_context.week_day_appointment_possible_hours - appointment_hours
    end
  end

  private

  def permit_params
    params.require(:appointment).permit(:customer_id, :financial_planner_id, :ended_at, :interview_method,
                                        :place, :appointment_date, :appointment_time, :url)
  end
end
