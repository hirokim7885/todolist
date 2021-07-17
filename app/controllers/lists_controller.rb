class ListsController < ApplicationController
    before_action :set_task, only: %i[ show edit update destroy ]

    def index
        @tasks = current_account.tasks.all.order(created_at: 'desc')
    end

    def show
        @task = current_account.tasks.find(params[:id])
    end

    def new
        @task = current_account.tasks.new
    end

    def create
        @task = current_account.tasks.new(task_params)
        if @task.save
            redirect_to list_path(@task), notice: '新規タスクを保存しました。'
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @task = current_account.tasks.find(params[:id])
    end

    def update
        @task = current_account.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to list_path(@task), notice: 'タスクを更新しました。'
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @task = current_account.tasks.find(params[:id])
        @task.destroy
        redirect_to lists_path, notice; 'タスクを削除しました。'
    end

    private
        def set_task
            @task = current_account.tasks.find(params[:id])
        end

        def task_params
            params.require(:task).permit( :title, :body, :deadline, :priority_id, :category )
        end
end