class ComensalesController < ApplicationController
  before_action :set_comensale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /comensales
  # GET /comensales.json
  def index
  	
 
	# strftime - formatear tiempo (stringfy time)
	# %d - día (day)
	# %m - mes (month)
	# %Y - año (year)
	# %H - hora en formato 24 horas (hour)
	# %M - minuto
	# %S - segundo (second)
  fecha_hoy = Date.today()
	dia = fecha_hoy.strftime("%d")
	mes = fecha_hoy.strftime("%m")
	anio = fecha_hoy.strftime("%Y")
  

	limite_normal = Time.gm(anio,mes,9,21,53,00)
	limite_tarde = Time.gm(anio,mes,10,21,58,00)


    @comensales = Comensale.all()
    #@comensales = Comensale.where(fecha_notificacion: DateTime.now().hour)
    #@fecha = (DateTime.now).hour
    #@fecha = @comensales.length

    @comensales_count_normal = Comensale.where("fecha_notificacion < ? ", limite_normal).group(:tipo_comensal).sum(:cantidad)
    @comensales_count_tarde = Comensale.where("fecha_notificacion > ? and fecha_notificacion < ?", limite_normal, limite_tarde).group(:tipo_comensal).sum(:cantidad)
    @comensales_count_tardes = Comensale.where("fecha_notificacion > ?", limite_normal).group(:tipo_comensal).sum(:cantidad)
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
        format.html { redirect_to @comensale, notice: 'Se ha agregado una nueva entrada' }
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
      params.require(:comensale).permit(:mail, :tipo_comensal, :proyecto, :fecha_notificacion, :cantidad)
    end
end
