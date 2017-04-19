class AppointmentsController < ApplicationController
  before_action :find_appointment, except: :index

  def index
    @appointments = Appointment.all
  end

  def show
  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
end
