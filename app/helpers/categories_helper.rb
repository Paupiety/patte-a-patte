module CategoriesHelper
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:type_animal)
  end
end
