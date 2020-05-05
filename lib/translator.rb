# require modules here
require "yaml"
def load_library(address)
  # code goes here
  h = YAML.load_file(address)
  output = {}
  h.reduce({}) do |memo, (key, value)|
    p = {
      :english => value[0],
      :japanese => value[1]
    }
    output[key] = p
    memo
  end
  output

end

def get_english_meaning(address, emoji)
  # code goes here
  h = load_library(address)

  h.reduce({}) do |memo, (key, value)|
    if value[:japanese] == emoji

      return key.to_s
    end
  end
  return "Sorry, that emoticon was not found"

end


def get_japanese_emoticon (address, emoji)
  # code goes here
  h = load_library(address)

  h.reduce({}) do |memo, (key, value)|
    if value[:english] == emoji

      return value[:japanese]
    end
  end

  return "Sorry, that emoticon was not found"

end
