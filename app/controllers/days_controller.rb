class DaysController < ApplicationController
  def index
    @days = Day.order("id DESC")
  end
end
