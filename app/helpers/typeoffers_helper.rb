module TypeoffersHelper
  def find_type_offer
    @type_offer = Typeoffer.find(params[:id])
  end

  def type_offer_params
    params.require(:type_offer).permit(:type_offer)
  end
end