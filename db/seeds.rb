puts "Added by Refinery CMS Pages extension"
Refinery::Pages::Engine.load_seed

home_page                 = Refinery::Page.where(slug: 'home').first
home_page.layout_template = "intro"
home_page.save!

home_page.parts.delete_all

Refinery::Page.where(slug: 'about').first.try(:destroy)

def attache_picture_to_page(page, url)
  puts "Attach #{url} to #{page.title}"

  image     = Dragonfly.app.fetch_url(url)
  ref_image = Refinery::Image.create!(image: image)

  Refinery::ImagePage.create!(
    image: ref_image,
    page:  page,
  )
end

Dragonfly.app.secret = YAML.load_file(Rails.root.join('config/secrets.yml').to_s)[Rails.env]["secret_key_base"]

def add_body_page_part_to(page)
  puts "Add body page part to #{page.title}"

  html_content_filepath = Rails.root.join("db/seeds/pages").join(page.nested_path.sub("/", "") + ".html")
  page_part    = Refinery::PagePart.new(
    page:  page,
    title: "Body"
  )

  if File.exists?(html_content_filepath)
    puts "Add content to body page part on #{page.title}"
    html_content   = File.read(html_content_filepath)
    image_list     = html_content.scan(/<img.+?src=[\"'](.+?)[\"'].*?>/).flatten

    image_list.each do |image_url|
      image        = Dragonfly.app.fetch_url("http://pintosign.ch#{image_url}")
      ref_image    = Refinery::Image.create!(image: image)
      html_content = html_content.gsub(image_url, ref_image.url)
    end

    page_part.body = html_content
  end

  page_part.save!
end

def add_head_images(page)
  Dir["#{Rails.root.join("db/seeds/querbilder")}/*.{png,jpg}"].each do |image_path|
    title     = File.basename(image_path, ".*")
    image     = Dragonfly.app.fetch_file(image_path)
    ref_image = Refinery::Image.create!(image: image, image_title: title)

    Refinery::ImagePage.create!(
      image: ref_image,
      page:  page,
    )
  end
end

def add_images_to(page, image_paths)
  image_paths.each do |image_path|
    image     = Dragonfly.app.fetch_file(image_path)
    ref_image = Refinery::Image.create!(image: image)

    Refinery::ImagePage.create!(
      image: ref_image,
      page:  page,
    )
  end
end

pages_with_body = []
querbilder = Refinery::Page.create!(
  title:        "querbilder",
  parent:       home_page,
  show_in_menu: false,
  deletable:    false,
)
pages_with_body << querbilder
add_head_images(querbilder)
pinto = Refinery::Page.create!(
  title:    "pinto",
  link_url: "/",
  parent:   home_page,
)
ausstellungen = Refinery::Page.create!(
  title:               "ausstellungen",
  skip_to_first_child: true,
  parent:              home_page,
  deletable:           false,
)
univers = Refinery::Page.create!(
  title:  "universum von pinto",
  parent: ausstellungen,
  view_template: "gallery",
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
  view_template: "gallery",
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
  view_template: "gallery",
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
  view_template: "gallery",
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
  deletable:           false,
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
pibel = Refinery::Page.create!(
  title:  "pi-bel",
  parent: art,
)
add_images_to(pibel, Dir["#{Rails.root.join("db/seeds/images/pi-bel")}/*.{png,jpg}"])
pages_with_body << pibel

biographie = Refinery::Page.create!(
  title:     "biographie",
  parent:    home_page,
  deletable: false,
)
pages_with_body << biographie
info = Refinery::Page.create!(
  title:               "info",
  skip_to_first_child: true,
  parent:              home_page,
  deletable:           false,
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
