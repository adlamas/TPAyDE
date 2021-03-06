class MenusController < ApplicationController

  #before_action :authenticate_user!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /menus
  # GET /menus.json
  def index
   
    @menus = Menu.all

    # Hay que ver como hacer para obtener el dia de hoy
    @menus_del_dia = Menu.where(day: Date.today())
    @user = current_user;

  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  #   GET /menus/1/edit
  def edit

  end


  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)
    #@menu.day = Date.today() 
      
    if @menu.save();
     redirect_to @menu, notice: 'El menu se creo exitosamente.' 
    else
      redirect_to new_menu_path, notice: "Hubo un problema, inténtelo de nuevo"      
    end
    
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'El menu se actualizo exitosamente.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'El menu se elimino exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:dish, :day)
    end
end


