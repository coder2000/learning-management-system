# Posts Helper
module PostsHelper
  def extra?(quiz, homework, resources, post_link)
    content_tag :div, class: 'extra' do
      concat 'Has: ' if quiz || homework || resources
      quiz_tag(quiz)
      homework_tag(homework)
      resources_tag(resources)
      concat content_tag :a, 'View Post',
                         class: 'btn btn-info float-right btn-sm',
                         href: post_link
    end
  end

  def quiz_tag(quiz)
    concat content_tag :div, 'Quiz', class: 'ui label' if quiz
  end

  def homework_tag(homework)
    concat content_tag :div, 'Homework', class: 'ui label' if homework
  end

  def resources_tag(resources)
    if resources
      concat content_tag :div, 'Downloadable Resources', class: 'ui label'
    end
  end
end
