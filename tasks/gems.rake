shift_subtitle_gemspec = Gem::Specification.new do |s|
  s.name = %q{shift_subtitle}
  s.version = SrtTime::VERSION::STRING

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fabio Akita"]
  s.date = %q{Time.now.strftime("%Y/%d/%m")}
  s.default_executable = %q{shift_subtitle}
  s.description = %q{Easy way to shift time from your SRT subtitle files.}
  s.email = %q{fabioakita@gmail.com}
  s.executables = ["shift_subtitle"]
  s.files = Dir.glob("{bin,lib,spec,tasks}/**/*")
  s.has_rdoc = false
  s.homepage = %q{http://www.akitaonrails.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Time shifter for SRT subtitles.}
end

Rake::GemPackageTask.new(shift_subtitle_gemspec) do |pkg|
  pkg.gem_spec = shift_subtitle_gemspec
end

namespace :gem do
  namespace :spec do
    desc "Update shift_subtitle.gemspec"
    task :generate do
      File.open("shift_subtitle.gemspec", "w") do |f|
        f.puts(shift_subtitle_gemspec.to_ruby)
      end
    end
  end
end

desc "Generate package and install"
task :install => :package do
  sh "sudo gem install --local pkg/shift_subtitle-#{SrtTime::VERSION::STRING}"
end

desc "Remove all generated artifacts"
task :clean => :clobber_package