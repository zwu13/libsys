class SessionmembersController < ApplicationController
  
  def new
  end
  
  def create
    member = Member.find_by(email: params[:sessionmember][:email].downcase)
    if member && member.authenticate(params[:sessionmember][:password])
      log_in_member member
      redirect_to member
    else
     render 'new'
    end
  end
 
  def destroy
    log_out_member
    redirect_to root_url
  end
end
