module PageObjects
  def aba
    @aba ||= Home::Aba.new
  end

  def area
    @area ||= Home::Area.new
  end
end
