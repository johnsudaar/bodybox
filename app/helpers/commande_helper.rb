module CommandeHelper
  def get_menu_class(target,current)
    if target > current
      return "disabled"
    elsif target == current
      return "active"
    else
      return "complete"
    end
  end
end
