module SessionsHelper
  def current_owner
    @current_owner ||= Owner.find_by(id: session[:owner_id])
  end
  
  def current_transporter
    @current_transporter ||= Transporter.find_by(id: session[:transporter_id])
  end
  
  def logged_in_as_owner
    !!current_owner
  end
  
  def logged_in_as_transporter
    !!current_transporter
  end
end
