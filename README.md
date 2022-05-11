# Welcome to Night Writer! 

This program translates English text to Braille (2x3 matrices) and vice versa. The program can be run two ways: 
  1. To translate English text to Braille, run the following in your CLI: 
      
      `ruby night_writer.rb filename_1.txt filname_2.txt`
      
      In this case, `filename_1.txt` should be an existing `.txt` file containing Enligsh text of your choosing. `filename_2.txt` should be the name
      of the file that you wish to be created containing the Braille translation.
      
  2. To translate Braille text back to English, run the following in your CLI:
      
      `ruby night_reader.rb filename_1.txt filename_2.txt`
      
      In this case, `filename_1.txt` should be an existing `.txt` file containing Braille text of your choosing. `filename_2.txt` should be the name 
      of the file that you wish to be created containing the English translation.

## Installation

All that is required to run this program is to fork this repository, clone your fork down to your local machine, and run the following gem installations:
  1. `gem install rspec`
  2. `gem install pry`

Once the gems have been installed, you can check the testing by simply running `rspec` from your CLI. The program can be run using the above CLI commands.

## Technology 

This program uses the below technology: 
  1. Ruby
  2. RSpec for TDD
  3. SimpleCov for tracking test coverage
  4. Pry for runtime development exploration / IRB

## Author

James Harkins [GitHub Profile](https://github.com/James-Harkins)
