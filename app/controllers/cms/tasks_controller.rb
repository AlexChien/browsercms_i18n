class Cms::TasksController < Cms::BaseController
  
  before_filter :set_toolbar_tab
  before_filter :load_page, :only => [:new, :create]
  
  verify :method => :put, :action => :complete
  
  def new
    @task = @page.tasks.build(:assigned_by => current_user)
  end
  
  def create
    @task = @page.tasks.build(params[:task])
    @task.assigned_by = current_user
    if @task.save
      flash[:notice] = "Page was assigned to '#{@task.assigned_to.login}'"
      redirect_to @page.path
    else
      render :action => 'new'
    end
  end
  
  def complete
    @task = Task.find(params[:id])
    if @task.assigned_to == current_user
      if @task.mark_as_complete!
        flash[:notice] = "Task was marked as complete"
      end
    else
      flash[:error] = "You cannot complete tasks that are not assigned to you"
    end
    redirect_to @task.page.path
  end
  
  private
    def load_page
      @page = Page.find(params[:page_id])
    end
  
    def set_toolbar_tab
      @toolbar_tab = :sitemap
    end  
  
end