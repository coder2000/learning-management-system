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
      concat content_tag :a, "View Post", class: "ui button green right floated", href: post_link
    end
  end
end
