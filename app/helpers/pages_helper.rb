module PagesHelper
  def duration_translator(duration)
    minutes = duration / 60
    seconds = duration % 60

    "#{minutes}:#{seconds}"
  end
end
