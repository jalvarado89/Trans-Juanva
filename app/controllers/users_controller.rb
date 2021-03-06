class UsersController < ApplicationController
  layout "default"
  before_action :require_user, only: [:show, :edit, :update, :destroy, :index]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params) 
    @user.companies_id = 1
    if @user.save      
      redirect_to login_path, notice: 'Exito. Su cuenta debe ser Activada. Contacte con la Empresa'
    else 
      redirect_to new_user_path, notice: 'Error. Datos no guardados'
    end 
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update    
      if @user.update(user_params)
        redirect_to users_path, notice: 'Exito. Usuario guardado'
      else
        redirect_to users_path, notice: 'Error. Datos no guardados'
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Exito. Usuario eliminado'    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:Nombre, :Apellidos, :Telefono, :email, :password_digest, :Activo, :tipo, :companies_id)
    end
end
