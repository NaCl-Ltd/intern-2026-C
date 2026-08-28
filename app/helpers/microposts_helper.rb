module MicropostsHelper
  HASHTAG_PATTERN = /#[^\s#]+/

  def highlight_hashtags(content)
    parts = content.to_s.split(/(#[^\s#]+)/)

    safe_join(
      parts.map do |part|
        if part.match?(/\A#{HASHTAG_PATTERN}\z/)
          tag_name = part.delete_prefix("#")

          link_to(
            part,
            "/tags/#{ERB::Util.url_encode(tag_name)}",
            class: "hashtag"
          )
        else
          part
        end
      end
    )
  end
end