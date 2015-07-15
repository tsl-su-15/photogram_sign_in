Rails.application.routes.draw do

  # Routes to CREATE photos
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  get("/create_photo", { :controller => "photos", :action => "create_row" })

  # Routes to READ photos
  get("/photos/:id",       { :controller => "photos", :action => "show" })

  # Route to DESTROY photos
  get("/delete_photo/:id", { :controller => "photos", :action => "destroy" })
end
