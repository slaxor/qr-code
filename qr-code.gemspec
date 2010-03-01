# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{QRCode}
  s.version = "0.0.0-dontwantouse"

  s.required_rubygems_version = Gem::Requirement.new(">= 0.0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sascha Teske"]
  s.date = %q{2010-03-30}
  s.default_executable = %q{generate_qrcode}
  s.description = %q{QR-Code generator}
  s.email = %q{sascha.teske@gmail.com}
  s.executables = ["generate_qrcode"]
  s.extensions = ["ext/redcloth_scan/extconf.rb"]
  s.extra_rdoc_files = ["CHANGELOG", "README"]
  s.files = File.read('Manifest')
  s.has_rdoc = true
  s.homepage = %q{http://github.com/slaxor/qr-code}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "QR-Code", "--main", "README"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.4")
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{QR-Code - as seen an github (http://github.com/slaxor/qr-code)}
end
