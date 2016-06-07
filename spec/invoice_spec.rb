require_relative "./spec_helper"

describe "Invoice" do
  describe "transactions" do
    it "will return the correct transactions" do
      invoice = Invoice.new(id: "3")
      transaction = Transaction.new(invoice_id: "3")
      TransactionRepository.add(transaction)
      expect(invoice.transactions).to eq([transaction])
    end
  end

  describe "invoice_items" do
    it "will return the correct invoice_items" do
      invoice_item = InvoiceItem.new(invoice_id: "2")
      invoice = Invoice.new(id: "2")
      InvoiceItemRepository.add(invoice_item)
      expect(invoice.invoice_items).to eq([invoice_item])
    end
  end

  describe "total" do
    it "sums the invoice items of that invoice" do
      invoice1 = Invoice.new(id: "1", merchant_id: "12")
      invoice_item1 = InvoiceItem.new(invoice_id: "1", quantity: "3", unit_price: "30")
      invoice_item2 = InvoiceItem.new(invoice_id: "1", quantity: "5", unit_price: "50")
      InvoiceItemRepository.add(invoice_item1, invoice_item2)

      expect(invoice1.total).to eq(340)
    end
  end

  describe "items" do
    it "will return the correct items by way of the invoice's invoice_item" do
      invoice = Invoice.new(id: "3")
      item = Item.new(id: "4", invoice_id: "3")
      invoice_item = InvoiceItem.new(id: "2", invoice_id: "3", item_id: "4")
      InvoiceItemRepository.add(invoice_item)
      ItemRepository.add(item)
      expect(invoice.items).to eq([item])
    end
  end

  describe "customer" do
    it "will return the correct customer" do
      invoice = Invoice.new(customer_id: "44")
      customer = Customer.new(id: "44")
      CustomerRepository.add(customer)
      expect(invoice.customer).to eq(customer)
    end
  end

  describe "merchant" do
    it "will return the correct merchant" do
      invoice = Invoice.new(merchant_id: "90")
      merchant = Merchant.new(id: "90")
      MerchantRepository.add(merchant)
      expect(invoice.merchant).to eq(merchant)
    end
  end
end