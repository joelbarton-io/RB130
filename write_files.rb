prefixes = "
Classes to Test - Cash Register and Transaction
Setup the Test Class - Cash Register
Test Accept Money Method - Cash Register
Test Change Method - Cash Register
Test Give Receipt Method - Cash Register
Test Prompt For Payment Method- Transaction
Alter Prompt For Payment Method - Transaction
Swap Letters Sample Text and Starter File
Test swap method - Text
Test word_count method - Text
".downcase!.split(/\n/).map { |l| l.gsub(/\W+/, '_') }[1..]

# p prefixes
dir_name = Kernel.__dir__

prefixes.each_with_index do |str, idx|
  system "touch #{dir_name}/#{idx + 1}_#{str}.rb"
end

