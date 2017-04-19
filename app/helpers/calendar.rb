# static functions to build interesting calendars
module Calendar
  module_function

  def beginning_of_calendar(date = Date.current)
    begin_date = date.beginning_of_month.beginning_of_week
    begin_date.month == date.month ? (begin_date + 1.week) : begin_date
  end

  def end_of_calendar(date = Date.current)
    end_date = date.end_of_month.end_of_week
    end_date.month == date.month ? end_date + 1.week : end_date
  end

  def days_of_week(format: '%A')
    date = Date.current.beginning_of_week
    (date..(date + 6.days)).map { |m| m.strftime(format) }
  end

  def group_by_week(range)
    range.group_by{|g| (g + 1.day).cweek}
  end

  def display_long(time)
    time.try(:strftime, "%A, %B #{time.day.ordinalize}, %Y %I:%m %p")
  end
end
