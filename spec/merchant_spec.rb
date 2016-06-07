require_relative "./spec_helper"

describe "Merchant" do
  before do
    @merchant = Merchant.new(id: "12")
    @invoice1 = Invoice.new(id: "1", merchant_id: "12")
    @invoice2 = Invoice.new(id: "2", merchant_id: "12")
    @invoice_item1 = InvoiceItem.new(invoice_id: "1", quantity: "3", unit_price: "30")
    @invoice_item2 = InvoiceItem.new(invoice_id: "2", quantity: "5", unit_price: "50")
  end

  describe "items" do
    it "will return the correct merchant items" do
      item = Item.new(merchant_id: "12")
      ItemRepository.add(item)
      expect(@merchant.items).to eq([item])
    end
  end

  # describe "invoices" do
    # DO DIS
  # end

  describe "invoice_total" do
    it "will sum up the totals for each merchant's invoices" do
      InvoiceRepository.add(@invoice1, @invoice2)
      InvoiceItemRepository.add(@invoice_item1, @invoice_item2)

      expect(@merchant.invoice_total).to eq(340)
    end
  end
end