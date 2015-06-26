module DatetimeHelper

  def format_datetime(timewithzone_object)
    timewithzone_object.strftime("%l:%M:%S %P on %m/%d/%Y")
  end

end