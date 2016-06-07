require 'csv'
require_relative 'base'
require_relative 'base_repository'
require_relative 'merchant'
require_relative 'merchant_repository'
require_relative 'invoice'
require_relative 'invoice_repository'
require_relative 'item'
require_relative 'item_repository'
require_relative 'invoice_item'
require_relative 'invoice_item_repository'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'transaction'
require_relative 'transaction_repository'

class SalesEngine

  INDEX = 0

  def format_csv(csv)
    csv = CSV.read(csv)
    csv.shift
    csv
  end

  def startup
    create_customer_repository
    create_invoice_repository
    create_invoice_item_repository
    create_item_repository
    create_merchant_repository
    create_transaction_repository
  end

  private

  def create_customer_repository
    csv = "/Users/suzannejacobson/Documents/JumpstartTutorials/sales_engine/data/customers.csv"
    csv_without_header = format_csv(csv)
    customers = csv_without_header.each do |row|
      customer_row = Customer.new(id: row[INDEX], first_name: row[1], last_name: row[2], created_at: row[3], updated_at: row[4])
      CustomerRepository.add(customer_row)
    end
  end

  def create_invoice_item_repository
    csv = "/Users/suzannejacobson/Documents/JumpstartTutorials/sales_engine/data/invoice_items.csv"
    csv_without_header = format_csv(csv)
    invoice_items = csv_without_header.each do |row|
      invoice_item_row = InvoiceItem.new(id: row[INDEX], item_id: row[1], invoice_id: row[2], quantity: row[3], unit_price: row[4], created_at: row[5], updated_at: row[6])
      InvoiceItemRepository.add(invoice_item_row)
    end
  end

  def create_invoice_repository
    csv = "/Users/suzannejacobson/Documents/JumpstartTutorials/sales_engine/data/invoices.csv"
     csv_without_header = format_csv(csv)
    invoices = csv_without_header.each do |row|
      invoice_row = Invoice.new(id: row[INDEX], customer_id: row[1], merchant_id: row[2], status: row[3], created_at: row[4], updated_at: row[5])
      InvoiceRepository.add(invoice_row)
    end
  end

  def create_item_repository
    csv = "/Users/suzannejacobson/Documents/JumpstartTutorials/sales_engine/data/items.csv"
    csv_without_header = format_csv(csv)
    items = csv_without_header.each do |row|
      item_row = Item.new(id: row[INDEX], name: row[1], description: row[2], unit_price: row[3], merchant_id: row[4], created_at: row[5], updated_at: row[6])
      ItemRepository.add(item_row)
    end
  end

  def create_merchant_repository
    csv = "/Users/suzannejacobson/Documents/JumpstartTutorials/sales_engine/data/merchants.csv"
    csv_without_header = format_csv(csv)
    merchants = csv_without_header.each do |row|
      merchant_row = Merchant.new(id: row[INDEX], name: row[1], created_at: row[2], updated_at: row[3])
      MerchantRepository.add(merchant_row)
    end
  end

  def create_transaction_repository
    csv = "/Users/suzannejacobson/Documents/JumpstartTutorials/sales_engine/data/transactions.csv"
    csv_without_header = format_csv(csv)
    transactions = csv_without_header.each do |row|
      transaction_row = Transaction.new(id: row[INDEX], invoice_id: row[1], credit_card_number: row[2], credit_card_expiration_date: row[3], result: row[4], created_at: row[5], updated_at: row[6])
      TransactionRepository.add(transaction_row)
    end
  end
end