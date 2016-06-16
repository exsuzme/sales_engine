require_relative "./spec_helper"

describe "Merchant" do
  before do
    @merchant = Merchant.create(id: "12", name: "hello")
    @invoice1 = Invoice.create(id: "1", merchant_id: "12")
    @invoice2 = Invoice.create(id: "2", merchant_id: "12")
    @invoice_item1 = InvoiceItem.create(invoice_id: "1", quantity: "3", unit_price: "30")
    @invoice_item2 = InvoiceItem.create(invoice_id: "2", quantity: "5", unit_price: "50")
  end

  describe "items" do
    it "will return the correct merchant items" do
      item = Item.create(merchant_id: "12")
      expect(@merchant.items).to eq([item])
    end
  end

  describe "invoice_total" do
    it "will sum up the totals for each merchant's invoices" do
      expect(@merchant.invoice_total).to eq(340)
    end
  end
end