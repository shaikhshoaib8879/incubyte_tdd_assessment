class StringCalculator
    #string calculator methods

      def self.add(input)
        return 0 if input.empty?

        numbers_string = input
        custom_delimiter = nil

        if input.start_with?("//")
          delimiter_definition, numbers_string = input.split("\n", 2)
          custom_delimiter = delimiter_definition[2]
        end

        numbers = if custom_delimiter
                    numbers_string.split(custom_delimiter)
                  else
                    numbers_string.split(",").map { |part| part.split("\n") }.flatten.map(&:to_i)
                  end
        puts "Numbers: #{numbers.inspect}"
        numbers = numbers.map(&:to_i)

        negatives = numbers.select { |n| n < 0 }
        if negatives.any?
          raise ArgumentError, "negative numbers not allowed: #{negatives.join(',')}"
        end
        numbers.sum
    end
end