# require modules here
require "yaml"

def load_library(file)
  emotes = YAML.load_file(file)
  emotes.each_pair{|key, value|
    emotes[key] = {:english => emotes[key][0], :japanese => emotes[key][1]}
  }
end


def get_english_meaning(path, emoticon)
  emotes = load_library(path)
  meaning = "Sorry, that emoticon was not found"
  emotes.each_pair{|key, value|
    emotes[key].each_pair {|innerkey, innervalue|
      meaning = key if innervalue == emoticon
    }
  }

meaning

end


def get_japanese_emoticon(path, emoticon)
  emotes = load_library(path)
  meaning = "Sorry, that emoticon was not found"
  emotes.each_pair{|key, value|
    emotes[key].each_pair {|innerkey, innervalue|
      meaning = emotes[key][:japanese] if innervalue == emoticon
    }
  }

meaning
end
