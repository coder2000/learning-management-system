module PostsHelper
  def remove_post_link(url, post_id)
    link_to "Remove", "javascript:;", class: "item remove-post", data: { remove_post_url: url, post_id: post_id, header: "Are you sure ?", content: "Are you sure you want to delete this post?" }
  end
end
