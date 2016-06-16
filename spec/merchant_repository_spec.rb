require_relative "./spec_helper"

describe "MerchantRepository" do
  describe ".most_revenue(x)" do
    context "one merchant" do
      it "returns the top merchant" do
        invoice1 = Invoice.create(merchant_id: "1", id: "1")
        invoice2 = Invoice.create(merchant_id: "2", id: "2")
        invoice_item1 = InvoiceItem.create(invoice_id: "1", unit_price: "50", quantity: "2")
        invoice_item2 = InvoiceItem.create(invoice_id: "2", unit_price: "45", quantity: "5")
        merchant1 = Merchant.create(id: "1")
        merchant2 = Merchant.create(id: "2")

        expect(MerchantRepository.most_revenue(1)).to eq([merchant2])
      end
    end

    context "more than one merchant" do
      it "returns the top x merchants" do
        invoice1 = Invoice.create(merchant_id: "1", id: "1")
        invoice2 = Invoice.create(merchant_id: "2", id: "2")
        invoice3 = Invoice.create(merchant_id: "3", id: "3")
        invoice_item1 = InvoiceItem.create(invoice_id: "1", unit_price: "50", quantity: "2")
        invoice_item2 = InvoiceItem.create(invoice_id: "2", unit_price: "45", quantity: "5")
        invoice_item3 = InvoiceItem.create(invoice_id: "3", unit_price: "200", quantity: "3")
        merchant1 = Merchant.create(id: "1")
        merchant2 = Merchant.create(id: "2")
        merchant3 = Merchant.create(id: "3")

        expect(MerchantRepository.most_revenue(2)).to eq([merchant3, merchant2])
      end
    end
  end

  describe ".most_items(x)" do
    context "two merchants" do
      it "returns the top merchant" do
        merchant1 = Merchant.create(id: "1")
        merchant2 = Merchant.create(id: "2")
        item1 = Item.create(merchant_id: "1")
        item2 = Item.create(merchant_id: "1")
        item3 = Item.create(merchant_id: "1")
        item4 = Item.create(merchant_id: "2")

        expect(MerchantRepository.most_items(1)).to eq([merchant1])
      end
    end
  end

  describe ".revenue(date)" do
    context "three merchants" do
      it "returns the total revenue for the date" do
        merchant1 = Merchant.create(id: "1")
        merchant2 = Merchant.create(id: "2")
        merchant3 = Merchant.create(id: "3")
        invoice1 = Invoice.create(merchant_id: "1", created_at: "2012-03-25 09:54:09 UTC", id: "10")
        invoice2 = Invoice.create(merchant_id: "2", created_at: "2012-03-25 09:54:09 UTC", id: "11")
        invoice3 = Invoice.create(merchant_id: "3", created_at: "2012-03-27 09:54:09 UTC", id: "12")
        invoice_item1 = InvoiceItem.create(invoice_id: "10", quantity: "2", unit_price: "10")
        invoice_item2 = InvoiceItem.create(invoice_id: "11", quantity: "1", unit_price: "10")
        invoice_item3= InvoiceItem.create(invoice_id: "12", quantity: "4", unit_price: "10")

        expect(MerchantRepository.revenue("2012-03-25")).to eq("30")
      end
    end
  end
end