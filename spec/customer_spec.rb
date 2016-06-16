require_relative "./spec_helper"

describe "Customer" do
  describe "invoices" do
    it "will return the correct customer invoice" do
      customer = Customer.create(id: "15")
      invoice = Invoice.create(customer_id: "15")
      expect(customer.invoices).to eq([invoice])
    end
  end
end