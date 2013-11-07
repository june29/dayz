class DaysController < ApplicationController
  DAYS_PER_PAGE = 10

  def index
    @days_count = Day.count

    today        = Date.today
    ten_days_ago = today - (DAYS_PER_PAGE - 1)

    @days = (ten_days_ago..today).to_a.reverse.map { |date|
      Hashie::Mash.new({ date: date, day: Day.find_by_date(date) })
    }
  end
end
