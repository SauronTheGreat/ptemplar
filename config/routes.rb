#TODO: after logging in the user should be redirected to home page.
#TODO: just change the root path to /homepage


PtemplarUpdatedv1::Application.routes.draw do
  resources :pfragments

  resources :pevents

  resources :pbehaviors

  resources :pwidgets

  get "welcome/index"

  devise_for :users
  resources :pslides
  resources :pcontents
  resources :presentations

  resources :presentations_pslides


  match "update_font"=>'pcontents#update_font'
  match "/homepage", :to => "welcome#homepage"


  ###################################Ptemplate Manager Path#######################################################

  match 'new_ptemplate' => 'ptemplate_manager#create_new_ptemplate'
  match 'save_ptemplate' => 'ptemplate_manager#save_ptemplate'
  match 'save_section' => 'ptemplate_manager#save_sections'
  match 'customize_ptemplate/:id' => 'ptemplate_manager#customize_ptemplate', :as => 'customize_ptemplate'
  match 'ptemplates' => 'ptemplate_manager#index'
  match 'update_ptemplate_font' => 'ptemplate_manager#update_ptemplate_font'
  match "delete_ptemplate/:id"=>"ptemplate_manager#delete_ptemplate",:as=>"delete_ptemplate"
  match "delete_all_ptemplates"=>"ptemplate_manager#delete_all_ptemplates",:as=>"delete_all_ptemplates"
  match 'use_background_image'=>"ptemplate_manager#use_background_image"
  match 'remove_background_image/:ptemplate_id'=>"ptemplate_manager#remove_background_image",:as=>"remove_background_image"
  ################################################################################################################

  #########################################Slide Management Routes##################################################
  match 'save_colors' => 'pslides#save_colors', :as => "save_colors"
  match 'image_uploader' => 'pslides#upload', :as => "image_uploader"
  match 'save_html_data/:id' => 'pslides#save_html_data', :as => "save_html_data"
  match 'add_to_bank' => 'pslides#add_to_bank', :as => "add_to_bank"
  match "extract_psections_from_ptemplate"=>'pslides#extract_psections'
  match 'get_animate_data/:id'=>'pslides#get_animate_data',:as=>"get_animate_data"
  match 'capture_animate_data'=>'pslides#capture_animate_data',:as=>"capture_animate_data"


  # match 'new_slide' => "slide_management#create_new_slide"
  # match 'edit_pslide' => "slide_management#edit_pslide"
  ##################################################################################################################


  ####################################Presentation management routes###############################################
  #match 'new_presentation' => 'presentation_manager#create_new_presentation'
  match ':id/view_presentation' => 'presentation_manager#edit_presentation', :as=>'view_presentation'
  match ':prez/pslides/:id' => 'pslides#show'


  match ':id/add_slide' => 'presentation_manager#add_slide', :as=>'add_slide'
  match ':id/add_existing_slide' => 'presentation_manager#add_existing_slide', :as=>'add_existing_slide'
  match ':id/update_presentation_slide' => 'presentation_manager#update_presentation_slides', :as=>'update_presentation_slide'
  match ':id/package_as_html'=>'presentation_manager#package_as_html', :as=>'package_as_html'
  match ':id/download_as_html'=>'presentation_manager#download_as_html', :as=>'download_as_html'
  match 'get_pslide_html_data/:id'=>"presentation_manager#pslide_html_data"
  match "update_list/:presentation_id"=>"presentation_manager#update_list",:as=>"update_list"

  #################################################################################################################

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
root:to=>'welcome#homepage'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
