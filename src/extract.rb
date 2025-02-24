require 'pdf-reader'

def extract_ruby_code(file_path = "./sample/sample_ruby_code.pdf")
  return if file_path.nil?
  code_blocks = []

  File.open(file_path, "rb") do |io|
    reader = PDF::Reader.new(io)    
    extracted_text = reader.pages.map(&:text).join("\n")
    # extract class ... end pattern
    class_definitions = extracted_text.scan(/class\s+\w+.*end/m)
    code_blocks.concat(class_definitions.map(&:strip))
  end

  return code_blocks.join("").gsub(/\n{2,}/, "\n")
end
