Gem::Specification.new do |s|
  s.name = 'codeforces'
  s.authors = %w[George]
  s.email = 'somu@so.mu'

  s.description = 'Codeforces automatization tool'
  s.homepage = 'http://rubygems.org/gems/codeforces'
  s.summary = 'Test suite generator'

  s.version = '0.1.0'
  s.platform = Gem::Platform::RUBY
  s.date = Time.now.to_s

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = %w[lib]
end
