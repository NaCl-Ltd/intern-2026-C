module MicropostsHelper
  def highlight_hashtags(content)
    content.to_s.gsub(/(#[^\s#]+)/) do |hashtag|
      link_to hashtag, "/tags/#{ERB::Util.url_encode(hashtag.delete_prefix('#'))}", class: "hashtag"
    end.html_safe
  end
end