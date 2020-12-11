class TransportersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def index
  end

  def show
    @transporter = Transporter.find(params[:id])
  end

  def new
    @transporter = Transporter.new
  end

  def create
    @transporter = Transporter.new(transporter_params)
    if @transporter.save
      flash[:success] = 'Account registered successfully'
      redirect_to login_path(email: params[:transporter][:email], password: params[:transporter][:password])
    else
      flash.now[:danger] = 'Sorry, something went wrong'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  
  private
  
  def transporter_params
    params.require(:transporter).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  end
end
