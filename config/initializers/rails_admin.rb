RailsAdmin.authorize_with do
  redirect_to root_path unless current_user.is_superadmin?
end