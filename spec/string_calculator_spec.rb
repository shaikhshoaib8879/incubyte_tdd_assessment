require_relative "spec_helper"
require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  describe "adding numbers from a string" do
    it "returns 0 when input is empty " do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "return given number when single number is given" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    #failing test case
    # it "return incorrect sum of two numbers when provided" do
    #   expect(StringCalculator.add("1,3")).to eq(2)
    # end

    it "return correct sum of two numbers when provided" do
      expect(StringCalculator.add("1,3")).to eq(4)
    end

    it "handles new lines as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

  end
end