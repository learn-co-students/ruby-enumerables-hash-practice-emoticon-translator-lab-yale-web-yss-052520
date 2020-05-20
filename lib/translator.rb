# require modules here
require "yaml"

def load_library(path)
  # code goes here
  file = YAML.load_file(path)
  output = {}
  file.each do |name, emoticon_list|
    output[name] = {
      english: emoticon_list[0],
      japanese: emoticon_list[1]
    }
  end
  output
end

def get_japanese_emoticon(path, western_emoticon)
  emojidex = load_library(path)
  emojidex.each do |meaning, emoticon_list|
    return emoticon_list[:japanese] if emoticon_list[:english] == western_emoticon
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, japanese_emoticon)
  emojidex = load_library(path)
  emojidex.each do |meaning, emoticon_list|
    return meaning.to_s if emoticon_list[:japanese] == japanese_emoticon
  end
  return "Sorry, that emoticon was not found"
end