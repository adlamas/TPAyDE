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
	dia  = fecha_hoy.strftime("%d")
	mes  = fecha_hoy.strftime("%m")
	anio = fecha_hoy.strftime("%Y")
  

  	@comensales_date = fecha_hoy

	tipo_empleado = "Empleado"
	tipo_director = "Director"
	tipo_gerente  = "Gerente"
	tipo_invitado = "Invitado"

	limite_inicial = Time.gm(anio,mes,dia,07,00,00)
	limite_normal  = Time.gm(anio,mes,dia,11,00,00)
	limite_tarde   = Time.gm(anio,mes,dia,13,00,00)

    
    @comensales = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ?", limite_inicial, limite_tarde)
    #@comensales = Comensale.where(fecha_notificacion: DateTime.now().hour)
    #@fecha = (DateTime.now).hour
    #@fecha = @comensales.length

    @comensales_count_total  = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ?", limite_inicial, limite_tarde ).sum(:cantidad)
    @comensales_count_normal = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ?", limite_inicial, limite_normal).sum(:cantidad)
    @comensales_count_tarde  = Comensale.where("fecha_notificacion > ? and fecha_notificacion <= ?", limite_normal,  limite_tarde ).sum(:cantidad)

    @comensales_count_empleado = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ? and tipo_comensal = ?", limite_inicial, limite_tarde, tipo_empleado).sum(:cantidad)
    @comensales_count_director = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ? and tipo_comensal = ?", limite_inicial, limite_tarde, tipo_director).sum(:cantidad)
    @comensales_count_gerente  = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ? and tipo_comensal = ?", limite_inicial, limite_tarde, tipo_gerente).sum(:cantidad)
    @comensales_count_invitado_normal = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ? ", limite_inicial, limite_normal).sum(:invitados)
    @comensales_count_invitado_tardes = Comensale.where("fecha_notificacion >= ? and fecha_notificacion <= ? ", limite_normal, limite_tarde).sum(:invitados)
    @user = current_user


    respond_to do |format|
      format.html
      format.xls
    end


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
    @comensale.save()

    respond_to do |format|
      if @comensale.save
        format.html { redirect_to @comensale, notice: 'Se ha agregado una nueva entrada' }
        format.json { render :show, status: :created, location: @comensale }
      else
        format.html { render :new }
        format.json { render json: @comensale.errors, status: :unprocessable_entity, notice: 'No se pudo' }
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
      params.require(:comensale).permit(:id_legajo,:mail, :tipo_comensal, :proyecto, :fecha_notificacion, :cantidad, :invitados)
    end
end
