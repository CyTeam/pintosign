module ApplicationHelper
  def search_page_form
  end

  def head_image
    image_key  = head_images.keys[rand(head_images.length)]
    image_path = head_images[image_key]

    content_tag(:div, id: 'image', class: 'container-fluid') do
      html_content = content_tag(:div, class: 'row-fluid') do
        image_tag image_path, alt: image_key
      end

      html_content << content_tag(:div, class: 'row-fluid') do
        content_tag(:div, class: 'span3 offset9 text-right') do
          content_tag(:blockquote, class: 'pull-right') do
            content_tag(:p, image_key)
          end
        end
      end

      html_content
    end
  end

  def head_images
    @head_images ||= Hash[
      Dir["#{Rails.root}/public/images/head/*.{png,jpg}"].map do |file|
        [File.basename(file, File.extname(file)), file.sub(Rails.root.to_s + '/public', '')]
      end
    ]
  end

end
