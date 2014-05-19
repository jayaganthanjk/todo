class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 skip_before_filter :verify_authenticity_token, :only => [:verify]
  # GET /users
  # GET /users.json
  def index
    if session[:username] == "jayaganthanjk@gmail.com"
    @users = User.all
  else
    render "secured"
  end
  end
def secured
end

def populate
  users = User.all
  render :text => users.to_json.to_s
end

  def login
    if session[:username] != nil 
      redirect_to '/todos/new'
    else
      render 'login'
    end      
    
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  def admin
    if session[:username] == "jayaganthanjk@gmail.com"
    @users=User.all
    render 'index'
  else
    redirect_to '/todos/new'
  end
    #redirect_to '/todos/new'
  end

  def verify
    mail = params[:mailid]
    password = params[:password]
    record=User.find_by_mailid(mail)
    if record.password == password
       #@pass=true
       session[:username] = mail
       redirect_to '/todos/new'
    else 
      render 'login'
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  def logout
    session[:username] = nil
    render 'login'
  end

  # POST /users
  # POST /users.json
  def create
    if session[:username] == nil 
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    else
    redirect_to '/todos/new'
  end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:mailid, :password)
    end
end
