class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @todos = Todo.all
  end

  def insert
    
  end

  def home
  end

  def createactivity
    info = params[:t]
    record = Activity.new(job:params[:t])
    record.save
    info = 1
    render :text => record.to_json.to_s
  
  end

  def deleteactivity
    id = params[:id]
    record = Activity.find(id)
    record.destroy
    #info = 1
    render :text => id.to_json.to_s 
  end

  def listactivities
 users = Activity.all
  render :text => users.to_json.to_s

  end


  def verify
    
    @records = User.all
    @records.each do |record| 
      info = info + ":" + record.task + "," + record.status
    end
        render :text => @records.to_json.to_s
      #render :json { :success => 1 , :info => @info }    
  end
  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  def login
  
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    @todo.save
    #render json: { :success => 1, :todo => @todo } 
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:task, :status, :createdAt, :completedAt)
    end
end
