require "yaml"
require "pry"

def load_library(lib_file)
all_emos = YAML.load_file(lib_file) #read file

#rearrange hash
all_emos.each_with_object({}) do | (emo_name, langs), org_emo | 
  org_emo[emo_name] = {
    :english => langs[0],
    :japanese => langs[1]
  }
end
end

def get_japanese_emoticon(lib_file, emo)
  org_emos = load_library(lib_file) 
  org_emos.each do |name, val|
    if val[:english] == emo 
      return val[:japanese]
    end
  end
p "Sorry, that emoticon was not found"
end

def get_english_meaning(lib_file, emo)
 org_emos = load_library(lib_file)
 org_emos.each do |name, val|
  if val[:japanese] == emo 
    return name
  end
end
p "Sorry, that emoticon was not found"
end