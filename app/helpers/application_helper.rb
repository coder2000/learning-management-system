# Application helper
module ApplicationHelper
  def ctime_ago_in_words(time_str)
    time = time_str.to_time
    if time < 2.months.ago
      time.strftime('%B %d %Y at %I:%M %p')
    else
      "#{time_ago_in_words(time)} ago"
    end
  end

  def user_has_attachments?
    current_user.video_repositories.present?
  end

  def avatar_url(url = nil)
    if url
      url
    elsif current_user.gender == 'female'
      'female.png'
    else
      'male.png'
    end
  end

  def render_right_sidebar
    if controller.controller_name == 'posts'
      render 'posts/post_right_sidebar'
    else
      render 'shared/right_sidebar'
    end
  end

  def truncate_content(content)
    truncate(content, length: 380, omission: '... (continued)')
  end

  def truncate_title(title)
    truncate(title, length: 30, ommission: '...')
  end

  def file_options(grouped_options, type)
    body = ''.html_safe

    grouped_options.each do |container|
      html_attributes = option_html_attributes(container)

      label = container.title
      html_attributes = { label: label }.merge!(html_attributes)
      if type == 'video'
        html_options = container.records.where(file_type: 'video').map do |v|
          [v.title, v.id]
        end
      else
        html_options = container.records.where(file_type: 'application').map do |d|
          [d.title, d.id]
        end
      end
      body.safe_concat content_tag('optgroup'.freeze,
                                   options_for_select(html_options),
                                   html_attributes)
    end
    body
  end

  def edited?(content)
    'edited' if content.created_at != content.updated_at
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div,
                         class: "alert alert-dismissable #{bootstrap_class_for(msg_type)} fade show", role: 'alert') do
               concat content_tag(:button, icon('close'),
                                  class: 'close',
                                  data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def active?(action, controller = '')
    if params[:controller] == controller && params[:action] == action
      'active'
    else
      ''
    end
  end
end
