module ApplicationHelper
  def bootstrap_alert_class(key)
    case key.to_sym
    when :success then 'alert-success'
    when :error then 'alert-danger'
    when :alert then 'alert-warning'
    when :notice then 'alert-info'
    else "alert-#{key}"
    end
  end
end
