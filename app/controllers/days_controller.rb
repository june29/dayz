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

  def show
  end

  def create
    day = Day.new(params.require(:day).permit(:date, :note))

    if day.save
      render json: {
        html: render_to_string(partial: "days/single", as: :day, object: day, locals: { date: day.date })
      }
    else
      head 500
    end
  end

  def update
    day = Day.find_by_date(params[:date])

    if day.update(params.require(:day).permit(:note))
      render json: {
        html: render_to_string(partial: "days/single", as: :day, object: day, locals: { date: day.date })
      }
    else
      head 500
    end
  end
end
