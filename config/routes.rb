Rails.application.routes.draw do

  # Routes to CREATE photos
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  get("/create_photo", { :controller => "photos", :action => "create_row" })

  # Routes to READ photos
  get("/photos/:id",       { :controller => "photos", :action => "show", as: 'photo' })
  get('/photos', { :controller => 'photos', :action => "index"})

  # Routes to UPDATE photos
  get("/photos/:id/edit", { :controller => "photos", :action => "edit_form" })
  get("/update_photo/:id", { :controller => "photos", :action => "update_row" })

  # Route to DESTROY photos
  get("/delete_photo/:id", { :controller => "photos", :action => "destroy" })
end
