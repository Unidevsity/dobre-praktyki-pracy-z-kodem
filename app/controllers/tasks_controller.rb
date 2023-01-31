class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.where(completed: false)
    @completed_tasks = current_user.tasks.where(completed: true)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.new
    if @task.save!
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('new_task', partial: "tasks/form", locals: { task: current_user.tasks.new })
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('new_task', partial: "tasks/form", locals: { task: @task })
        end
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    @task.update(task_params)

    respond_to do |format|
      format.turbo_stream do
        if @task.completed
          render turbo_stream: [
            turbo_stream.remove(@task),
            turbo_stream.append("completed_tasks", partial: "tasks/task", locals: { task: @task })
          ]
        else
          render turbo_stream: [
            turbo_stream.remove(@task),
            turbo_stream.append("tasks", partial: "tasks/task", locals: { task: @task })
          ]
        end
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
