class TextAnalyzer
  def process
    file = File.open("#{Kernel.__dir__}/sample_text.txt")
    yield(file) if block_given?
    file.close
  end
end

analyzer = TextAnalyzer.new

p analyzer.process { |file| "#{file.read.split.size} words"}
p analyzer.process { |file| "#{file.readlines.size} lines"}
p analyzer.process { |file| "#{file.read.split(/\n{2}/).size} paragraphs" }

