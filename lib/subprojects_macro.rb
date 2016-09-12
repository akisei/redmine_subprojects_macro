require 'redmine'

module SubprojectsMacro
  Redmine::WikiFormatting::Macros.register do
    desc "Displays subprojects list. Examples:\n\n" +
             "{{subprojects}} -- same as {{subprojects(depth=0)}} \n" +
             "{{subprojects(depth=2)}} -- display 2 levels nesting"

    macro :subprojects do |obj, args|
      return '' unless @project

      args, options = extract_macro_options(args, :depth)
      options[:depth] = options[:depth].present? ? options[:depth].to_i : 0

      render_subprojects = lambda do |p, c, d|
        ss = p.children.visible.to_a
        next unless ss.any?
        c << "<ul>\n"
        ss.each do |s|
          c << "<li>" + link_to(s, project_path(s)) + "</li>\n"
          render_subprojects.call(s, c, d - 1) if d > 0
        end
        c << "</ul>\n"
      end

      render_subprojects.call(@project, '', options[:depth]).html_safe
    end
  end
end