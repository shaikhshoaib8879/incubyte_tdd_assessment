require_relative "spec_helper"
require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  describe "adding numbers from a string" do
    it "returns 0 when input is empty " do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns 0 when input is nil " do
      expect(StringCalculator.add(nil)).to eq(0)
    end

    it "ignores extra commas between numbers" do
      expect(StringCalculator.add("1,,2,3")).to eq(6)
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

    it "return correct sum of multiple numbers when provided" do
      expect(StringCalculator.add("1,3,5,0,13")).to eq(22)
    end

    it "handles new lines as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "raise an exception for single negative number" do
      expect { StringCalculator.add("1,-2,3") }.to raise_error(ArgumentError, "negative numbers not allowed: -2")
    end

    it "raise an exception for multiple negative numbers" do
      expect { StringCalculator.add("1,-2,-5,3") }.to raise_error(ArgumentError, "negative numbers not allowed: -2,-5")
    end

    it "custom delimiter ';'" do
      expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
    end

    it "custom delimiter '|' with pipe" do
      expect(StringCalculator.add("//|\n4,5|6")).to eq(15)
    end

    it "delimiters with ',',';' and \n lets check how it works" do
        expect(StringCalculator.add("//;\n1,2;3\n4")).to eq(10)
    end

    it "multi-character delimiter" do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

  end
end