require_relative "./spec_helper"

describe "Invoice" do
  describe "transactions" do
    it "will return the correct transactions" do
      invoice = Invoice.create(id: "3")
      transaction = Transaction.create(invoice_id: "3")
      expect(invoice.transactions).to eq([transaction])
    end
  end

  describe "invoice_items" do
    it "will return the correct invoice_items" do
      invoice_item = InvoiceItem.create(invoice_id: "2")
      invoice = Invoice.create(id: "2")
      expect(invoice.invoice_items).to eq([invoice_item])
    end
  end

  describe "total" do
    it "sums the invoice items of that invoice" do
      invoice1 = Invoice.create(id: "1", merchant_id: "12")
      invoice_item1 = InvoiceItem.create(invoice_id: "1", quantity: "3", unit_price: "30")
      invoice_item2 = InvoiceItem.create(invoice_id: "1", quantity: "5", unit_price: "50")

      expect(invoice1.total).to eq(340)
    end
  end

  describe "items" do
    it "will return the correct items by way of the invoice's invoice_item" do
      invoice = Invoice.create(id: "3")
      item = Item.create(id: "4", invoice_id: "3")
      invoice_item = InvoiceItem.create(id: "2", invoice_id: "3", item_id: "4")
      expect(invoice.items).to eq([item])
    end
  end

  describe "customer" do
    it "will return the correct customer" do
      invoice = Invoice.create(customer_id: "44")
      customer = Customer.create(id: "44")
      expect(invoice.customer).to eq(customer)
    end
  end

  describe "merchant" do
    it "will return the correct merchant" do
      invoice = Invoice.create(merchant_id: "90")
      merchant = Merchant.create(id: "90")
      expect(invoice.merchant).to eq(merchant)
    end
  end
end