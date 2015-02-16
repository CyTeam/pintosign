puts "Added by Refinery CMS Pages extension"
Refinery::Pages::Engine.load_seed

home_page                 = Refinery::Page.find_by_slug('home')
home_page.layout_template = "intro"
home_page.save!

home_page.parts.delete_all

Refinery::Page.find_by_slug('about').try(:destroy)

def attache_picture_to_page(page, url)
  puts "Attach #{url} to #{page.title}"

  image     = Dragonfly.app.fetch_url(url)
  ref_image = Refinery::Image.create!(image: image)

  Refinery::ImagePage.create!(
    image: ref_image,
    page:  page,
  )
end

def add_body_page_part_to(page)
  puts "Add body page part to #{page.title}"
  Refinery::PagePart.create(
    page:  page,
    title: "Body"
  )
end

pages_with_body = []
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
)
pages_with_body << univers
%w[
http://pintosign.ch/uploads/file/135/_bersicht2.jpg
http://pintosign.ch/uploads/file/129/_MG_9456.jpg
http://pintosign.ch/uploads/file/128/_MG_9455.jpg
http://pintosign.ch/uploads/file/127/_MG_9454.jpg
http://pintosign.ch/uploads/file/126/_MG_9453.jpg
http://pintosign.ch/uploads/file/125/_MG_9452.jpg
http://pintosign.ch/uploads/file/134/_bersicht1.jpg
http://pintosign.ch/uploads/file/133/_MG_9461.jpg
http://pintosign.ch/uploads/file/103/_MG_9426.jpg
http://pintosign.ch/uploads/file/104/_MG_9427.jpg
http://pintosign.ch/uploads/file/116/_MG_9440.jpg
http://pintosign.ch/uploads/file/117/_MG_9441.jpg
http://pintosign.ch/uploads/file/141/_bersicht8.jpg
http://pintosign.ch/uploads/file/137/_bersicht4.jpg
http://pintosign.ch/uploads/file/111/_MG_9435.jpg
http://pintosign.ch/uploads/file/108/_MG_9431.jpg
http://pintosign.ch/uploads/file/105/_MG_9428.jpg
http://pintosign.ch/uploads/file/140/_bersicht7.jpg
http://pintosign.ch/uploads/file/109/_MG_9432.jpg
http://pintosign.ch/uploads/file/148/univ2.jpg
http://pintosign.ch/uploads/file/149/univ4.jpg
http://pintosign.ch/uploads/file/145/babelCorKat4.jpg
http://pintosign.ch/uploads/file/144/babelCorKat3.jpg
http://pintosign.ch/uploads/file/143/babelCorKat2.jpg
http://pintosign.ch/uploads/file/142/babelCorKat1.jpg
http://pintosign.ch/uploads/file/139/_bersicht6.jpg
http://pintosign.ch/uploads/file/138/_bersicht5.jpg
http://pintosign.ch/uploads/file/112/_MG_9436.jpg
http://pintosign.ch/uploads/file/114/_MG_9438.jpg
http://pintosign.ch/uploads/file/115/_MG_9439.jpg
http://pintosign.ch/uploads/file/124/_MG_9451.jpg
http://pintosign.ch/uploads/file/123/_MG_9449.jpg
http://pintosign.ch/uploads/file/122/_MG_9448.jpg
http://pintosign.ch/uploads/file/130/_MG_9457.jpg
http://pintosign.ch/uploads/file/132/_MG_9460.jpg
http://pintosign.ch/uploads/file/131/_MG_9458.jpg
http://pintosign.ch/uploads/file/136/_bersicht3.jpg
].each do |url|
  attache_picture_to_page(univers, url)
end

