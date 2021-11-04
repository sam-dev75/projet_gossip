class CommentController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(content: params[:content], user_id: current_user.id, gossip_id: params[:id]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @comment.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      puts "Tu as réussi"
      redirect_to gossip_path(params[:id])
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "ca ne fontionne pas"
      redirect_to "/"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
        redirect_to "/"
    else
        render :edit
    end
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to "/"
  end

  private

  def comment_params
      comment_params = params.require(:comment).permit(:content)
  end
end
