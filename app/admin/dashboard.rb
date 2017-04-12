ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content do
    div class: 'custom-class' do
      h3 'Favorite Tracks'
      @metric = Track.top_rated.limit(100).select('name, album_id, COUNT(users_tracks.id) AS total')
                    .group(:name).limit(100).map{|track| [track.full_title, track.total]}
          render partial: 'active_admin/metrics', locals: {metric: @metric}
    end
  end

end
