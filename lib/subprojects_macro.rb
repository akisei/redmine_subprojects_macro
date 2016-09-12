require 'redmine'

module SubprojectsMacro
  Redmine::WikiFormatting::Macros.register do
    desc "Displays subprojects list. Examples:\n\n" +
             "{{subprojects}}"
    macro :subprojects do |obj, args|
      return '' unless @project

      hierarchy = args.first.to_i

      render_subprojects = lambda do |project, html, hierarchy|
        subprojects = project.children.visible.to_a
        next unless subprojects.any?
        html << "<ul>\n"
        subprojects.each do |subproject|
          html << "<li>" + link_to(subproject, project_path(subproject)) + "</li>\n"
          render_subprojects.call(subproject, html, hierarchy - 1) if hierarchy > 0
        end
        html << "</ul>\n"
        html
      end

      content = ''
      render_subprojects.call(@project, content, hierarchy)
      content.html_safe
    end
  end
end