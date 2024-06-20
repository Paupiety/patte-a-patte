module CommentsHelper
  def find_offer_of_comment
    @offer = Offer.find(params[:offer_id])
  end

  def set_comment
    @comment = @offer.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :content)
  end

  def authorize_user!
    unless @comment.user == current_user
      redirect_to @offer, alert: 'Vous n\'êtes pas autorisé à supprimer ce commentaire.'
    end
  end
end
