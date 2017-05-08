module ApplicationHelper
  def full_title title
    title.empty? ? t("title") : title + " | " + t("title")
  end

  def logged_in?
    current_user.present?
  end
  
end
