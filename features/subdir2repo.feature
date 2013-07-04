Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: App just runs
    When I get help for "subdir2repo"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
      |--git_org|
      |--new_repo_parent_dir|
      |--repo_name|
    And the banner should document that this app's arguments are:
      |src_repo|which is required|
      |subdir|which is required|


