module UsersHelper

    def user_offers()
        return @user_offers = current_user.offers
      end

      def user_likes()
        puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{@liked_offers}"
        return @liked_offers = current_user.likes
      end
end
