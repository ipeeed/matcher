class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end
  
  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    if login(email, password)
      flash[:success] = "Logged in successfully"
      redirect_to @user
    else
      flash[:danger] = 'Please verify your email address or password'
      render :new
    end
  end
  
  def destroy
    if session[:owner_id]
      session[:owner_id] = nil
      flash[:success] = 'Logged out'
      redirect_to root_url
    else
      session[:transporter_id] = nil
      flash[:success] = 'Logged out'
      redirect_to root_url
    end
  end
  
  
  private
  
  def login(email, password)
    @owner = Owner.find_by(email: email)
    @transporter = Transporter.find_by(email: email)
    if @owner && @owner.authenticate(password)
      session[:owner_id] = @owner.id
      @user = @owner
      return true
    elsif @transporter && @transporter.authenticate(password)
      session[:transporter_id] = @transporter.id
      @user = @transporter
      return true
    else
      return false
    end
  end
      
end
