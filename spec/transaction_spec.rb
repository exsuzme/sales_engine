require_relative "./spec_helper"

describe "Transaction" do
  describe "invoice" do
    it "will return the correct invoice" do
      transaction = Transaction.new(invoice_id: "55")
      invoice = Invoice.new(id: "55")
      InvoiceRepository.add(invoice)
      expect(transaction.invoice).to eq(invoice)
    end
  end
end