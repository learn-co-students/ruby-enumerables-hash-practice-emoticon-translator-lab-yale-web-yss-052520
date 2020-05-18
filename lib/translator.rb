# require modules here
require 'yaml'
require 'pry'

def load_library(filepath)
  #getting original library
  library = YAML.load(File.read(filepath))

  #reorganizing data
  new_library = {}
  for emotion in library.keys
    new_library[emotion] = {:english => library[emotion][0], :japanese => library[emotion][1]}
  end
  new_library
end

def get_japanese_emoticon(filepath, emoticon)
  library = load_library(filepath)
  result = "Sorry, that emoticon was not found" #default return value
  
  #getting translation
  for emotion in library.keys
    if library[emotion][:english] == emoticon
      result = library[emotion][:japanese]
    end
  end
  result
end

def get_english_meaning(filepath, japanese_emoticon)
  library = load_library(filepath)
  result = "Sorry, that emoticon was not found" #default return value

  #getting translation
  for emotion in library.keys
    if library[emotion][:japanese] == japanese_emoticon
      result = emotion
    end
  end
  result
end