class CommentsController < ApplicationController
  before_action :set_offer
  before_action :authenticate_user!

  def create
    @comment = @offer.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @offer, notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to @offer
    end
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :content)
  end
end
