class CommentsController < ApplicationController
  before_action :find_offer_of_comment
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
end