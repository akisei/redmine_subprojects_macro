Redmine::Plugin.register :redmine_subprojects_macro do
  name 'Redmine Subprojects Macro plugin'
  author 'akisei'
  description 'Add a macro to display sub-projects plugin for Redmine'
  version '0.0.2'
  url 'https://github.com/akisei/redmine_subprojects_macro'
  author_url 'https://github.com/akisei'

  require_dependency 'subprojects_macro'
end

