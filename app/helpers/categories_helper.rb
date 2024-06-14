module CategoriesHelper
  def find_category
    @category = Category.find(params[:id])
  end
    
  def category_params
    params.require(:category).permit(:type_animal)
  end

  def authenticate_admin_user!
    unless current_user.admin?
      redirect_to root_path
      flash[:error] = "Accès refusé"
    end
  end
end