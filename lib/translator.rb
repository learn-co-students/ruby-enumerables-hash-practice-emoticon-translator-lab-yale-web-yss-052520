# require modules here
require 'yaml'
require 'pry'

def load_library(path)
 data = YAML.load_file(path)
  hash = {}
  data.each do |key,val| 
    hash[key] = { :english => val[0], :japanese => val[1] }
  end 
  hash
end


def get_english_meaning(path, emoticon)
  # code goes here
  library = load_library(path)
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon 
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  library = load_library(path)
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
end
emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end
