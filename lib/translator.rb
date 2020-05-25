# require modules here
require "yaml"

def load_library(file)
  # code goes here
  loaded_library = YAML.load_file(file)
  new_library = {}
  
  loaded_library.each { |emotion, translation|
    new_library[emotion] = {
      english: loaded_library[emotion][0],
      japanese: loaded_library[emotion][1]
    }  
  }
  new_library
end

def get_japanese_emoticon(file, american_emote)
  # code goes here
  library = load_library(file)
  library.each { |word, emotes|
    if emotes[:english] == american_emote
      return emotes[:japanese]
    end
  }
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, japanese_emote)
  # code goes here
  library = load_library(file)
  library.each { |word, emotes|
    if emotes[:japanese] == japanese_emote
      return word
    end
  }
  return "Sorry, that emoticon was not found"
end

# load_library