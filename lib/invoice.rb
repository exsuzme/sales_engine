class Invoice < Base
  def self.columns
   [:id, :customer_id, :merchant_id, :status, :created_at, :updated_at]
  end
end