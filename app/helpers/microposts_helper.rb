module MicropostsHelper
  def highlight_hashtags(content)
    content.to_s.gsub(/(#[^\s#]+)/) do |hashtag|
      content_tag(:span, hashtag, class: "hashtag")
    end.html_safe
  end
end