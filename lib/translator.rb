# require modules here



require "yaml"
require 'pry'

# def load_library(path)
#   emoticons = YAML.load_file(path)
#   emoticon_hash = {}
#   emoticon_hash["get_emoticon"] = {}
#   emoticon_hash["get_meaning"] = {}
#   for emoticon in emoticons.keys
#     emoticon_hash[emoticon] = {:english => emoticons[emoticon][0], :japanese => emoticons[emoticon][1]}
#   end
#   emoticon_hash
# end  

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}

 

  # emoticons.each do |english_word, emoticon_set|
  #   emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
  #   emoticon_hash["get_meaning"][emoticon_set.last] = english_word
  for emoticon in emoticons.keys
    emoticon_hash[emoticon] = {:english => emoticons[emoticon][0], :japanese => emoticons[emoticon][1]}
  end
  
  emoticon_hash
end


def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  for emotion in emoticon_hash.keys
    if emoticon == emoticon_hash[emotion][:english]
      result = emoticon_hash[emotion][:japanese]
    end 
    if result == nil
      result = "Sorry, that emoticon was not found" 
    end
  end  
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  for emotion in emoticon_hash.keys
    if emoticon == emoticon_hash[emotion][:japanese]
      result = emotion
    end 
    if result == nil
      result = "Sorry, that emoticon was not found" 
    end
  end  
  result
end



