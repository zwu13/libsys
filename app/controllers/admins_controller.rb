class AdminsController < ApplicationController
  
  before_action :logged_in_admin, only: [:show, :edit, :update, :destroy]
  before_action :correct_admin, only: [:show, :edit, :update]
  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to @admin
    else
      render 'new'
    end
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      redirect_to @admin
    else
      render 'edit'
    end
  end
  
  def index
    @admins = Admin.all
  end

  def destroy
    if ( params[:id].to_i != 1 ) && (Admin.find(params[:id]) != current_admin)
      Admin.find(params[:id]).destroy
    end
    redirect_to admins_url
  end

  private
  
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
    
    def logged_in_admin
      unless logged_in?
        redirect_to login_url
      end
    end
    
    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless @admin == current_admin
    end
end
