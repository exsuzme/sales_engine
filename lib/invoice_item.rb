class InvoiceItem < Base
  def self.columns
   [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]
  end

  def invoice
    InvoiceRepository.find_by_id(self.invoice_id)
  end

  def item
    ItemRepository.find_by_id(self.item_id)
  end
end