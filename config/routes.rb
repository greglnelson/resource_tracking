ActionController::Routing::Routes.draw do |map|
  map.resources :activity, :active_scaffold => true
  map.resources :indicator, :active_scaffold => true 
  map.resources :line_item, :active_scaffold => true 
  map.resources :project, :active_scaffold => true 
  map.resources :comments, :active_scaffold => true 
  map.resources :field_helps, :active_scaffold => true 
  map.resources :model_helps, :active_scaffold => true 
  map.resources :organization, :collection => {:browse => :get}, :active_scaffold => true
  map.resources :funding_flow, :active_scaffold => true

  #ugly manual paths
  map.funding_sources_data_entry "funding_sources", :controller => 'funding_flows', :action => 'funding_sources'
  map.providers_data_entry "providers", :controller => 'funding_flows', :action => 'providers'

  map.page_comments "page_comments/:id", :controller => 'comments', :action => 'index', :type => 'ModelHelp'

  # DRY up the static page controller
  map.root :controller => 'static_page' #a replacement for public/index.html
  map.static_page ':page', :controller => 'static_page', :action => 'show', :page => Regexp.new(StaticPageController::PAGES.join('|'))
  map.ngo_dashboard 'ngo_dashboard', :controller => 'static_page', :action => 'show', :page => 'ngo_dashboard'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
