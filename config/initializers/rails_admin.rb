RailsAdmin.authorize_with do
  redirect_to root_path unless user.is_superadmin?
end