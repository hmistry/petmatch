module ApplicationHelper
  def flash_class(level)
    { "success" => "alert-success", "notice" => "alert-info", "error" => "alert-danger", "alert" => "alert-warning" }[level] || level.to_s
  end

end
