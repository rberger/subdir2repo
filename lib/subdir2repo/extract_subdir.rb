require "methadone"

module Subdir2repo
  include Methadone::SH
  def extract_subdir(src_repo, tgt, options)
    sh "git clone #{src_repo} tgt[:dst_repo_path]"
    Dir.chdir tgt[:dst_repo_path]

    help_now! "Not in Correct Directory. Should be in #{tgt[:dst_repo_path].inspect} but in: #{Dir.pwd}" unless Dir.pwd == tgt[:dst_repo_path]

    sh "git remote rm origin"
    sh "git tag -l | xargs git tag -d"
    sh "git filter-branch --tag-name-filter cat --prune-empty --subdirectory-filter tgt[:name] -- --all"
    sh "git reset --hard"
    sh "git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d"
    sh "git reflog expire --expire=now --all"
    sh "git gc --aggressive --prune=now"
    
  end
end
