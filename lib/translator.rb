# require modules here
def load_library(file_name)
  require 'yaml'
  final_hash= {}
  faces_hash= {}
  old_hash = YAML.load_file(file_name)
  old_hash.each do |names, faces|
    old_hash[name] do |face|
      if face == old_hash[name][0]
        final_hash[name] = faces_hash
        faces_hash[:english] = face
      elsif face == old_hash[name][1]
        faces_hash[:japanese] = face
      end
    end
  end
  final_hash
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end