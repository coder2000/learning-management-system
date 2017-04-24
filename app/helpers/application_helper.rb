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
    current_user.video_repositories.present? || current_user.files.present?
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
end
