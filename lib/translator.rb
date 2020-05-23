# require modules here
require "yaml"
require 'pry'

def load_library(filepath)
  # code goes here
 emojis = YAML.load_file(filepath)
  library = {}
  emojis.each do |key, value|

    if !library[key]
      library[key] = {}
    end
    if !library[key][:english]
    library[key][:english] = value[0]
    end
    if !library[key][:japanese]
      library[key][:japanese] = value[1]
      #binding.pry
    end
end
library
end


def get_japanese_emoticon(file, emoticon)
  value1 = "Sorry, that emoticon was not found"
    emoticons = load_library(file)
    emoticons.each do |key, value|
      #binding.pry
      if emoticons[key][:english] == emoticon
        value1 = emoticons[key][:japanese]
      end
    end
    #binding.pry
    value1
end

def get_english_meaning(file, emoticon)
  value2 = "Sorry, that emoticon was not found"
    emoticons = load_library(file)
    emoticons.each do |key, value|
    if emoticons[key][:japanese] == emoticon
      #binding.pry
      value2 = key
    end
  end
  value2
end
