module PagesHelper
  def duration_translator(duration)
    minutes = duration / 60
    seconds = duration % 60

    "#{minutes}:#{seconds.to_s.rjust(2, '0')}"
  end

  def query(param)
    param == '*' ? '' : param
  end
end
