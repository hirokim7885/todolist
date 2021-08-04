class ListsTomorrowController < ApplicationController
    before_action :authenticate_account!
    before_action :set_task, only: %i[ show edit update destroy ]

    def index
        @tasks = current_account.tasks.where(deadline: Time.now.end_of_day..(Time.now.end_of_day + 12.months)).incomplete.order(created_at: 'desc')
    end
end