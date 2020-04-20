module ApplicationHelper
  def dj_announce(sched_date)
    if sched_date.no_dance_church
      'No Dance Church Today!'
    else 
      sched_date.dj&.name
    end
  end

  def day_announce(sched_date)
    sched_date.date.strftime("%D")
  end

  def flash_class(level)
    case level
    when 'notice'  then 'message is-info'
    when 'success' then 'message is-success'
    when 'error'   then 'message is-danger'
    when 'alert'   then 'message is-warning'
    end
  end
end
