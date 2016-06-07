require_relative "./spec_helper"

describe "MerchantRepository" do
  describe ".most_revenue(x)" do
    context "one merchant" do
      it "returns the top merchant" do
        invoice1 = Invoice.new(merchant_id: "1", id: "1")
        invoice2 = Invoice.new(merchant_id: "2", id: "2")
        invoice_item1 = InvoiceItem.new(invoice_id: "1", unit_price: "50", quantity: "2")
        invoice_item2 = InvoiceItem.new(invoice_id: "2", unit_price: "45", quantity: "5")
        merchant1 = Merchant.new(id: "1")
        merchant2 = Merchant.new(id: "2")
        MerchantRepository.add(merchant1, merchant2)
        InvoiceRepository.add(invoice1, invoice2)
        InvoiceItemRepository.add(invoice_item1, invoice_item2)

        expect(MerchantRepository.most_revenue(1)).to eq([merchant2])
      end
    end

    context "more than one merchant" do
      it "returns the top x merchants" do
        invoice1 = Invoice.new(merchant_id: "1", id: "1")
        invoice2 = Invoice.new(merchant_id: "2", id: "2")
        invoice3 = Invoice.new(merchant_id: "3", id: "3")
        invoice_item1 = InvoiceItem.new(invoice_id: "1", unit_price: "50", quantity: "2")
        invoice_item2 = InvoiceItem.new(invoice_id: "2", unit_price: "45", quantity: "5")
        invoice_item3 = InvoiceItem.new(invoice_id: "3", unit_price: "200", quantity: "3")
        merchant1 = Merchant.new(id: "1")
        merchant2 = Merchant.new(id: "2")
        merchant3 = Merchant.new(id: "3")
        MerchantRepository.add(merchant1, merchant2, merchant3)
        InvoiceRepository.add(invoice1, invoice2, invoice3)
        InvoiceItemRepository.add(invoice_item1, invoice_item2, invoice_item3)

        expect(MerchantRepository.most_revenue(2)).to eq([merchant3, merchant2])
      end
    end
  end
end