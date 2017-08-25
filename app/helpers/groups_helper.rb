# Groups Helper
module GroupsHelper
  def remove_user_link(url, user_id, &block)
    link_to 'javascript:;',
            class: 'remove-user-button',
            data:  { remove_user_url: url,
                     user: user_id,
                     header: 'Remove the user to the group?',
                     content: 'Are you sure you wnat to remove the user from the group?' } do
      content_tag :div, class: 'ui basic red button right floated compact', id: 'decline-button' do
        'Remove'
      end
    end
  end
end
