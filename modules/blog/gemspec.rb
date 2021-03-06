SPEC = Gem::Specification.new do |spec| 
  spec.name = "browser_cms_blog_module" 
  spec.rubyforge_project = spec.name
  spec.version = "3.0.0" 
  spec.summary = "The Blog Module for BrowserCMS" 
  spec.author = "Browsermedia" 
  spec.email = "admin@browsercms.com" 
  spec.homepage = "http://www.browsercms.com" 
  spec.files += Dir["app/**/*"]
  spec.files += Dir["db/migrate/[0-9]*_*.rb"]
  spec.files += Dir["lib/**/*"]
  spec.files += Dir["rails/*"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README"]
  spec.require_path "lib"
end