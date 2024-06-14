module CommentsHelper

  def find_offer_of_comment
    @offer = Offer.find(params[:offer_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end
