# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class CounterTagsExtension < Radiant::Extension
  version "1.0"
  description "Creates a counter that can be used for unique values."
  url "http://github.com/glhewett/counter_tags"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :counter_tags
  #   end
  # end
  
  def activate
    # admin.tabs.add "Counter Tags", "/admin/counter_tags", :after => "Layouts", :visibility => [:all]
    Page.send :include, CounterTags
  end
  
  def deactivate
    # admin.tabs.remove "Counter Tags"
  end
  
end
