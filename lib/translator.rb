require "yaml"

def load_library(file)
  hash = {
    "get_meaning" =>
      {},
    "get_emoticon" =>
      {}
  }
  library = YAML.load_file(file)
  library.each do |meaning, emoticons|
    emoticons.each do |emoji|
      if emoticons.index(emoji) == 0
        hash["get_emoticon"][emoji] = emoticons[1]
      else
        hash["get_meaning"][emoji] = meaning
      end
    end
  end
  hash
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  if library["get_emoticon"][emoticon]
    library["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  if library["get_meaning"][emoticon]
    library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
