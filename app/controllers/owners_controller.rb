class OwnersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def index
  end
  
  def show
    @owner = Owner.find(params[:id])
  end
  
  def new
    @owner = Owner.new
  end
  
  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash[:success] = "Account registered successfully"
      redirect_to login_url(email: params[:owner][:email], password: params[:owner][:password])
    else
      flash.now[:danger] = "Sorry, something went wrong"
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
  
  def owner_params
    params.require(:owner).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  end
end
