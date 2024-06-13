module UsersHelper

    def user_offers()
        return @user_offers = current_user.offers
      end
end
