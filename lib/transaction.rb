class Transaction < Base
  def self.columns
    [:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at]
  end

  def invoice
    InvoiceRepository.find_by_id(self.invoice_id)
  end
end