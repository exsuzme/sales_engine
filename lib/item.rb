class Item < Base
  def self.columns
    [:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at]
  end

  def invoice_items
    InvoiceItemRepository.find_all_by_item_id(self.id)
  end

  def merchant
    MerchantRepository.find_by_id(self.merchant_id)
  end
end