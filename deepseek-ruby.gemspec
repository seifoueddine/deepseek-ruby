Gem::Specification.new do |spec|
  spec.name = "deepseek-ruby"
  spec.version = Deepseek::VERSION
  spec.authors = ["Seif Eddine NOUARA"]
  spec.email = ["contact@seifeddinenouara.com"]
  spec.summary = "Official Ruby client for the Deepseek API"
  spec.description = "A Ruby wrapper for Deepseek's API providing LLM capabilities in Ruby applications"
  spec.homepage = "https://github.com/seifoueddine/deepseek-ruby"
  spec.license = "MIT"
  
  spec.files = Dir["lib/**/*"] + ["README.md"]
  spec.require_paths = ["lib"]
  
  spec.required_ruby_version = ">= 2.6"
  
  spec.add_dependency "faraday", ">= 1.0"
  spec.add_dependency "json"
  
  spec.metadata = {
  "homepage_uri" => spec.homepage,
  "source_code_uri" => spec.homepage,
  "documentation_uri" => "#{spec.homepage}/blob/main/README.md"
  }
end