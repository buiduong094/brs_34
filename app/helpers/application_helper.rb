module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def localize_time datetime
    datetime.strftime t :"time.formats.default", {locale: I18n.locale}
  end

  def index_in_list  index, per_page
    params[:page] ||= "1"
    1 + index + (params[:page].to_i - 1) * per_page
  end
end
