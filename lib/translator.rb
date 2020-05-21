# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticon_translator = {}
   emoticons.each do |key,value|
      if emoticon_translator[key] == nil 
         emoticon_translator[key] = {}
      end
      if emoticon_translator[key][:english] == nil 
         emoticon_translator[key][:english] = value[0]
      end
      if emoticon_translator[key][:japanese] == nil 
         emoticon_translator[key][:japanese] = value[1]
      end
   end
   emoticon_translator
end


def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  emoticons.each do |translation, languages|
    languages.each do |key, emoji|
      if emoticons[translation][:japanese] == emoticon
        return translation
      end
    end 
  end
  return "Sorry, that emoticon was not found"
end 
      

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  emoticons.each do |translation, languages|
    languages.each do |key, emoji| 
      if emoji == emoticon
        return languages[:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end
