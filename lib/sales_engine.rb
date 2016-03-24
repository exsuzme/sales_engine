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
    # TODO: make these use the class methods instead of instance methods for adding items
    create_invoice_item_repository
    create_invoice_repository
    # Note: we were trying to get customer.invoices to work
    binding.pry
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
end
