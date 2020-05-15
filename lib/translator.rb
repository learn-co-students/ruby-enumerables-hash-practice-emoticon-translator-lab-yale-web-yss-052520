# require modules here
require 'yaml'
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

def get_japanese_emoticon(filepath, emoticon)
  # code goes here
  library = load_library(filepath)
  library.find do |key, hash|
  if hash[:english] == emoticon
   return hash[:japanese]
    #binding.pry 
  end
end 
p "Sorry, that emoticon was not found"
end 
  
  

def get_english_meaning(filepath, emoticon)
  # code goes here
  library = load_library(filepath)
  library.find do |key, hash|
    if hash[:japanese] == emoticon
      return key 
    end 
  end 
  p "Sorry, that emoticon was not found"
end