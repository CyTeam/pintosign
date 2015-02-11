# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

home_page                 = Refinery::Page.find_by_slug('home')
home_page.layout_template = "intro"
home_page.save!

Refinery::Page.find_by_slug('about').try(:destroy)

ausstellungen = Refinery::Page.create!(
  title:               "ausstellungen",
  skip_to_first_child: true,
  parent:              home_page,
)

univers = Refinery::Page.create!(
  title:  "universum von pinto",
  parent: ausstellungen,
)

ankenwaage = Refinery::Page.create!(
  title:  "ankenwaage",
  parent: ausstellungen,
)

potz = Refinery::Page.create!(
  title:  "potz 1000",
  parent: ausstellungen,
)

ue50art = Refinery::Page.create!(
  title:  "ue50 art",
  parent: ausstellungen,
)

art = Refinery::Page.create!(
  title:               "art",
  skip_to_first_child: true,
  parent:              home_page,
)

rigi = Refinery::Page.create!(
  title:  "rigi",
  parent: art,
)

sonnwende = Refinery::Page.create!(
  title:  "sonnwende",
  parent: art,
)

wikisigns_digital = Refinery::Page.create!(
  title:  "wikisigns digital",
  parent: art,
)

wikisigns_analog = Refinery::Page.create!(
  title:  "wikisigns analog",
  parent: art,
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
)

presse = Refinery::Page.create!(
  title:  "presse",
  parent: info,
)
