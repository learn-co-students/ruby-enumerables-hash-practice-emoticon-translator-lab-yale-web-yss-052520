require "pry"
require "yaml"

def load_library(path)
  file = YAML.load_file(path)
  file.each do |des,faces| 
    file[des] = {}
    file[des][:english] = faces[0]
    file[des][:japanese] = faces[1]
  end 
end

def get_japanese_emoticon(path, emote)
  hash = load_library(path)
  hash.each do |des, lang_hash|
    return hash[des][:japanese] if hash[des][:english] == emote
  end 
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emote)
  hash = load_library(path)
  hash.each do |des, lang_hash| 
    return des if lang_hash[:japanese] == emote
  end 
  return "Sorry, that emoticon was not found"
end