class AtraccionsController < ApplicationController
  before_action :set_atraccion, only: [:show, :edit, :update, :destroy]

  # GET /atraccions
  # GET /atraccions.json
  def index
    @atraccions = Atraccion.all
  end

  # GET /atraccions/1
  # GET /atraccions/1.json
  def show
  end

  # GET /atraccions/new
  def new
    @atraccion = Atraccion.new
  end

  # GET /atraccions/1/edit
  def edit
  end

  # POST /atraccions
  # POST /atraccions.json
  def create
    @atraccion = Atraccion.new(atraccion_params)
    @atraccion.pause = false
    @atraccion.save

    respond_to do |format|
      if @atraccion.save
        format.html { redirect_to @atraccion, notice: 'Atraccion was successfully created.' }
        format.json { render :show, status: :created, location: @atraccion }
      else
        format.html { render :new }
        format.json { render json: @atraccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atraccions/1
  # PATCH/PUT /atraccions/1.json
  def update
    respond_to do |format|
      if @atraccion.update(atraccion_params)
        format.html { redirect_to @atraccion, notice: 'Atraccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @atraccion }
      else
        format.html { render :edit }
        format.json { render json: @atraccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atraccions/1
  # DELETE /atraccions/1.json
  def destroy
    @atraccion.destroy
    respond_to do |format|
      format.html { redirect_to atraccions_url, notice: 'Atraccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atraccion
      @atraccion = Atraccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atraccion_params
      params.require(:atraccion).permit(:nombre_atc, :descripcion_atc, :imagen_atc, :capacidad_atc, :latitude, :longitude, :image)
    end
end
