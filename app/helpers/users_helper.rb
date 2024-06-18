module UsersHelper
  def user_offers()
    return @user_offers = current_user.offers
  end

  def user_likes()
    return @liked_offers = current_user.likes
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :profile_picture, :phone_number)
  end
end
