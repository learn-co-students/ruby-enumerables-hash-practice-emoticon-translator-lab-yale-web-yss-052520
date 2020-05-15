# require modules here
require "yaml"
require "pry"

def load_library(path)
  data = YAML.load_file(path)
  new = {}
  data.each do |word, picture|
    keys = [:english, :japanese]
    inner_hash = keys.each_index.with_object({}) {|index, h| h[keys[index]] = picture[index]} 
    new[word] = inner_hash
  end
  new
end


def get_english_meaning(path, emoticon)
  hash = load_library(path)
  new = {} 
  
  hash.each do |k, v| 
    new[v[:japanese]] = k 
  end 
  
  meaning = new[emoticon]
  if meaning == nil
    meaning = "Sorry, that emoticon was not found"
  end 
  meaning
end 


def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  new = {}
  
  hash.each do |k, v|
  new[v[:english]] = v[:japanese]
  end 
  
  translate = new[emoticon]
  if translate == nil
    translate = "Sorry, that emoticon was not found"
  end 
  translate
  
end