ankenwaage = Refinery::Page.create!(
  title:  "ankenwaage",
  parent: ausstellungen,
)
pages_with_body << ankenwaage
%w[
http://pintosign.ch/uploads/file/46/stup1.jpg
http://pintosign.ch/uploads/file/47/stup2.jpg
http://pintosign.ch/uploads/file/48/stup3.jpg
http://pintosign.ch/uploads/file/49/stup4.jpg
http://pintosign.ch/uploads/file/50/stup5.jpg
http://pintosign.ch/uploads/file/51/stup6.jpg
http://pintosign.ch/uploads/file/52/stup7.jpg
http://pintosign.ch/uploads/file/53/stup8.jpg
http://pintosign.ch/uploads/file/54/stup9.jpg
http://pintosign.ch/uploads/file/61/stup10.jpg
http://pintosign.ch/uploads/file/55/stup11.jpg
http://pintosign.ch/uploads/file/56/stup12.jpg
http://pintosign.ch/uploads/file/57/stup13.jpg
http://pintosign.ch/uploads/file/58/stup14.jpg
http://pintosign.ch/uploads/file/59/stup15.jpg
http://pintosign.ch/uploads/file/62/stup16.jpg
http://pintosign.ch/uploads/file/63/stup17.jpg
http://pintosign.ch/uploads/file/64/stup18.jpg
http://pintosign.ch/uploads/file/65/stup19.jpg
http://pintosign.ch/uploads/file/66/stup20.jpg
http://pintosign.ch/uploads/file/67/stup21.jpg
http://pintosign.ch/uploads/file/68/stup22.jpg
http://pintosign.ch/uploads/file/69/stup23.jpg
http://pintosign.ch/uploads/file/79/stup24.jpg
http://pintosign.ch/uploads/file/70/stup25.jpg
http://pintosign.ch/uploads/file/71/stup26.jpg
http://pintosign.ch/uploads/file/72/stup27.jpg
http://pintosign.ch/uploads/file/73/stup28.jpg
http://pintosign.ch/uploads/file/74/stup29.jpg
http://pintosign.ch/uploads/file/75/stup30.jpg
http://pintosign.ch/uploads/file/76/stup31.jpg
http://pintosign.ch/uploads/file/77/stup32.jpg
http://pintosign.ch/uploads/file/78/stup33.jpg
].each do |url|
  attache_picture_to_page(ankenwaage, url)
end

potz = Refinery::Page.create!(
  title:  "potz 1000",
  parent: ausstellungen,
)
pages_with_body << potz
%w[
http://pintosign.ch/uploads/file/82/01.jpg
http://pintosign.ch/uploads/file/83/02.jpg
http://pintosign.ch/uploads/file/84/03.jpg
http://pintosign.ch/uploads/file/85/04.jpg
http://pintosign.ch/uploads/file/86/05.jpg
http://pintosign.ch/uploads/file/87/06.jpg
http://pintosign.ch/uploads/file/88/07.jpg
http://pintosign.ch/uploads/file/89/08.jpg
http://pintosign.ch/uploads/file/90/09.jpg
http://pintosign.ch/uploads/file/91/10.jpg
http://pintosign.ch/uploads/file/92/11.jpg
].each do |url|
  attache_picture_to_page(potz, url)
end

ue50art = Refinery::Page.create!(
  title:  "ue50 art",
  parent: ausstellungen,
)
pages_with_body << ue50art
%w[
http://pintosign.ch/uploads/file/93/IMG_20121107_163929.jpg
http://pintosign.ch/uploads/file/94/IMG_20121107_164023.jpg
http://pintosign.ch/uploads/file/95/IMG_20121107_164039.jpg
http://pintosign.ch/uploads/file/96/wiki_50ART.jpg
].each do |url|
  attache_picture_to_page(ue50art, url)
end

art = Refinery::Page.create!(
  title:               "art",
  skip_to_first_child: true,
  parent:              home_page,
)
rigi = Refinery::Page.create!(
  title:  "rigi",
  parent: art,
)
pages_with_body << rigi
sonnenwende = Refinery::Page.create!(
  title:  "sonnenwende",
  parent: art,
)
pages_with_body << sonnenwende
wikisigns_digital = Refinery::Page.create!(
  title:  "wikisigns digital",
  parent: art,
)
pages_with_body << wikisigns_digital
wikisigns_analog = Refinery::Page.create!(
  title:  "wikisigns analog",
  parent: art,
)
pages_with_body << wikisigns_analog
biographie = Refinery::Page.create!(
  title:  "biographie",
  parent: home_page,
)
pages_with_body << biographie
info = Refinery::Page.create!(
  title:               "info",
  skip_to_first_child: true,
  parent:              home_page,
)
impressum = Refinery::Page.create!(
  title:  "impressum",
  parent: info,
)
pages_with_body << impressum
presse = Refinery::Page.create!(
  title:  "presse",
  parent: info,
)
pages_with_body << presse

pages_with_body.each { |page| add_body_page_part_to(page) }
