class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :show, :new]
  before_action :authenticate_user_edit, only: [:edit, :update]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      puts "Tu as réussi"
      redirect_to gossips_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "ca ne fontionne pas"
      render new_gossip_path
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_user = @gossip.user

    if @gossip.update(gossip_params)
      redirect_to gossip_path
    else
      render edit_gossip_path
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    gossip_user = @gossip.user

    if current_user == gossip_user
      @gossip.destroy
      redirect_to gossips_path
    else
      puts "pas possible"
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
