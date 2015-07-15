Rails.application.routes.draw do

  # Routes to CREATE photos
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  get("/create_photo", { :controller => "photos", :action => "create_row" })

  # Routes to READ photos
  get("/photos/:id",       { :controller => "photos", :action => "show" })
end
