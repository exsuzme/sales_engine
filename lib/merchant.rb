class Merchant < Base
  def self.columns
    [:id, :name, :created_at, :updated_at]
  end

  def items
    ItemRepository.find_all_by_merchant_id(self.id)
  end

  def invoices
    InvoiceRepository.find_all_by_merchant_id(self.id)
  end

  def invoice_total
    invoices.map do |invoice|
      invoice.total
    end.reduce(:+)
  end
end