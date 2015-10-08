class MembersController < ApplicationController

  before_action :logged_in_member_yes, only: [:show, :edit, :update, :destroy]
  before_action :correct_member, only: [:show, :edit, :update]  
  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member
    else
      render 'new'
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def index
    @members = Member.all
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      redirect_to @member
    else
      render 'edit'
    end
  end
  
  def destroy
    Member.find(params[:id]).destroy
    redirect_to memberslist_url
  end
  
  def member_params
      params.require(:member).permit(:name, :email, :password, :password_confirmation)
  end
  
    def logged_in_member_yes
      unless logged_in_member?
        redirect_to loginmember_url
      end
    end
    
    def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_url) unless @member == current_member
    end
end
