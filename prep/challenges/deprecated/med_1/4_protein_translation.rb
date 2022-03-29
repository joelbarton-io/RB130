=begin

Codon	              Amino Acids

AUG	                Methionine
UUU, UUC	          Phenylalanine
UUA, UUG	          Leucine
UCU, UCC, UCA, UCG	Serine
UAU, UAC	          Tyrosine
UGU, UGC	          Cysteine
UGG	                Tryptophan
UAA, UAG, UGA	      STOP

Need to traverse a Hash of AA (keys) and Codon (value as array)
Based on what the passed in el matches with, return keys into an array to store

=end
class InvalidCodonError < StandardError; end

class Translation
  CHART = {
    "Methionine": %w(AUG),
    "Phenylalanine": %w(UUU UUC),
    "Leucine": %w(UUA UUG),
    "Serine": %w(UCU UCC UCA UCG),
    "Tyrosine": %w(UAU UAC),
    "Cysteine": %w(UGU UGC),
    "Tryptophan": %w(UGG),
    "STOP": %w(UAA UAG UGA)
  }

  def self.of_codon(codon)
    CHART.select do |_aa, codon_arr|
      codon_arr.include?(codon)
    end.keys.first.to_s
  end

  def self.of_rna(strand)
    arr = strand.scan(/.../)
    raise InvalidCodonError unless arr.first.match(/[UGAC]{3}/)

    a_a = CHART.select do |_aa, codon_arr|
      arr.any? { |codon| codon_arr.include?(codon) }
    end.keys.map!(&:to_s)

    a_a.include?("STOP") ? a_a[0...a_a.index("STOP")] : a_a
  end
end

# 48 minutes, didn't quite pass all test cases....
