class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @prototypes = Prototype.all
  end

  def new
    @Prototype = Prototype.new
  end

  def create

  end

  def show
    
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
    
    def message_params
      params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    end
  end
end

