class UsersController < ApplicationController
  
  before_action :set_user, only; [:show, :edit, :destroy, :update]
  
  
  def index
    

  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  
  end

  def create
    @user = User.new [user_params]
    if @user.save 
      redirect_to @user
    else
      render :new
    end
  end

  # def update
  #   if @doctor.update(doctor_params)
  #     redirect to @doctor
  #   else
  #     render :edit
  #   end
  # end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require (:user).permit(:first_name, last_name)
  end

end
