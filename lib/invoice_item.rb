class InvoiceItem < Base
  def self.columns
   [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]
  end
end