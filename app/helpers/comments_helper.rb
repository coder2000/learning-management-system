# Comments Helper
module CommentsHelper
  def render_form(post, comment, remote=true)
    render("comments/form", group: post.group, post: post, comment: comment, remote: remote)
  end
end
