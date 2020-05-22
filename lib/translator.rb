# require modules here
#require 'pry'
def load_library(file_name)
  require 'yaml'
  final_hash= {}
  old_hash = YAML.load_file(file_name)
  old_hash.each do |name, faces|
    #binding.pry
    faces_hash = {}
    old_hash[name].each do |face|
      if face == old_hash[name][0]
        final_hash[name] = faces_hash
        faces_hash[:english] = face
        #binding.pry
      elsif face == old_hash[name][1]
        faces_hash[:japanese] = face
        #binding.pry
      end
    end
  end
  final_hash
  #binding.pry
end

def get_japanese_emoticon(file_name, english_face)
  final_hash = load_library(file_name)
  final_hash.each do |name, faces_hash|
    final_hash[name].each do |language, face|
      if english_face == face
        #binding.pry
        return final_hash[name][:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_name, japanese_face)
  final_hash = load_library(file_name)
  final_hash.each do |name, faces_hash|
    #binding.pry
    final_hash[name].each do |language, face|
      if face == japanese_face
        return name
      end
    end
  end
  return "Sorry, that emoticon was not found"
end