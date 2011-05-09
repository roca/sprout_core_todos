class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  
  respond_to :html,:xml,:json
  
def index
    respond_with(@tasks = Task.all)
end

  # GET /tasks/1
  # GET /tasks/1.xml
def show
    respond_with(@task = Task.find(params[:id]))
end
  # GET /tasks/new
  # GET /tasks/new.xml
def new
    respond_with(@task = Task.new)
end

  # GET /tasks/1/edit
def edit
    @task = Task.find(params[:id])
end

  # POST /tasks
  # POST /tasks.xml
def create
  
    @task = params[:task] ? Task.create(params[:task]) : Task.create(:description=>params[:description], :isDone=>params[:isDone], :order=>params[:order] )
    respond_with(@task)
  
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
def update
           @task = Task.find(params[:id])
           params[:task] ? @task.update_attributes(params[:task]) : @task.update_attributes(:description=>params[:description], :isDone=>params[:isDone], :order=>params[:order] )
           #@task.save
           respond_with(@task)
end

def destroy

      @task = Task.find(params[:id])
      @task.destroy
      
      
      #render(:nothing => true, :status => :ok)

       respond_with do |format|
              format.html { redirect_to(tasks_url) }
              format.xml { head :ok }
              format.json {  render(:nothing => true, :status => :ok) }
       
             end  
  
end

end
