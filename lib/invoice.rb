class Invoice < Base
  def self.columns
   [:id, :customer_id, :merchant_id, :status, :created_at, :updated_at]
  end

  def transactions
    TransactionRepository.find_all_by_invoice_id(self.id)
  end

  def invoice_items
    InvoiceItemRepository.find_all_by_invoice_id(self.id)
  end

  def total
    invoice_items.map do |invoice_item|
      invoice_item.quantity.to_i * invoice_item.unit_price.to_i
    end.reduce(:+)
  end

  def items
    invoice_item = InvoiceItemRepository.find_by_invoice_id(self.id)
    ItemRepository.find_all_by_id(invoice_item.item_id)
  end

  def customer
    CustomerRepository.find_by_id(self.customer_id)
  end

  def merchant
    MerchantRepository.find_by_id(self.merchant_id)
  end
end

