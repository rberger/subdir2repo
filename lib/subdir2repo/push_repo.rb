require "methadone"
require 'subdir2repo'

module Subdir2repo
  include Methadone::SH
  include Methadone::CLILogging

  def self.push_repo(target, options)
    exit_now! -1, "Requires the 'hub' command from http://defunkt.io/hub/" unless command? "hub"

    github_name = "#{options[:git_org]}/#{target[:name]}"
    
    info "Creating github repo: #{github_name.inspect}"
    sh "hub create #{github_name} -p"

    info "Pushing from #{Dir.pwd} to #{github_name}"
    sh "git push origin"

    info "Completed pushing #{github_name}"
  end
end
