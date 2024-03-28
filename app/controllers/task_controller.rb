class TasklistStatus
    # Define enum values as constants
    WIP = :wip
    COMPLETED = :completed
  
    # Define an array of all enum values
    VALUES = [WIP, COMPLETED].freeze
end

class TaskController < ApplicationController
end
