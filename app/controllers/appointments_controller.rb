class AppointmentsController < ApplicationController
  before_action :set_course
  
  def index
     @appointments = @doctor.appointments
    @doctors = @doctor.appointments.where(role: 'doctor')
    @clients = @doctor.appointments.where(role: 'client')
  end

  def show
  end

  def new
    @users = User.all
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.apointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(doctor)
    else
      render :new
    end
end

  def edit
  end

  def destroy
    @doctor.appointments.find(params[:id]).destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
    def set_course
      @doctor = Doctor.find(params[:doctor_id])
    end
    def appointment_params
      params.require(:appointment).permit(:role, :user_id)
    end
end
