class LikeController < ApplicationController
  before_action :authenticate_user, only: [:destroy, :create]

  def show
    @like = Like.new
  end

  def create
    @like = Like.new(gossip_id: params[:id], user_id: current_user.id)

    if @like.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      puts "Tu as réussi"
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "ca ne fontionne pas"
      redirect_to gossips_path
    end
  end

  def destroy
    @like = Like.find(params[:id])
    like_user = @like.user

    if current_user == like_user
      @like.destroy
      redirect_to gossips_path
    else
      puts "pas possible"
      redirect_to gossips_path
    end
  end
end
