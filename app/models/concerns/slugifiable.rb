class Slugfile

def slugify(file_name)
  file_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
end

end
