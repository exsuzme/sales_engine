require_relative "./spec_helper"

describe "InvoiceItem" do
  describe "invoice" do
    it "will return the correct invoice" do
      invoice_item = InvoiceItem.new(invoice_id: "5")
      invoice = Invoice.new(id: "5")
      InvoiceRepository.add(invoice)
      expect(invoice_item.invoice).to eq(invoice)
    end
  end

  describe "item" do
    it "will return the correct item" do
      invoice_item = InvoiceItem.new(item_id: "2")
      item = Item.new(id: "2")
      ItemRepository.add(item)
      expect(invoice_item.item).to eq(item)
    end
  end
end