module ApplicationHelper

  def head_image
    page_image =  Refinery::ImagePage.where(page: images_page).order("rand()").first

    content_tag(:div, id: 'image', class: 'container-fluid') do
      html_content = content_tag(:div, class: 'row-fluid') do
        image_tag page_image.image.thumbnail(geometry: "1920x100#se").url, alt: page_image.image.image_title
      end

      html_content << content_tag(:div, class: 'row-fluid') do
        content_tag(:div, class: 'offset9 text-right') do
          content_tag(:blockquote, id: "querbilder-quote", class: 'pull-right') do
            content_tag(:p, page_image.image.image_title)
          end
        end
      end

      html_content
    end
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

  def images_page
    @images_page ||= Refinery::Page.where(title: "querbilder")
  end

  def ausstellungen_page
    @ausstellungen_page ||= Refinery::Page.by_title('ausstellungen').first
  end

  def art_collection_page
    @art_collection_page ||= Refinery::Page.by_title('art').first
  end

  def sonstiges_page
    @sonstiges_page ||= Refinery::Page.by_title('info').first
  end

  def biographie_page
    @biographie_page ||= Refinery::Page.by_title('biographie').first
  end


end
