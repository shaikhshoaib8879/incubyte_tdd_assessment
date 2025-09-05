require_relative "spec_helper"
require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  describe "adding numbers from a string" do
    it "returns 0 when input is empty" do
      expect(StringCalculator.add("")).to eq(0)
    end
  end
end