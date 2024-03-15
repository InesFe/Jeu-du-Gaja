class ArretsController < ApplicationController
  before_action :set_arret, only: %i[ show edit update destroy ]

  def index
    @arrets = Arret.all
  end

  def show
    @arret = Arret.find(params[:id])
  end

  def new
    @arret = Arret.new
  end

  def edit
  end

  def create
    @arret = Arret.new(arret_params)

    respond_to do |format|
      if @arret.save
        format.html { redirect_to arret_url(@arret), notice: "Arrêt ajouté à la liste" }
        format.json { render :show, status: :created, location: @arret }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @arret.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @arret.update(arret_params)
        format.html { redirect_to arret_url(@arret), notice: "Arrêt mis à jour" }
        format.json { render :show, status: :ok, location: @arret }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @arret.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @arret.destroy

    respond_to do |format|
      format.html { redirect_to arrets_url, notice: "Arrêt supprimé" }
      format.json { head :no_content }
    end
  end

  private
    def set_arret
      @arret = Arret.find(params[:id])
    end

    def arret_params
      params.require(:arret).permit(:name, :year, :apport)
    end
end