class Customer < Base
  def self.columns
    [:id, :first_name, :last_name, :created_at, :updated_at]
  end

  def invoices
    InvoiceRepository.find_all_by_customer_id(self.id)
  end
end