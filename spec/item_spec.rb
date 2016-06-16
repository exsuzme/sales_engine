require_relative "./spec_helper"

describe "Item" do
  describe "invoice_items" do
    it "will return the correct invoice items" do
      item = Item.create(id: "22")
      invoice_item = InvoiceItem.create(item_id: "22")
      expect(item.invoice_items).to eq([invoice_item])
    end
  end

  describe "merchant" do
    it "will return the correct merchants" do
      merchant = Merchant.create(id: "11")
      item = Item.create(merchant_id: "11")
      expect(item.merchant).to eq(merchant)
    end
  end
end