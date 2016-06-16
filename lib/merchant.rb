class Merchant < Base
  validates_presence_of([:id, :name])

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

  def valid?
    if @@presence_columns
      @@presence_columns.each do |column|
        if !self.instance_variable_get("@#{column.to_s}")
          return false
        end
      end
    end
    return true
  end
end