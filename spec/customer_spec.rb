require_relative "./spec_helper"

describe "Customer" do
  describe "invoices" do
    it "will return the correct customer invoice" do
      customer = Customer.new(id: "15")
      invoice = Invoice.new(customer_id: "15")
      InvoiceRepository.add(invoice)
      expect(customer.invoices).to eq([invoice])
    end
  end
end