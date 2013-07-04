require "methadone"

module Subdir2repo
  include Methadone::SH
  def extract_subdir(src_repo, subdir, new_repo_name, options)

    parent_dir = options[:new_repo_parent_dir]
    
    target_dir = File.join parent_dir, subdir
    case
    when not Dir.exist? src_repo
      help_now! "src_repo: #{src_repo.inspect} is not a directory"
    when not Dir.exist? "#{src_repo}/.git"
      help_now! "src_repo: #{src_repo.inspect} is not a git repo (no #{src_repo}/.git)"
    end
    
    sh "git clone "
  end
end
