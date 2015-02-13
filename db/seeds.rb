# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

home_page                 = Refinery::Page.find_by_slug('home')
home_page.layout_template = "intro"
home_page.save!

Refinery::Page.find_by_slug('about').try(:destroy)

pinto = Refinery::Page.create!(
  title:    "pinto",
  link_url: "/",
  parent:   home_page,
)

ausstellungen = Refinery::Page.create!(
  title:               "ausstellungen",
  skip_to_first_child: true,
  parent:              home_page,
)

univers = Refinery::Page.create!(
  title:  "universum von pinto",
  parent: ausstellungen,
  menu_title: "• universum von pinto",
)

ankenwaage = Refinery::Page.create!(
  title:  "ankenwaage",
  parent: ausstellungen,
  menu_title: "• ankenwaage",
)

potz = Refinery::Page.create!(
  title:  "potz 1000",
  parent: ausstellungen,
  menu_title: "• potz 1000",
)

ue50art = Refinery::Page.create!(
  title:  "ue50 art",
  parent: ausstellungen,
  menu_title: "• ue50 art",
)

art = Refinery::Page.create!(
  title:               "art",
  skip_to_first_child: true,
  parent:              home_page,
)

rigi = Refinery::Page.create!(
  title:  "rigi",
  parent: art,
  menu_title: "• rigi",
)

sonnwende = Refinery::Page.create!(
  title:  "sonnwende",
  parent: art,
  menu_title: "• sonnwende",
)

wikisigns_digital = Refinery::Page.create!(
  title:  "wikisigns digital",
  parent: art,
  menu_title: "• wikisigns digital",
)

wikisigns_analog = Refinery::Page.create!(
  title:  "wikisigns analog",
  parent: art,
  menu_title: "• wikisigns analog",
)

biographie = Refinery::Page.create!(
  title:  "biographie",
  parent: home_page,
)

info = Refinery::Page.create!(
  title:               "info",
  skip_to_first_child: true,
  parent:              home_page,
)

impressum = Refinery::Page.create!(
  title:  "impressum",
  parent: info,
  menu_title: "• impressum",
)

presse = Refinery::Page.create!(
  title:  "presse",
  parent: info,
  menu_title: "• presse",
)
