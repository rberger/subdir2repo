require "methadone"
require 'subdir2repo'

module Subdir2repo
  include Methadone::SH
  include Methadone::CLILogging

  def self.extract_subdir(src_repo, target, options)
    sh "git clone #{src_repo} #{target[:dst_repo_path]}"
    Dir.chdir target[:dst_repo_path]

    exit_now! -1, "Not in Correct Directory. Should be in #{target[:dst_repo_path].inspect} but in: #{Dir.pwd}" unless Dir.pwd == target[:dst_repo_path]

    info "In your #{Dir.pwd} making it a local repo"
    sh "git remote rm origin"
    sh "git tag -l | xargs git tag -d"
    sh "git filter-branch --tag-name-filter cat --prune-empty --subdirectory-filter #{target[:subdir]} -- --all"
    sh "git reset --hard"
    sh "git for-each-ref --format=\"%(refname)\" refs/original/ | xargs -n 1 git update-ref -d"
    sh "git reflog expire --expire=now --all"
    sh "git gc --aggressive --prune=now"
    info "Done makeing a local repo #{target[:name]} in #{Dir.pwd}"
  end
end
