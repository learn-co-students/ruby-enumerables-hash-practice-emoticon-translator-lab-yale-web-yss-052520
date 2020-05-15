require "yaml"
require 'pry'


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  emoticons.each do |key,value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end
  new_hash
end


def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  answer = nil
  emoticons.each do |key, value| 
    if value[:english] == emoticon
      answer = value[:japanese]
    end 
  end 
  if answer == nil 
    "Sorry, that emoticon was not found"
  else 
    answer
  end 
end


def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  answer = nil
  emoticons.each do |key, value| 
    if value[:japanese] == emoticon
      answer = key
    end 
  end 
  if answer == nil 
    "Sorry, that emoticon was not found"
  else 
    answer
  end 
end