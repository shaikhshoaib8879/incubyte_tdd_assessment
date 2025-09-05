class StringCalculator
    #string calculator methods

      def self.add(input)
        return 0 if input.nil? || input.empty?

        numbers_string = input
        custom_delimiter = nil

        if input.start_with?("//")
          delimiter_definition, numbers_string = input.split("\n", 2)
          custom_delimiter = delimiter_definition[2]
        end

        delimiters = [",", "\n"]
        delimiters << custom_delimiter if custom_delimiter

        numbers = [numbers_string]
        delimiters.each do |delimiter|
          numbers = numbers.map { |part| part.split(delimiter) }.flatten
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