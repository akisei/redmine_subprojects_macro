require 'redmine'

module SubprojectsMacro
  Redmine::WikiFormatting::Macros.register do
    desc "Displays subprojects list. Examples:\n\n" +
             "{{subprojects}}"
    macro :subprojects do |obj, args|
      return '' unless @project

      depth = args.first.to_i

      render_subprojects = lambda do |p, c, d|
        subprojects = p.children.visible.to_a
        next unless subprojects.any?
        c << "<ul>\n"
        subprojects.each do |subproject|
          c << "<li>" + link_to(subproject, project_path(subproject)) + "</li>\n"
          render_subprojects.call(subproject, c, d - 1) if d > 0
        end
        c << "</ul>\n"
        c
      end

      content = ''
      render_subprojects.call(@project, content, depth)
      content.html_safe
    end
  end
end