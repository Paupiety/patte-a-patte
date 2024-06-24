class CommentsController < ApplicationController
  before_action :find_offer_of_comment
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  def create
    @comment = @offer.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @offer, notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to @offer
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @offer, notice: 'Commentaire supprimé avec succès.'
    else
      redirect_to @offer, alert: 'Erreur lors de la suppression du commentaire.'
    end
  end
end
