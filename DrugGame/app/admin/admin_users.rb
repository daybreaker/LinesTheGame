ActiveAdmin.register AdminUser do
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
    end

    f.buttons
  end 

end
