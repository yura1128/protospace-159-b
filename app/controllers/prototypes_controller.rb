class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
    def prototype_params
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    end
  
end

