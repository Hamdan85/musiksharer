module PagesHelper
  def duration_translator(duration)
    minutes = duration / 60
    seconds = duration % 60

    "#{minutes}:#{seconds.to_s.rjust(2, '0')}"
  end

  def query(param)
    param == '*' ? '' : param
  end

  def link_to_favorite(track_id)
    if user_signed_in?
      heart = current_user.tracks.include?(track_id) ? 'fa-heart' : 'fa-heart-o'
      link_to add_favorite_track_path(track_id), class: 'pull-right', method: :post, remote: true do
        "<i class='fa #{heart}'></i>".html_safe
      end
    else
      link_to new_user_registration_path, class: 'pull-right' do
        "<i class='fa fa-heart-o'></i>".html_safe
      end
    end
  end

  def remote_status
    controller_name == 'pages' && action_name == 'index' ? true : false
  end
end
