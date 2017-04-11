ActiveAdmin.register Track do
  menu priority: 5


  index do
    selectable_column
    id_column
    column :artist
    column :album
    column :duration
    column :name
    column :favorite_count
    actions
  end

  filter :artist
  filter :album
  filter :duration
  filter :name
  filter :favorite_count

end
