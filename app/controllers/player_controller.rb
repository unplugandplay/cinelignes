class PlayerController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /player
  # GET /player.json
  def index
    @player = Player.all
  end

  # GET /player/1
  # GET /player/1.json
  def show
  end

  # GET /player/new
  def new
    @player = Player.new
  end

  # GET /player/1/edit
  def edit
  end

  # POST /player
  # POST /player.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player/1
  # PATCH/PUT /player/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player/1
  # DELETE /player/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to player_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.fetch(:player, {})
    end
end
