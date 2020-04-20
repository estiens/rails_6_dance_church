class HomeController < ApplicationController
  def index
    @first_scheduled_date = ScheduledDate.next
    @second_scheduled_date = ScheduledDate.second
    @third_scheduled_date = ScheduledDate.third
  end
end
