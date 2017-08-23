require 'integer_obfuscator'

require "bits2words/version"
require "bits2words/word_lists"

class Bits2words
  DefaultDelimiter = '-'.freeze
  DefaultWordLists = [
    WordLists::NUMBERS,
    WordLists::ADJECTIVES,
    WordLists::NOUNS,
    WordLists::VERB,
    WordLists::ADVERB
  ].freeze

  WordNotFound = Class.new(StandardError)

  def initialize(obfuscation_key, bit_length: 32, delimiter: DefaultDelimiter, obfuscator: IntegerObfuscator, word_lists: DefaultWordLists)
    @bit_length = bit_length
    @delimiter  = delimiter
    @word_lists = word_lists

    @bit_lengths = word_lists.map { |list| list.size.bit_length - 1 }

    bit_count = @bit_lengths.inject(0, &:+)

    if bit_count != @bit_length
      raise ArgumentError, "The word_lists must span #{@bit_length}-bits; #{bit_count}-bits used"
    end

    raise ArgumentError, 'obfuscator must define an obfuscate method' unless obfuscator.method_defined? :obfuscate
    raise ArgumentError, 'obfuscator must define an unobfuscate method' unless obfuscator.method_defined? :unobfuscate

    @obfuscator = (@bit_length == 32 ? obfuscator : NullObfuscator).new(obfuscation_key)
  end

  def encode(id)
    raise ArgumentError, 'id must be an Integer' unless Integer === id
    raise ArgumentError, "id has more than #{@bit_length}-bits" if id.bit_length > @bit_length

    obfuscated_id, bit_index = @obfuscator.obfuscate(id.to_i), 0

    words = @word_lists.map.with_index do |word_list, index|
      bit_length = @bit_lengths[index]

      word_list[extract_bits(obfuscated_id, bit_index, (bit_index += bit_length) - 1)]
    end

    words.join(@delimiter)

  rescue IntegerObfuscator::RangeError
    raise RangeError, "id is not 32-bit integer"
  end

  def decode(words)
    raise ArgumentError 'words argument must be a String' unless String === words

    input_words, bit_offset = words.split(@delimiter), 0

    raise RangeError, 'to few words in String' if input_words.size < @word_lists.size
    raise RangeError, 'to many words in String' if input_words.size > @word_lists.size

    obfuscated_id = @word_lists.each.with_index.inject(0) do |sum, (word_list, index)|
      word = input_words[index]
      word_index = word_list.index(word)

      raise WordNotFound, "#{word} was not found in the #{index + 1} list" unless word_index

      word_index <<= bit_offset
      bit_offset += @bit_lengths[index]

      sum + word_index
    end

    @obfuscator.unobfuscate obfuscated_id
  end

  def inspect
    "#<#{self.class.name}:#{sprintf("0x%x", object_id)} bit_length=#{@bit_length} obfuscator=#{@obfuscator.class.to_s} word_lists=[#{@bit_lengths.map { |b| "#{b} bits" } * ', '}]>"
  end

  private

  def extract_bits(*args)
    self.class.extract_bits(*args)
  end

  def self.extract_bits(int, low, high)
    raise ArgumentError, 'Integer required' unless Integer === int
    raise ArgumentError, 'low argument must be positive' if low < 0
    raise ArgumentError, 'high argument must be greater than or equal to low' if high < low

    len = high - low + 1
    int >> low & ~(-1 >> len << len)
  end

  class NullObfuscator
    def initialize(*args); end
    def obfuscate(id); id; end
    def unobfuscate(int); int; end
  end
end
