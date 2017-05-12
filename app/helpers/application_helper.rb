module ApplicationHelper
  def full_title title
    title.empty? ? t("title") : title + " | " + t("title")
  end

  def logged_in?
    current_user.present?
  end

  def avatar_profile user
    if user && user.avatar_url
      user.avatar_url
    else
      "#{user.sex}.png"
    end
  end

  def user_reply_comment comment
    if comment
      comment_reply = comment.reply
      if comment_reply && comment_reply.user != comment.user
        link_to comment_reply.user.name, comment_reply.user
      end
    end
  end
end
