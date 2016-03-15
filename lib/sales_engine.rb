require 'csv'
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

  CUSTOMER_ID_INDEX = 0

  def format_csv(csv)
    csv = CSV.read(csv)
    csv.shift
    csv
  end

  def startup
    customer_repository = CustomerRepository.new
    csv = "/Users/suzannejacobson/Documents/JumpstartTutorials/sales_engine/data/testing.csv"
    csv_without_header = format_csv(csv)
    customers = csv_without_header.each do |row|
      customer_id = row[CUSTOMER_ID_INDEX]
      first_name = row[1]
      last_name = row[2]
      created_at = row[3]
      updated_at = row[4]
      customer_row = Customer.new(id: customer_id, first_name: first_name, last_name: last_name, created_at: created_at, updated_at: updated_at)
      customer_repository.add(customer_row)
    end
  end

end
