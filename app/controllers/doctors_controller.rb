class DoctorsController < ApplicationController
  
  before_action :set_doctor, only: [:show, :edit, :destroy, :update]
  
  
  def index
    @doctors = Doctor.all
  end

  def show
    @appointments = @doctor.appointments
  end

  def new
    @doctor = Doctor.new
  end

  def edit

  end

  def update
    if @doctor.update(doctor_params)
      redirect to @doctor
    else
      render :edit
    end
  end

  def create
    @doctor = Doctor.create(doctor_params)
    if @doctor.save 
      redirect_to @doctor
    else
      render :new
    end
  end
  
  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name)
  end

end
