module WelcomeHelper

  def overview_navigation
    [
      {href: ausstellungen_page.link,  coords: '176,0,325,28',    title: ausstellungen_page.title},
      {href: art_collection_page.link, coords: '342,25,488,54',   title: art_collection_page.title},
      {href: sonstiges_page.link,      coords: '155,213,265,241', title: sonstiges_page.title},
      {href: biographie_page.link,     coords: '401,222,521,248', title: biographie_page.title},
    ]
  end

  def ausstellungen_page
    @ausstellungen_page ||= Kuhsaft::Page.where(title_de: 'ausstellungen').first
  end

  def art_collection_page
    @art_collection_page ||= Kuhsaft::Page.where(title_de: 'art').first
  end

  def sonstiges_page
    @sonstiges_page ||= Kuhsaft::Page.where(title_de: 'info').first
  end

  def biographie_page
    @biographie_page ||= Kuhsaft::Page.where(title_de: 'biographie').first
  end

end
