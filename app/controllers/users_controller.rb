class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @favorite_offers = @user.liked_offers
    @pets = @user.pets
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
end
