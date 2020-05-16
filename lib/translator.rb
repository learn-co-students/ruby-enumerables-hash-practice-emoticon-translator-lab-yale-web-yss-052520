require "yaml"

def load_library(path)
  library = YAML.load_file(path)
  
  new_library = {}
  
  library.each do |key, array|
    new_library[key] = {
      english: array[0],
      japanese: array[1]
    }
  end
    
  new_library
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  
  library.each do |key, dict|
    if dict[:english] == emoticon
      return dict[:japanese]
    end
  end
  
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  
  library.each do |key, dict|
    if dict[:japanese] == emoticon
      return key
    end
  end
  
  "Sorry, that emoticon was not found"
end