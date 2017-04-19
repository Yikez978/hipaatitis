class AppointmentsController < ApplicationController
  before_action :find_appointment, except: :index

  def index
    @month = (params[:month] ? Date.parse(params[:month]) : Date.current).beginning_of_month

    @appointments = Appointment.where(when: @month.beginning_of_month..@month.end_of_month)
  end

  def show

  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
end
