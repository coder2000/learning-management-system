module ApplicationHelper
  def has_extra(quiz,homework,downloadable_resources, post_link)
    content_tag :div, class: "extra" do
      if quiz || homework || downloadable_resources
        concat "Has: "
      end
      if quiz
        concat content_tag :div, "Quiz", class: "ui label"
      end
      if homework
        concat content_tag :div, "Homework", class: "ui label"
       end
      if downloadable_resources
        concat content_tag :div, "Downloadable Resources", class: "ui label"
      end
      concat content_tag :a, "View Post", class: "ui button right floated", href: post_link
    end
  end

  def ctime_ago_in_words(time_str)
    time = time_str.to_time
    if time < 2.months.ago
      time.strftime("%B %d %Y at %I:%M %p")
    else
      "#{ time_ago_in_words(time) } ago"
    end
  end

  def user_has_attachments?
    current_user.video_repositories.present?
  end

  def avatar_url(url=nil)
    if url
      url
    else
      if current_user.gender == 'female'
        'female.png'
       else
         'male.png'
      end
    end
  end

  def render_right_sidebar
    if controller.controller_name == 'posts'
      render 'posts/post_right_sidebar'
    else
      render 'right_sidebar'
    end
  end

  def truncate_content(content)
    truncate( content, length: 380, omission: "... (continued)" )
  end

  def truncate_title(title)
    truncate( title, length: 30, ommission: "..." )
  end

  def file_options(grouped_options, type)
    body = "".html_safe

    grouped_options.each do |container|
      html_attributes = option_html_attributes(container)

      label = container.title
      html_attributes = { label: label }.merge!(html_attributes)
      if type == 'video'
        html_options = container.records.where(file_type: 'video').map { |v| [ v.title, v.id ] }
      else
        html_options = container.records.where(file_type: 'application').map { |d| [ d.title, d.id ] }
      end
      body.safe_concat content_tag("optgroup".freeze, options_for_select(html_options), html_attributes)
    end
    body
  end

  def edited?(content)
    "edited" if content.created_at != content.updated_at
  end
end
