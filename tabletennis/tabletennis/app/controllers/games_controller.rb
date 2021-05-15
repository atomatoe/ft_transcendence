class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:show]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
  end

  def create
    game = Game.new(game_params)
    
    if game.save
      redirect_to game, notice: "Game successfully created"
    else
      redirect_to new_game_path, alert: "#{game.errors.full_messages.join('; ')}"
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def game_params
    p params
    p params.require(:game).permit(:name, :background)
  end
end
