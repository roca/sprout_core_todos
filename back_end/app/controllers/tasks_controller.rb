class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  
  respond_to :html, :xml ,:json
  
def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
      tasks = @tasks.map {|task| json_for_task(task) }
      format.json { render :json => { :content => tasks }  }
      
    end
end

  # GET /tasks/1
  # GET /tasks/1.xml
def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
      format.json do
              render :json => {:content => json_for_task(@task),:location => task_path(@task)}
      
      end
    end
end
  # GET /tasks/new
  # GET /tasks/new.xml
def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
      format.json do
              render :json => {
                :content => json_for_task(@task),
                :location => task_path(@task)
              }
      end        
    end
end

  # GET /tasks/1/edit
def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to(@task, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
        format.json do
                  render :json => { :content => json_for_task(@task) }, :status => :created,
                                    :location => task_path(@task)
        end
        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
        format.json do
                  render :json => { :content => json_for_task(@task) }, :location => task_path(@task)
        end
        
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
       
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
      format.json { head :ok }
      
    end
  end
  
  
  protected
    def json_for_task(task)
      { :guid => task_path(task),
        :description => task.description,
        :isDone => task.isDone
      }
    end
  
end
