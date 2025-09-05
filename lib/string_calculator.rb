class StringCalculator
    #string calculator methods

      def self.add(input)
        return 0 if input.empty?

        numbers = input.split(",").map { |part| part.split("\n") }.flatten.map(&:to_i)

        negatives = numbers.select { |n| n < 0 }
        if negatives.any?
          raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}"
        end
        numbers.sum
    end
end