require "subdir2repo/version"

module Subdir2repo
  DEFAULTS = {
    :new_repo_parent_dir => "/tmp/subdir2repo"
    }

  def self.command?(name)
    `command -v #{name}`
    $?.success?
  end
end
