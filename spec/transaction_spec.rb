require_relative "./spec_helper"

describe "Transaction" do
  describe "invoice" do
    it "will return the correct invoice" do
      transaction = Transaction.create(invoice_id: "55")
      invoice = Invoice.create(id: "55")
      expect(transaction.invoice).to eq(invoice)
    end
  end
end