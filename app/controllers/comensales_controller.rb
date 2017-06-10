class ComensalesController < ApplicationController
  before_action :set_comensale, only: [:show, :edit, :update, :destroy]

  # GET /comensales
  # GET /comensales.json
  def index
    @comensales = Comensale.all
    @comensales_count = Comensale.group(:tipo_comensal).sum(:cantidad)
  end

  # GET /comensales/1
  # GET /comensales/1.json
  def show
  end

  # GET /comensales/new
  def new
    @comensale = Comensale.new
  end

  # GET /comensales/1/edit
  def edit
  end

  # POST /comensales
  # POST /comensales.json
  def create
    @comensale = Comensale.new(comensale_params)

    respond_to do |format|
      if @comensale.save
        format.html { redirect_to @comensale, notice: 'Comensale was successfully created.' }
        format.json { render :show, status: :created, location: @comensale }
      else
        format.html { render :new }
        format.json { render json: @comensale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comensales/1
  # PATCH/PUT /comensales/1.json
  def update
    respond_to do |format|
      if @comensale.update(comensale_params)
        format.html { redirect_to @comensale, notice: 'Comensale was successfully updated.' }
        format.json { render :show, status: :ok, location: @comensale }
      else
        format.html { render :edit }
        format.json { render json: @comensale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comensales/1
  # DELETE /comensales/1.json
  def destroy
    @comensale.destroy
    respond_to do |format|
      format.html { redirect_to comensales_url, notice: 'Comensale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comensale
      @comensale = Comensale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comensale_params
      params.require(:comensale).permit(:id_legajo, :mail, :tipo_comensal, :proyecto, :fecha_notificacion, :cantidad)
    end
end
