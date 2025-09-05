## How to Run

1. **Install dependencies**  
    Make sure you have Ruby installed and Bundler. Then run:
        bundle install
2. **Run tests**  
    Execute all RSpec tests:
        rspec
3. **Run in IRB (optional)**  
    You can manually test the calculator in IRB:
        require './lib/string_calculator'
        StringCalculator.add("1,2,3")