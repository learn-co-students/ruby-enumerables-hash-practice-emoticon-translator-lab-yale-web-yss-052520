require "yaml"
require 'pry'

def load_library(path)
  emojis = YAML.load_file(path)
  restructured_hash = {}
  
  #Each key is the english meaning and it is currently associated with an array where the first element is the english version of the emoji and the second element is the Japanese version of the emoji. 
  emojis.each do |key, array_emojis|
    emojis[key] = { english: array_emojis[0], japanese: array_emojis[1] }
  end 
  emojis
end

def get_japanese_emoticon(path, emoji)
  dictionary = load_library(path)
  dictionary.each do |english_meaning, translations|
    if translations[:english] == emoji 
      return translations[:japanese]
    end 
  end
  "Sorry, that emoticon was not found" #based on expected output of the tests.
end

def get_english_meaning(path, emoji)
  dictionary = load_library(path)
  dictionary.each do |english_meaning, translations|
    if translations[:japanese] == emoji 
      return english_meaning
    end 
  end 
  "Sorry, that emoticon was not found"
end