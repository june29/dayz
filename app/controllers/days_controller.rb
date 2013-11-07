class DaysController < ApplicationController
  DAYS_PER_PAGE = 14

  def index
    @days_count = Day.count

    start_on = Date.today
    end_on   = start_on - (DAYS_PER_PAGE - 1)

    @days = (end_on..start_on).to_a.reverse.map { |date|
      Hashie::Mash.new({ date: date, day: Day.find_by_date(date) })
    }
  end
end
