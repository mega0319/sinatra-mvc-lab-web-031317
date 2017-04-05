require 'pry'

class PigLatinizer

  attr_accessor :text

  @@vowels = ['a','e','i','o','u']


  def piglatinize(word)
    categorize_then_operate(word)
  end

  def to_pig_latin(word)
    check_for_sentences(word).join(' ')
  end

  private

  def check_for_sentences(word)
    if word.split(' ').count > 1
      word.split(' ').map do |word|
        categorize_then_operate(word)
      end
    end
  end

  def vowelplize(word)
    word + "way"
  end

  def clusterplize(word)
    cutoff_index = 0
    letters_chopped = ""
    word.split('').each_with_index do |letter, index|
      if @@vowels.include?(letter.downcase)
        cutoff_index = index
        break
      end
    end
      while cutoff_index > 0
        forgotten = word[0]
        word.slice!(word[0])
        word << forgotten
        cutoff_index -= 1
      end
      word << "ay"
    end

  def regplize(word)
    first_letter = word[0]
    word.slice!(first_letter)
    word << first_letter
    word << "ay"
  end

  def categorize_then_operate(word)
    if @@vowels.include?(word[0].downcase)
      vowelplize(word)
    elsif @@vowels.include?(word[1].downcase)
      regplize(word)
    else
      clusterplize(word)
    end
  end

end

string = PigLatinizer.new
puts string.piglatinize("baby")
