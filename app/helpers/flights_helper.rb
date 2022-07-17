module FlightsHelper
  def format_part(part, name)
    if part.nil? || part.zero?
      ''
    elsif part == 1
      "#{part} #{name.singularize},"
    else
      "#{part} #{name},"
    end
  end

  def convert_duration(duration_parts)
    days = duration_parts[:hours]&./ 24
    hours = duration_parts[:hours]&.% 24
    minutes = duration_parts[:minutes]
    seconds = duration_parts[:seconds]

    days = format_part(days, 'days')
    hours = format_part(hours, 'hours')
    minutes = format_part(minutes, 'minutes')
    seconds = format_part(seconds, 'seconds')

    "#{days} #{hours} #{minutes} #{seconds}"
  end
end
