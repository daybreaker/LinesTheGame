ActiveAdmin.register User do
  controller do
    def scoped_collection
      User.includes(:bank)
    end
  end
end
