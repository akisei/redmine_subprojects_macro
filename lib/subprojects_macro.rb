require 'redmine'

module SubprojectsMacro
  Redmine::WikiFormatting::Macros.register do
    desc "Displays subprojects list. Examples:\n\n" +
             "{{subprojects}}"
    macro :subprojects do |obj, args|
      return '' unless @project

      subprojects = @project.children.visible.to_a
      return '' unless subprojects.any?

      content = "<ul>\n"
      subprojects.each do |p|
        content << "<li>" + link_to(p, project_path(p)) + "</li>\n"
      end
      content << "</ul>\n"
      content.html_safe
    end
  end
end