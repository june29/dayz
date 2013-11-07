class DaysController < ApplicationController
  def index
    @days_count = Day.count
  end
end
