class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @favorite_offers = @user.liked_offers
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "Votre profil a bien été modifié"
    else
      redirect_to 'edit'
      flash[:error] = "Une erreur a été détectée : #{@user.errors.full_messages.join(",")}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :profile_picture)
  end
end
