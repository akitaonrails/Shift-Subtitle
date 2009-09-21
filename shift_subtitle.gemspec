# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shift_subtitle}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fabio Akita"]
  s.date = %q{2009-09-20}
  s.default_executable = %q{shift_subtitle}
  s.description = %q{Easy way to shift time from your SRT subtitle files.}
  s.email = %q{fabioakita@gmail.com}
  s.executables = ["shift_subtitle"]
  s.files = ["bin/shift_subtitle", "bin/shift_subtitle.cmd", "lib/srt_time", "lib/srt_time/version.rb", "lib/srt_time.rb", "spec/fixtures", "spec/fixtures/input.srt", "spec/fixtures/output.srt", "spec/shift_subtitle_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/srt_time_spec.rb", "tasks/gems.rake", "templates/.gitignore"]
  s.homepage = %q{http://www.akitaonrails.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Time shifter for SRT subtitles.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
