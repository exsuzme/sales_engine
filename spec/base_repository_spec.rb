require_relative "../lib/base_repository"
require_relative "../lib/base"

describe "BaseRepository" do
  class Klass < Base
    def self.columns
      [:id, :name, :color]
    end
  end

  class KlassRepository < BaseRepository
    def initialize
      @model = Klass
      super
    end
  end

  let(:data) { Klass.new(id: "1", name: "Phillip", color: "Blue")}
  let(:repository) { KlassRepository.new }

  describe "#add" do
    subject { repository.add(data) }

    it "adds data instance to data repository" do
      subject
      expect(repository.all).to include(data)
    end
  end

  describe "#all" do
    let(:data2) { Klass.new(id: "2", name: "Suzanne", color: "Orange")}
    subject { repository.all }

    it "returns all datas in data repository" do
      repository.add(data)
      expect(subject).to match_array([data])
      repository.add(data2)
      expect(subject).to match_array([data, data2])
    end
  end

  describe "#random" do
  end

  table_columns = {"id" => "1", "name" => "Phillip", "color" => "Blue"}
  table_columns.each do |column, value|
    describe "#find_by_#{column}" do
      context "when case doesn't match" do
        subject { repository.send("find_by_#{column}", value) }

        it "finds data in repository by #{column}" do
          repository.add(data)
          expect(subject).to eq(data)
        end
      end

      context "when case does match" do
        subject { repository.send("find_by_#{column}", value.downcase) }

        it "finds data in repository by first name" do
          repository.add(data)
          expect(subject).to eq(data)
        end
      end
    end
  end
end