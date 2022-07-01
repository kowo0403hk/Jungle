module SalesHelper
  # This is the helper method to be used by the application index page to determine if a sale alert should be shown on the home page.
  def active_sale? 
    # calling the sals class method "active"
    Sale.active.any? 
  end
end