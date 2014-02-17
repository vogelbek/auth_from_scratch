class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:username]
    if @user.save
      redirect_to root_path, notice: 'Signed Up!'
    else
      render 'new'
    end
  end
end
