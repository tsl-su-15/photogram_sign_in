Rails.application.routes.draw do
  # Routes to READ photos
  get("/photos/:id",       { :controller => "photos", :action => "show" })
end
