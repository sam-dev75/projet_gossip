class UserController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @city = City.all.sample.id
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], city_id: @city, password: params[:pass_first], password_confirmation: params[:pass_second]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @user.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      log_in(@user)
      puts "Tu as réussi"
      redirect_to "/"
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "ca ne fontionne pas"
      render new_user_path
    end
  end
end
