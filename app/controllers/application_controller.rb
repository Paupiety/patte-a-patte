class ApplicationController < ActionController::Base
  include OffersHelper
  include CartsHelper
  include UsersHelper
  include CategoriesHelper
  include CommentsHelper
  include PetsHelper
  include TypeoffersHelper
  include CheckoutHelper
end
