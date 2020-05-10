# require modules here
require "yaml"
puts YAML.load_file('lib/emoticons.yml')

def load_library(file_path = 'lib/emoticons.yml')
  # code goes here
  new_hash = {}
  library = YAML.load_file(file_path)
  library.map do |(key, value)|
   new_hash[key] = {
     :english => value[0],
     :japanese => value[1]
   }
   end
   
   new_hash
end

def get_japanese_emoticon(file_path, english_emoticon)
  # code goes here
  library = load_library(file_path)
  library.each do |(key, value)|
    if (value[:english] == english_emoticon)
    return value[:japanese]
    end
    
  end  
  p "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  # code goes here
  library = load_library(file_path)
  library.each do |(key, value)|
    if value[:japanese] == japanese_emoticon
    return key
    end
  end
  p "Sorry, that emoticon was not found"
end