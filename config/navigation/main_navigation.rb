SimpleNavigation::Configuration.run do |navigation|

  navigation.id_generator = Proc.new {|key| "main-navigation-#{key}"}

  navigation.items do |primary|

    primary.dom_class = 'nav nav-pills nav-stacked'

    primary.item 'pinto', 'pinto', root_path

    Kuhsaft::Page.find_by(slug_de: 'pinto').children.published.translated.each do |page|
      primary.item "navbar-item-#{page.id}", page.title, page.link do |sub_item|
        # build second level
        page.children.published.translated.each do |subpage|
          sub_item.item subpage.id, subpage.title, subpage.link
        end
      end
    end

    # primary.item '', 'Sprache', '#', class: 'language icon has-dropdown'do |language|
    #   I18n.available_locales.each do |locale|
    #     language.dom_class = 'dropdown'
    #     language.item locale, language_text(locale), language_link(params[:url], locale), highlights_on: Proc.new { I18n.locale == locale }, class: "icon lang-#{locale}"
    #   end
    # end
  end
end
