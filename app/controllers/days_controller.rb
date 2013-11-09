class DaysController < ApplicationController
  DAYS_PER_PAGE = 14

  def index
    before = params[:before]

    today = Date.today

    @start_on = before.present? ? Date.parse(before) : today
    @end_on   = @start_on - (DAYS_PER_PAGE - 1)

    @newer = (@start_on >= today - 1) ? nil : [@start_on + DAYS_PER_PAGE, today].min
    @older = @end_on - 1

    @day_count = Day.count

    @days = (@end_on..@start_on).to_a.reverse.map { |date|
      Hashie::Mash.new({ date: date, day: Day.find_by_date(date) })
    }
  end

  def search
    @query = params[:q]
    result = Day.search(note_cont: @query).result
    @result_count = result.count

    @days = result.map { |d|
      Hashie::Mash.new({ date: d.date, day: d })
    }
  end

  def show
  end

  def create
    day = Day.new(params.require(:day).permit(:date, :note))

    if day.save
      render json: {
        html:  render_to_string(partial: "days/single", as: :day, object: day, locals: { date: day.date }),
        count: Day.count
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
