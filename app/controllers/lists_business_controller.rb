class ListsBusinessController < ApplicationController
    before_action :authenticate_account!
    before_action :set_task, only: %i[ show edit update destroy ]

    def index
        @tasks = current_account.tasks.business.incomplete.order(created_at: 'desc')
    end
end
