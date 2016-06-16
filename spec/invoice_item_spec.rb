require_relative "./spec_helper"

describe "InvoiceItem" do
  describe "invoice" do
    it "will return the correct invoice" do
      invoice_item = InvoiceItem.create(invoice_id: "5")
      invoice = Invoice.create(id: "5")
      expect(invoice_item.invoice).to eq(invoice)
    end
  end

  describe "item" do
    it "will return the correct item" do
      invoice_item = InvoiceItem.create(item_id: "2")
      item = Item.create(id: "2")
      expect(invoice_item.item).to eq(item)
    end
  end
end