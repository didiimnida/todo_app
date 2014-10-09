class TodosController < ApplicationController
  include TodosHelper
  def index
  	#@todos = Todo.all #ALL USERS.  
    @todos = current_user.todos
  end

  def new 
  	@todo = Todo.new
    #Not using this method anymore. Just for testing. 
  end

  def create
  	#@todo = Todo.new(todo_params) #ANY NEW.
    #@todo.user_id = session[:current_user_id] #ADD USER_ID. 

    @todo = current_user.todos.new(todo_params)
    @todo.completed = false
    @todo.delivered = false
    day = params[:todo][:day].to_i
    hour = params[:todo][:hour].to_i
    minute = params[:todo][:minute].to_i
    month = params[:todo][:month].to_i
    year = params[:todo][:year].to_i

    date = DateTime.new(year, month, day, hour, minute)
    # @todo.send = date
    # @todo.send = "2014-10-09 21:36:27"

    respond_to do |format|
  		if @todo.save
        format.html{redirect_to todos_path}
        format.json{render json: @todo}
  		else
  			format.html{render :new}
        format.json{render json: @todo.errors, status: :unprocessable_entity}
  		end
    end
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.completed = params[:todo][:completed]
    @todo.delivered = true
    if @todo.save
      render json: @todo
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private
  def todo_params
  	params.require(:todo).permit(:description)
  end
end

