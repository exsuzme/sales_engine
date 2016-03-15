require_relative "../lib/customer"
require_relative "../lib/customer_repository"

describe "CustomerRepository" do
  let(:repository) { CustomerRepository.new }
  let(:customer) { Customer.new(id: "1", first_name: "Phillip", last_name: "B")}

  describe "#add" do
    subject { repository.add(customer) }

    it "adds customer instance to customer repository" do
      subject
      expect(repository.all).to include(customer)
    end
  end

  describe "#all" do
    let(:customer2) { Customer.new(id: "2", first_name: "Suzanne", last_name: "J")}
    subject { repository.all }

    it "returns all customers in customer repository" do
      repository.add(customer)
      expect(subject).to match_array([customer])
      repository.add(customer2)
      expect(subject).to match_array([customer, customer2])
    end
  end

  describe "#random" do
  end

  table_columns = {"id" => "1", "first_name" => "Phillip", "last_name" => "B"}
  table_columns.each do |column, value|
    describe "#find_by_#{column}" do
      context "when case doesn't match" do
        subject { repository.send("find_by_#{column}", value) }

        it "finds customer in repository by #{column}" do
          repository.add(customer)
          expect(subject).to eq(customer)
        end
      end

      context "when case does match" do
        subject { repository.send("find_by_#{column}", value.downcase) }

        it "finds customer in repository by first name" do
          repository.add(customer)
          expect(subject).to eq(customer)
        end
      end
    end
  end
end