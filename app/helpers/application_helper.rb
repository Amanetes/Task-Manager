module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Менеджер задач' # TODO: вынести в локаль
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def flash_class(level)
    mapping = {
      success: 'alert-success',
      notice: 'alert-info',
      alert: 'alert-danger',
      error: 'alert-danger',
      warn: 'alert-warning'
    }
    mapping[level.to_sym]
  end
end
