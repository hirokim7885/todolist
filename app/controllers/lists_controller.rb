class ListsController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]

    def index
        @tasks = Task.all.order(created_at: 'desc')
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
        redirect_to @task, notice: '新規タスクを保存しました。'
        else
        render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to @task, notice: 'タスクを更新しました。'
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to lists_path, notice; 'タスクを削除しました。'
    end

    private
        def set_task
            @task = Task.find(params[:id])
        end

        def task_params
            params.require(:task).permit(:title, :body, :deadline, :priority, :category )
        end

end
