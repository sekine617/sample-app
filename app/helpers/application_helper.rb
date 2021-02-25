module ApplicationHelper
  def header_link_item(name, path)
    class_name = 'nav-item'
    class_name << ' active' if current_page?(path)

    content_tag :li, class: class_name do
      link_to name, path, class: 'nav-link'
    end
  end

  def time_format(int_time)
    case int_time
    when 0
      '10:00~12:00'
    when 1
      '13:00~15:00'
    when 2
      '15:00~17:00'
    when 3
      '17:00~19:00'
    end
  end
end
