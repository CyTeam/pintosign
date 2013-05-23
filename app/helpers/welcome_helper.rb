module WelcomeHelper
  def overview_navigation
    [
      {:href => cms_slug_prefix + 'liveart/liveart-ankenwaage', :coords => '176,0,265,28',    :title => 'ausstellungen'},
      {:href => cms_slug_prefix + 'art/sonnwende',              :coords => '342,25,488,54',   :title => 'art collection'},
      {:href => cms_slug_prefix + 'info/presse',                :coords => '155,213,265,241', :title => 'sonstiges'},
      {:href => cms_slug_prefix + 'biographie',                 :coords => '401,222,521,248', :title => 'biographie'}
    ]
  end

  private

  def cms_slug_prefix
    '/de/pintosign/'
  end
end
