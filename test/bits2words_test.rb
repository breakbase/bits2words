require "test_helper"

class Bits2wordsTest < Minitest::Test
  def small_word_list
    [ %w[2 3 4 5 6 7 8 9], %w[bat cat] ]
  end

  test 'has version number' do
    refute_nil ::Bits2words::VERSION
  end

  test 'raises ArgumentError with to small word_lists' do
    assert_raises ArgumentError do
      Bits2words.new 'secret', [%w[a b c], %w[d e f]]
    end
  end

  test 'raises ArgumentError with invalid obfuscator' do
    assert_raises ArgumentError do
      Bits2words.new 'secret', obfuscator: Class.new
    end
  end

  test 'encode maps id integer to words' do
    words = Bits2words.new('secret').encode(1024)

    assert_equal '16-pleased-squirrels-play-however', words
  end

  test 'encode with small bit_length' do
    b2w = Bits2words.new('secret', bit_length: 4, word_lists: small_word_list)

    assert_equal '9-bat', b2w.encode(7)
  end

  test 'encode with NullObfuscator' do
    words = Bits2words.new('secret', obfuscator: Bits2words::NullObfuscator).encode(2048)

    assert_equal '2-meager-akbashes-admire-actually', words
  end

  test 'encode with alternative delimiter' do
    words = Bits2words.new('secret', delimiter: ' ').encode(135790)

    assert_equal '12 incompatible termites admit fatally', words
  end

  test 'encode raises ArgumentError with non-Integer input' do
    assert_raises ArgumentError do
      Bits2words.new('secret').encode(1.024)
    end
  end

  test 'encode raises ArgumentError with to large number' do
    assert_raises ArgumentError do
      Bits2words.new('secret').encode(2**33)
    end
  end

  test 'encode raises ArgumentError with to large number on small bit lengths' do
    assert_raises ArgumentError do
      Bits2words.new('secret', bit_length: 4, word_lists: small_word_list).encode(2**5)
    end
  end

  test 'decode maps words to integer' do
    b2w = Bits2words.new('secret')

    words = b2w.encode(123456)
    int = b2w.decode(words)

    assert_equal 123456, int
  end

  test 'decode with small bit_length' do
    b2w = Bits2words.new('secret', bit_length: 4, word_lists: small_word_list)

    assert_equal 5, b2w.decode(b2w.encode(5))
  end

  test 'decode with NullObfuscator' do
    b2w = Bits2words.new('secret', obfuscator: Bits2words::NullObfuscator)

    words = b2w.encode(987654)
    int = b2w.decode(words)

    assert_equal 987654, int
  end

  test 'decode with alternative delimiter' do
    b2w = Bits2words.new('secret', delimiter: ' ')

    words = b2w.encode(987654)
    int = b2w.decode(words)

    assert_equal 987654, int
  end

  test 'decode raises ArgumentError for to many words' do
    assert_raises RangeError do
      Bits2words.new('secret').decode('2 foo bar baz doh doz')
    end
  end

  test 'decode raises ArgumentError for to few words' do
    assert_raises RangeError do
      Bits2words.new('secret').decode('2 foo bar baz')
    end
  end

  test 'decode raises WordNotFound for unknown words' do
    assert_raises Bits2words::WordNotFound do
      Bits2words.new('secret').decode('2-foo-bar-baz-doh')
    end
  end
end
