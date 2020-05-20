require "yaml"
require 'pry'
def load_library (file)
  emoticons = YAML.load_file(file)
emoticon_hash = {}

  emoticons.each do |meanings, eng_then_jap_emojies|
    emoticon_hash[meanings] = {}
    emoticon_hash[meanings][:english] = eng_then_jap_emojies[0]
    emoticon_hash[meanings][:japanese] = eng_then_jap_emojies[1]
  end
  emoticon_hash
end

def get_japanese_emoticon(file, e_emoticon)
  emojifile = load_library(file)
  
 emoji1 = emojifile.keys.find { |key| emojifile[key][:english] == e_emoticon}
 if emoji1
   return emojifile[emoji1][:japanese]
else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, j_emoticon)
 emojifile2 = load_library(file)
 emoji2 = emojifile2.keys.find { |key| emojifile2[key][:japanese] == j_emoticon}
 if emoji2
   return emoji2
 else
   "Sorry, that emoticon was not found"
end
end
