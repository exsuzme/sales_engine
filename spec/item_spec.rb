require_relative "./spec_helper"

describe "Item" do
  describe "invoice_items" do
    it "will return the correct invoice items" do
      item = Item.new(id: "22")
      invoice_item = InvoiceItem.new(item_id: "22")
      InvoiceItemRepository.add(invoice_item)
      expect(item.invoice_items).to eq([invoice_item])
    end
  end

  describe "merchant" do
    it "will return the correct merchants" do
      merchant = Merchant.new(id: "11")
      item = Item.new(merchant_id: "11")
      MerchantRepository.add(merchant)
      expect(item.merchant).to eq(merchant)
    end
  end
end