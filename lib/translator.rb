# require modules here
require "yaml"

def load_library(data)
  data = YAML.load_file('lib/emoticons.yml')
  new_hash = {}
  data.each do |key,value|
    new_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  new_hash
end



def get_english_meaning(filename,emote)
  data = load_library(filename)
  data.each do |key,value|
    if data[key][:japanese].eql?(emote)
      return key
    end
  end
  "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(filename,emote)
  data = load_library(filename)
  data.each do |key,value|
    if data[key][:english].eql?(emote)
      return data[key][:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end