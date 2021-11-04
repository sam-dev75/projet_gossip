class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def authenticate_user_edit
    gossip_user = Gossip.find(params[:id]).user
    unless current_user == gossip_user
      flash[:danger] = "Tu n'est pas la bonne personne !"
      redirect_to gossips_path
    end
  end
end
