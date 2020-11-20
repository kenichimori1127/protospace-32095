class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = current_user
    @prototypes = @user.prototypes
  end
end
