module ApplicationHelper

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

  def overview_navigation
    [
      {href: ausstellungen_page.nested_path,  coords: '176,0,325,28',    title: ausstellungen_page.path},
      {href: art_collection_page.nested_path, coords: '342,25,488,54',   title: art_collection_page.path},
      {href: sonstiges_page.nested_path,      coords: '155,213,265,241', title: sonstiges_page.path},
      {href: biographie_page.nested_path,     coords: '401,222,521,248', title: biographie_page.path},
    ]
  end

  private

  def ausstellungen_page
    @ausstellungen_page ||= Refinery::Page.by_title('ausstellungen').first
  end

  def art_collection_page
    @art_collection_page ||= Refinery::Page.by_title('art').first
  end

  def sonstiges_page
    @sonstiges_page ||= Refinery::Page.by_title('biographie').first
  end

  def biographie_page
    @biographie_page ||= Refinery::Page.by_title('info').first
  end


end
