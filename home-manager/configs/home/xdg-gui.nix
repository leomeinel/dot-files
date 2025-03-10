/*
  File = xdg-gui.nix
  Author = Leopold Meinel (leo@meinel.dev)
  -----
  Copyright (c) 2025 Leopold Meinel & contributors
  SPDX ID = MIT
  URL = https://opensource.org/licenses/MIT
  -----
*/

{
  config,
  ...
}:

{
  xdg = {
    userDirs.pictures = "${config.xdg.userDirs.documents}/Pictures";
    configFile = {
      # alacritty
      "alacritty/alacritty.toml" = {
        text = ''
          [general]
          live_config_reload = true

          [colors.primary]
          background = '#282828'
          foreground = '#ebdbb2'

          [colors.normal]
          black = '#282828'
          red = '#cc241d'
          green = '#98971a'
          yellow = '#d79921'
          blue = '#458588'
          magenta = '#b16286'
          cyan = '#689d6a'
          white = '#a89984'

          [colors.bright]
          black = '#928374'
          red = '#fb4934'
          green = '#b8bb26'
          yellow = '#fabd2f'
          blue = '#83a598'
          magenta = '#d3869b'
          cyan = '#8ec07c'
          white = '#ebdbb2'

          [window]
          padding = { x = 0, y = 0 }
          decorations = "none"
          decorations_theme_variant = "None"
          opacity = 1.0
          startup_mode = "Maximized"
          title = "Alacritty"
          dynamic_title = false
          class = { instance = "Alacritty", general = "Alacritty" }

          [scrolling]
          history = 10000
          multiplier = 3

          [mouse]
          hide_when_typing = true

          [font]
          size = 10
          normal = { family = "Noto Sans Mono", style = "Regular" }
          bold = { family = "Noto Sans Mono", style = "Bold" }
          italic = { family = "Noto Sans Mono", style = "Italic" }
          bold_italic = { family = "Noto Sans Mono", style = "Bold Italic" }

          [env]
          TERM = "alacritty"
        '';
      };
      # eclipse-style-guides
      "eclipse-style-guides/java.xml" = {
        text = ''
          <?xml version="1.0" encoding="UTF-8" standalone="no"?>
          <profiles version="13">
              <profile kind="CodeFormatterProfile" name="GoogleStyle" version="13">
                  <setting id="org.eclipse.jdt.core.formatter.comment.insert_new_line_before_root_tags" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.disabling_tag" value="@formatter:off" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_annotation" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_type_parameters" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_type_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_type_arguments" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_anonymous_type_declaration" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_colon_in_case" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_brace_in_array_initializer" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.new_lines_at_block_boundaries" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_cascading_method_invocation_with_arguments.count_dependent" value="16|-1|16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_in_empty_annotation_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_annotation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_before_field" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_while" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.use_on_off_tags" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_prefer_two_fragments" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_annotation_type_member_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_before_else_in_if_statement" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_prefix_operator" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.keep_else_statement_on_same_line" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_ellipsis" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.insert_new_line_for_parameter" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_comment_inline_tags" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_annotation_type_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_breaks_compare_to_cases" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_at_in_annotation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_local_variable_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_multiple_fields" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_parameter" value="1040" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_expressions_in_array_initializer" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_type.count_dependent" value="1585|-1|1585" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_conditional_expression" value="80" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_for" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_multiple_fields.count_dependent" value="16|-1|16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_binary_operator" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_question_in_wildcard" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_array_initializer" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_enum_constant" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_before_finally_in_try_statement" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_local_variable" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_before_catch_in_try_statement" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_while" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_after_package" value="1" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_qualified_allocation_expression.count_dependent" value="16|4|80" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_throws_clause_in_method_declaration.count_dependent" value="16|4|48" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_type_parameters" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.continuation_indentation" value="2" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_superinterfaces_in_enum_declaration.count_dependent" value="16|4|49" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_postfix_operator" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_method_invocation" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_angle_bracket_in_type_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_superinterfaces" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_before_new_chunk" value="1" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_binary_operator" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_before_package" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_cascading_method_invocation_with_arguments" value="16" />
                  <setting id="org.eclipse.jdt.core.compiler.source" value="1.7" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_throws_clause_in_constructor_declaration.count_dependent" value="16|4|48" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_enum_constant_arguments" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_constructor_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.format_line_comments" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_closing_angle_bracket_in_type_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_enum_declarations" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.join_wrapped_lines" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_block" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_explicit_constructor_call" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_non_simple_local_variable_annotation" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_method_invocation_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.align_type_members_on_columns" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_before_member_type" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_enum_constant" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_enum_constants.count_dependent" value="16|5|48" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_for" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_method_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_selector_in_method_invocation" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_switch" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_unary_operator" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_colon_in_case" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.indent_parameter_description" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_method_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_switch" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_enum_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_angle_bracket_in_type_parameters" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.clear_blank_lines_in_block_comment" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_in_empty_type_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.lineSplit" value="100" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_if" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_selector_in_method_invocation.count_dependent" value="16|4|48" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_brackets_in_array_type_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_parenthesized_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_explicitconstructorcall_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_constructor_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_before_first_class_body_declaration" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_method" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.indentation.size" value="4" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_method_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.enabling_tag" value="@formatter:on" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_enum_constant" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_package" value="1585" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_superclass_in_type_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_assignment" value="16" />
                  <setting id="org.eclipse.jdt.core.compiler.problem.assertIdentifier" value="error" />
                  <setting id="org.eclipse.jdt.core.formatter.tabulation.char" value="space" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_semicolon_in_try_resources" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_constructor_declaration_parameters" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_prefix_operator" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_statements_compare_to_body" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_before_method" value="1" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_outer_expressions_when_nested" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_non_simple_type_annotation" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.format_guardian_clause_on_one_line" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_colon_in_for" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_field_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_cast" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_parameters_in_constructor_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_colon_in_labeled_statement" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_annotation_type_declaration" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_in_empty_method_body" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_method_declaration" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_try" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_method_invocation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_bracket_in_array_allocation_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_enum_constant" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_annotation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_at_in_annotation_type_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_method_declaration_throws" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_if" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_switch" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_method_declaration_throws" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_parenthesized_expression_in_return" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_annotation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_question_in_conditional" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_question_in_wildcard" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_try" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_bracket_in_array_allocation_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.preserve_white_space_between_code_and_line_comments" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_parenthesized_expression_in_throw" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_type_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.compiler.problem.enumIdentifier" value="error" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_generic_type_arguments" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_switchstatements_compare_to_switch" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.comment_new_line_at_start_of_html_paragraph" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_ellipsis" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_block" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comment_prefix" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_for_inits" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_method_declaration" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.compact_else_if" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_non_simple_parameter_annotation" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_before_or_operator_multicatch" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_array_initializer" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_for_increments" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_method" value="1585" />
                  <setting id="org.eclipse.jdt.core.formatter.format_line_comment_starting_on_first_column" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_bracket_in_array_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_field" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.indent_root_tags" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_enum_constant" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_enum_declarations" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_union_type_in_multicatch" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_explicitconstructorcall_arguments" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_switch" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_method_declaration_parameters" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_superinterfaces" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_allocation_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.tabulation.size" value="2" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_bracket_in_array_type_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_opening_brace_in_array_initializer" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_closing_brace_in_block" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_bracket_in_array_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_in_empty_enum_constant" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_angle_bracket_in_type_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_constructor_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_constructor_declaration_throws" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_if" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_method_invocation.count_dependent" value="16|5|80" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.clear_blank_lines_in_javadoc_comment" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_parameter.count_dependent" value="1040|-1|1040" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_throws_clause_in_constructor_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_assignment_operator" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_assignment_operator" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_package.count_dependent" value="1585|-1|1585" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_empty_lines" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_synchronized" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_closing_paren_in_cast" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_method_declaration_parameters" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.force_if_else_statement_brace" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_block_in_case" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.number_of_empty_lines_to_preserve" value="3" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_non_simple_package_annotation" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_method_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_catch" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_constructor_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_method_invocation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_bracket_in_array_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_qualified_allocation_expression" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_annotation.count_dependent" value="16|-1|16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_and_in_type_parameter" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_type" value="1585" />
                  <setting id="org.eclipse.jdt.core.compiler.compliance" value="1.7" />
                  <setting id="org.eclipse.jdt.core.formatter.continuation_indentation_for_array_initializer" value="2" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_empty_brackets_in_array_allocation_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_at_in_annotation_type_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_allocation_expression" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_cast" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_unary_operator" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_new_anonymous_class" value="20" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_angle_bracket_in_parameterized_type_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_local_variable.count_dependent" value="1585|-1|1585" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_anonymous_type_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.keep_empty_array_initializer_on_one_line" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_in_empty_enum_declaration" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_field.count_dependent" value="1585|-1|1585" />
                  <setting id="org.eclipse.jdt.core.formatter.keep_imple_if_on_one_line" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_constructor_declaration_parameters" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_closing_angle_bracket_in_type_parameters" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_colon_in_labeled_statement" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_at_end_of_file_if_missing" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_colon_in_for" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_parameterized_type_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_parameters_in_constructor_declaration.count_dependent" value="16|5|80" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_superinterfaces_in_type_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_enum_declaration" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_binary_expression" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_while" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_type" value="insert" />
                  <setting id="org.eclipse.jdt.core.compiler.codegen.inlineJsrBytecode" value="enabled" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_try" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.put_empty_statement_on_new_line" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_label" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_parameter" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_angle_bracket_in_type_parameters" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_method_invocation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.format_javadoc_comments" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_enum_constant" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_before_while_in_do_statement" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_enum_constant.count_dependent" value="16|-1|16" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.line_length" value="100" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_after_annotation_on_package" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_between_import_groups" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_enum_constant_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_semicolon" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_constructor_declaration" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.number_of_blank_lines_at_beginning_of_method_body" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_colon_in_conditional" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_type_header" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_annotation_type_member_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_before_binary_operator" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_between_type_declarations" value="2" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_enum_declaration_header" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_synchronized" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_superinterfaces_in_enum_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_statements_compare_to_block" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.join_lines_in_comments" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_question_in_conditional" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_multiple_field_declarations" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_compact_if" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_for_inits" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_switchstatements_compare_to_cases" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_array_initializer" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_colon_in_default" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_and_in_type_parameter" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_empty_parens_in_constructor_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_before_imports" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_colon_in_assert" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_field" value="1585" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.format_html" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_throws_clause_in_method_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_angle_bracket_in_type_parameters" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_bracket_in_array_allocation_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_in_empty_anonymous_type_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_colon_in_conditional" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_angle_bracket_in_parameterized_type_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_for" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_expressions_in_array_initializer.count_dependent" value="16|5|80" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_postfix_operator" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.format_source_code" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_synchronized" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_allocation_expression" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_constructor_declaration_throws" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_parameters_in_method_declaration" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_brace_in_array_initializer" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.compiler.codegen.targetPlatform" value="1.7" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_resources_in_try" value="80" />
                  <setting id="org.eclipse.jdt.core.formatter.use_tabs_only_for_leading_indentations" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_annotation" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.format_header" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.format_block_comments" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_enum_constant" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_enum_constants" value="0" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_parenthesized_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_annotation_declaration_header" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_new_line_in_empty_block" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_parenthesized_expression" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_catch" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_multiple_local_declarations" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_superinterfaces_in_type_declaration.count_dependent" value="16|4|48" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_switch" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_comma_in_for_increments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_method.count_dependent" value="1585|-1|1585" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_method_invocation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_colon_in_assert" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.brace_position_for_type_declaration" value="end_of_line" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_brace_in_array_initializer" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_between_empty_braces_in_array_initializer" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_binary_expression.count_dependent" value="16|-1|16" />
                  <setting id="org.eclipse.jdt.core.formatter.wrap_non_simple_member_annotation" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_annotations_on_local_variable" value="1585" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_opening_paren_in_method_declaration" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_semicolon_in_for" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_explicit_constructor_call.count_dependent" value="16|5|80" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_paren_in_catch" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_angle_bracket_in_parameterized_type_reference" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_multiple_field_declarations" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_closing_paren_in_annotation" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_generic_type_arguments.count_dependent" value="16|-1|16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_parameterized_type_reference" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_arguments_in_allocation_expression.count_dependent" value="16|5|80" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_method_invocation_arguments" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_parameters_in_method_declaration.count_dependent" value="16|5|80" />
                  <setting id="org.eclipse.jdt.core.formatter.comment.new_lines_at_javadoc_boundaries" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.blank_lines_after_imports" value="1" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_comma_in_multiple_local_declarations" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.indent_body_declarations_compare_to_enum_constant_header" value="true" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_after_semicolon_in_for" value="insert" />
                  <setting id="org.eclipse.jdt.core.formatter.never_indent_line_comments_on_first_column" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_semicolon_in_try_resources" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.alignment_for_for_statement" value="16" />
                  <setting id="org.eclipse.jdt.core.formatter.insert_space_before_opening_angle_bracket_in_type_arguments" value="do not insert" />
                  <setting id="org.eclipse.jdt.core.formatter.never_indent_block_comments_on_first_column" value="false" />
                  <setting id="org.eclipse.jdt.core.formatter.keep_then_statement_on_same_line" value="false" />
              </profile>
          </profiles>
        '';
      };
      # Kvantum
      "Kvantum/kvantum.kvconfig" = {
        text = ''
          [General]
          theme=ArcDark
        '';
      };
      # nwg-bar
      "nwg-bar/bar.json" = {
        text = ''
          [
            {
              "label": "Lock",
              "exec": "/usr/bin/swaylock -f -c 001d2021",
              "icon": "/usr/share/nwg-bar/images/system-lock-screen.svg"
            },
            {
              "label": "Logout",
              "exec": "/usr/local/bin/sway-logout",
              "icon": "/usr/share/nwg-bar/images/system-log-out.svg"
            },
            {
              "label": "Reboot",
              "exec": "/usr/bin/systemctl reboot",
              "icon": "/usr/share/nwg-bar/images/system-reboot.svg"
            },
            {
              "label": "Shutdown",
              "exec": "/usr/bin/systemctl -i poweroff",
              "icon": "/usr/share/nwg-bar/images/system-shutdown.svg"
            }
          ]
        '';
      };
      "nwg-bar/style.css" = {
        text = ''
          @define-color white #ebdbb2;
          @define-color dark #1d2021;
          @define-color primary #fd472f;
          @define-color secondary #689d6a;
          @define-color hint #fabd2f;

          window {
            background-color: @dark;
          }

          /* Outer bar container, takes all the window width/height */
          #outer-box {
            margin: 0px;
          }

          /* Inner bar container, surrounds buttons */
          #inner-box {
            background-color: @dark;
            border-radius: 10px;
            border-style: none;
            border-width: 1px;
            border-color: @white;
            padding: 5px;
            margin: 5px;
          }

          button,
          image {
            background: none;
            border: none;
            box-shadow: none;
          }

          button {
            padding-left: 10px;
            padding-right: 10px;
            margin: 5px;
          }

          button:hover {
            background-color: @secondary;
          }
        '';
      };
      # qt6ct
      "qt6ct/qt6ct.conf" = {
        text = ''
          [Appearance]
          color_scheme_path=/usr/share/qt6ct/colors/airy.conf
          custom_palette=false
          icon_theme=Papirus-Dark
          standard_dialogs=default
          style=kvantum

          [Fonts]
          fixed="Noto Sans Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
          general="Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
        '';
      };
      # r
      "r/.Renviron" = {
        text = ''
          R_PROFILE_USER=${config.xdg.configHome}/r/.Rprofile
          R_LINTR_LINTER_FILE=${config.xdg.configHome}/r/.lintr
          R_LIBS_USER=${config.xdg.dataHome}/r/library
          R_HISTFILE=${config.xdg.stateHome}/r/history
          R_BROWSER=/usr/local/bin/librewolf
          R_PDFVIEWER=/usr/bin/evince
        '';
      };
      "r/.Rprofile" = {
        text = ''
          ##
          # https://wiki.archlinux.org/title/r#Profile
          ##

          # Called at the end
          .First <- function() {
              message(
                  "Welcome back ", Sys.getenv("USER"), "!\n",
                  "Working directory is: ", getwd()
              )
          }
          # General
          options(digits = 12)
          options(scipen = 2)
          options(show.signif.stars = FALSE)
          # Parallelization
          local({
              n <- max(parallel::detectCores() - 2L, 1L)
              options(Ncpus = n)
              options(mc.cores = n)
          })
          # CRAN Mirror
          local({
              r <- getOption("repos")
              r["CRAN"] <- "https://cloud.r-project.org/"
              options(repos = r)
          })
          # Debugging
          error <- quote(dump.frames("''${R_HOME_USER}/testdump", TRUE))
        '';
      };
      "r/.lintr" = {
        text = ''
          linters:linters_with_defaults(
              indentation_linter(
                  indent = 4L,
                  hanging_indent_style = c("tidy", "always", "never"),
                  assignment_as_infix = TRUE
                )
            )
        '';
      };
      # sway
      "sway/config.d/autostart" = {
        text = ''
          # Dbus
          exec /usr/bin/dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

          # polkit-gnome
          exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

          # Gnome Keyring
          exec /usr/bin/gnome-keyring-daemon --daemonize --start --components=gpg,pkcs11,secrets,ssh

          # Notifications
          exec /usr/bin/swaync
          exec /usr/bin/aa-notify -p -s 1 -w 60 -f /var/log/audit/audit.log

          # Outputs
          exec /usr/bin/kanshi

          # XDG Desktop Portal
          exec /usr/lib/xdg-desktop-portal

          # Tray
          exec /usr/bin/nm-applet --indicator
          exec /usr/bin/blueman-applet
          exec /usr/bin/nextcloud --background
        '';
      };
      "sway/config.d/bar" = {
        text = ''
          # Bar
          bar {
          	swaybar_command /usr/bin/waybar
          }
        '';
      };
      "sway/config.d/idle" = {
        text = ''
          # Idle
          exec swayidle -w timeout 300 '/usr/bin/swaylock -f -c 001d2021' timeout 600 '/usr/bin/swaymsg "output * dpms off"' resume '/usr/bin/swaymsg "output * dpms on"' before-sleep '/usr/bin/swaylock -f -c 001d2021'
        '';
      };
      "sway/config.d/input" = {
        text = ''
          # Input
          ## Disable mouse acceleration
          input "type:pointer" accel_profile flat
          ## Touchpad
          input "type:touchpad" {
          	tap enable
          	natural_scroll enable
          	scroll_factor 0.5
          }
          ## Keyboard
          input "type:keyboard" {
              xkb_layout REPLACE_KEYLAYOUT
          }
        '';
      };
      "sway/config.d/key-bindings" = {
        text = ''
          # Variables
          ## Modifiers
          set $mod Mod1+Shift
          set $super Mod4
          ## Home row direction keys
          set $left h
          set $down j
          set $up k
          set $right l
          ## Preferred applications
          set $term "$TERMINAL"
          set $menu /usr/bin/wofi --show run
          set $rectangle-screenshot /usr/bin/grim -g "$(/usr/bin/slurp)" "${config.xdg.userDirs.pictures}/Screenshots/$(/usr/bin/date -u +"%Y-%m-%dT%H-%M-%S").png"
          set $screenshot /usr/bin/grim "${config.xdg.userDirs.pictures}/Screenshots/$(/usr/bin/date -u +"%Y-%m-%dT%H-%M-%S").png"
          set $volume-down ${config.home.homeDirectory}/config.home.homeDirectory}/.config/sway/scripts/volume.sh --down
          set $volume-up ${config.home.homeDirectory}/config.home.homeDirectory}/.config/sway/scripts/volume.sh --up
          set $brightness-down /usr/bin/brightnessctl set 5%-
          set $brightness-up /usr/bin/brightnessctl set 5%+
          set $sway-exit /usr/bin/nwg-bar
          set $sway-notifications /usr/bin/swaync-client -t -sw

          # Applications
          ## Start terminal
          bindsym $super+Return exec $term
          ## Kill focused window
          bindsym $super+q kill
          ## Start launcher
          bindsym $super+d exec $menu
          ## Screenshots
          bindsym $super+Shift+Print exec $rectangle-screenshot
          bindsym $super+Print exec $screenshot
          ## Volume
          bindsym $super+F2 exec $volume-down
          bindsym $super+F3 exec $volume-up
          ## Brightness
          bindsym $super+F5 exec $brightness-down
          bindsym $super+F6 exec $brightness-up

          # Sway
          ## Reload config
          bindsym $super+Shift+c reload
          ## Exit sway
          bindsym $super+Shift+e exec $sway-exit
          ## Enter resize mode
          bindsym $mod+r mode "resize"
          ## Notifications
          bindsym $super+n exec $sway-notifications

          # Workspaces
          ## Switch to workspace
          bindsym $super+1 workspace number 1
          bindsym $super+2 workspace number 2
          bindsym $super+3 workspace number 3
          bindsym $super+4 workspace number 4
          bindsym $super+5 workspace number 5
          bindsym $super+6 workspace number 6
          bindsym $super+7 workspace number 7
          bindsym $super+8 workspace number 8
          bindsym $super+9 workspace number 9
          ## Move focused window to workspace
          bindsym $super+Shift+1 move container to workspace number 1
          bindsym $super+Shift+2 move container to workspace number 2
          bindsym $super+Shift+3 move container to workspace number 3
          bindsym $super+Shift+4 move container to workspace number 4
          bindsym $super+Shift+5 move container to workspace number 5
          bindsym $super+Shift+6 move container to workspace number 6
          bindsym $super+Shift+7 move container to workspace number 7
          bindsym $super+Shift+8 move container to workspace number 8
          bindsym $super+Shift+9 move container to workspace number 9

          # Move
          ## Move focus
          bindsym $super+$left focus left
          bindsym $super+$down focus down
          bindsym $super+$up focus up
          bindsym $super+$right focus right
          ## Move focused window
          bindsym $super+Shift+$left move left
          bindsym $super+Shift+$down move down
          bindsym $super+Shift+$up move up
          bindsym $super+Shift+$right move right

          # Layout
          ## Switch focused window to fullscreen
          bindsym $super+F11 fullscreen

          # Resize mode
          mode "resize" {
              bindsym $left resize shrink width 10px
              bindsym $down resize grow height 10px
              bindsym $up resize shrink height 10px
              bindsym $right resize grow width 10px
              # Return
              bindsym Escape mode "default"
          }
        '';
      };
      "sway/config.d/output" = {
        text = ''
          # Variables
          set $laptop eDP-1
          set $left DP-3
          set $right HDMI-A-1
          # Outputs
          ## Toggle internal display when lid open/closed
          bindswitch lid:on output $laptop disable
          bindswitch lid:off output $laptop enable
          ## Monitors
          output $left res 3840x2160@60.000Hz pos 0 0
          output $right res 3840x2160@60.000Hz pos 3840 0
          output $laptop res 1920x1080@60.000Hz pos 7680 0
          ## Workspaces
          workspace 1 output $left $right $laptop
          workspace 2 output $left $right $laptop
          workspace 3 output $left $right $laptop
          workspace 4 output $left $right $laptop
          workspace 5 output $left $right $laptop
          workspace 6 output $right $left $laptop
          workspace 7 output $right $left $laptop
          workspace 8 output $right $left $laptop
          workspace 9 output $right $left $laptop
        '';
      };
      "sway/config.d/reload" = {
        text = ''
          # Reload notification center
          exec_always /usr/bin/swaync-client -R
          exec_always /usr/bin/swaync-client -rs

          # Reload autotiling
          exec_always /usr/bin/autotiling
        '';
      };
      "sway/config.d/theme" = {
        text = ''
          # Colors
          set $c1 #fd472f
          set $c2 #d79921
          set $c3 #99a2ea
          set $c4 #333142
          set $c5 #342f73

          set $white #f4f4f8
          set $dark  #333333
          set $dim   #666666

          set $focused_bgcolor $white
          set $focused_textcolor $dark
          set $focused_indicator $c1

          set $inactive_bgcolor $c5
          set $inactive_textcolor $white
          set $inactive_indicator $c3

          set $unfocused_bgcolor $c4
          set $unfocused_textcolor $dim
          set $unfocused_indicator $c5

          set $urgent_bgcolor $c1
          set $urgent_textcolor $c4
          set $urgent_indicator $c3

          # Gaps
          gaps inner 0
          gaps outer 0
          smart_gaps on

          # Borders
          default_border normal 0
          smart_borders on
          client.focused $focused_bgcolor $focused_bgcolor $focused_textcolor $focused_indicator $focused_bgcolor
          client.focused_inactive $inactive_bgcolor $inactive_bgcolor $inactive_textcolor $inactive_indicator $inactive_bgcolor
          client.unfocused $unfocused_bgcolor $unfocused_bgcolor $unfocused_textcolor $unfocused_indicator $unfocused_bgcolor
          client.urgent $urgent_bgcolor $urgent_bgcolor $urgent_textcolor $urgent_indicator $urgent_bgcolor

          # Font
          font pango: NotoSansMono Regular 10

          # Title Bars
          for_window [app_id="^.*"] opacity 1
          default_border pixel 1
          default_floating_border pixel 2
          hide_edge_borders smart

          # GTK Theme
          exec /usr/bin/gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
          exec /usr/bin/gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
          exec /usr/bin/gsettings set org.gnome.desktop.wm.preferences theme 'Arc-Dark'
          exec /usr/bin/gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

          # Background
          exec /usr/bin/swaybg -i /usr/share/wallpapers/Custom/content/simple_tree.png
        '';
      };
      "sway/scripts/volume.sh" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash
          ###
          # File: volume.sh
          # Author: Leopold Meinel (leo@meinel.dev)
          # -----
          # Copyright (c) 2023 Leopold Meinel & contributors
          # SPDX ID: GPL-3.0-or-later
          # URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
          # -----
          ###
          CURRENT=$(/usr/bin/pactl get-sink-volume @DEFAULT_SINK@ | /usr/bin/grep -e '%' | /usr/bin/sed 's/ //g' | /usr/bin/cut -d "/" -f 2 | /usr/bin/sed 's/%//')

          up() {
              new="$(($CURRENT + 5))"
              if [ $new -lt 100 ]; then
                  /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ $new%
              else
                  /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ 100%
              fi
          }

          down() {
              new="$(($CURRENT - 5))"
              if [ $new -gt 0 ]; then
                  /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ $new%
              else
                  /usr/bin/pactl set-sink-volume @DEFAULT_SINK@ 0%
              fi
          }

          if [[ "$1" == "--up" ]]; then
              up
          elif [[ "$1" == "--down" ]]; then
              down
          fi
        '';
      };
      "sway/config" = {
        text = ''
          # User configs
          include ${config.xdg.configHome}/sway/config.d/*
          include /etc/sway/config.d/*

          # Enable this if every app is compatible with wayland
          xwayland enable
        '';
      };
      # swaylock
      "swaylock/config" = {
        text = ''
          daemonize
          ignore-empty-password

          font=Hasklig
          font-size=36

          clock
          timestr=%R
          datestr=%a, %e of %B

          fade-in=0.2

          effect-blur=20x2
          effect-scale=0.3

          indicator
          indicator-radius=240
          indicator-thickness=20
          indicator-caps-lock

          key-hl-color=880033

          separator-color=00000000

          inside-color=00000099
          inside-clear-color=ffd20400
          inside-caps-lock-color=009ddc00
          inside-ver-color=d9d8d800
          inside-wrong-color=ee2e2400

          ring-color=231f20D9
          ring-clear-color=231f20D9
          ring-caps-lock-color=231f20D9
          ring-ver-color=231f20D9
          ring-wrong-color=231f20D9

          line-color=00000000
          line-clear-color=ffd204FF
          line-caps-lock-color=009ddcFF
          line-ver-color=d9d8d8FF
          line-wrong-color=ee2e24FF

          text-clear-color=ffd20400
          text-ver-color=d9d8d800
          text-wrong-color=ee2e2400

          bs-hl-color=ee2e24FF
          caps-lock-key-hl-color=ffd204FF
          caps-lock-bs-hl-color=ee2e24FF
          disable-caps-lock-text
          text-caps-lock-color=009ddc
        '';
      };
      # swaync
      "swaync/config.json" = {
        text = ''
          {
            "$schema": "/etc/xdg/swaync/configSchema.json",

            "positionX": "right",
            "positionY": "top",
            "control-center-positionX": "none",
            "control-center-positionY": "top",
            "control-center-margin-top": 8,
            "control-center-margin-bottom": 8,
            "control-center-margin-right": 8,
            "control-center-margin-left": 8,
            "control-center-width": 500,
            "control-center-height": 600,
            "fit-to-screen": false,

            "layer": "overlay",
            "cssPriority": "user",
            "notification-icon-size": 64,
            "notification-body-image-height": 100,
            "notification-body-image-width": 200,
            "timeout": 10,
            "timeout-low": 5,
            "timeout-critical": 0,
            "notification-window-width": 500,
            "keyboard-shortcuts": true,
            "image-visibility": "when-available",
            "transition-time": 200,
            "hide-on-clear": true,
            "hide-on-action": true,
            "script-fail-notify": true,

            "widgets": ["inhibitors", "title", "dnd", "mpris", "notifications"],
            "widget-config": {
              "inhibitors": {
                "text": "Inhibitors",
                "button-text": "Clear All",
                "clear-all-button": true
              },
              "title": {
                "text": "Notifications",
                "clear-all-button": true,
                "button-text": "Clear All"
              },
              "dnd": {
                "text": "Do Not Disturb"
              },
              "label": {
                "max-lines": 5,
                "text": "Label Text"
              },
              "mpris": {
                "image-size": 96,
                "image-radius": 12
              }
            }
          }
        '';
      };
      "swaync/style.css" = {
        text = ''
          /*
           * vim: ft=less
           */

          @define-color white-15 rgba(235, 219, 178, 0.15);
          @define-color white-10 rgba(235, 219, 178, 0.1);
          @define-color dark-80 rgba(29, 32, 33, 0.8);
          @define-color dark2-80 rgba(40, 44, 46, 0.8);
          @define-color dark3-80 rgba(51, 55, 58, 0.8);
          @define-color secondary rgb(104, 157, 106);

          .notification-row {
            transition: all 200ms ease;
            outline: none;
            margin-bottom: 4px;
            border-radius: 12px;
          }

          .control-center .notification-row:focus,
          .control-center .notification-row:hover {
            opacity: 1;
            background: transparent;
          }

          .notification-row:focus .notification,
          .notification-row:hover .notification {
            box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.5);
            box-shadow: 0px 0px 0px 3px @secondary;
          }

          .control-center .notification {
            box-shadow: none;
          }

          .control-center .notification-row {
            opacity: 0.5;
          }

          .notification {
            transition: all 200ms ease;
            border-radius: 12px;
            margin: 6px 6px;
            box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.5);
            padding: 0;
          }

          .notification-content {
            background: transparent;
            padding: 6px;
            border-radius: 12px;
          }

          .close-button {
            background: @white-10;
            color: white;
            text-shadow: none;
            padding: 0;
            border-radius: 100%;
            margin-top: 10px;
            margin-right: 10px;
            box-shadow: none;
            border: none;
            min-width: 24px;
            min-height: 24px;
          }

          .close-button:hover {
            box-shadow: none;
            background: @white-15;
            transition: all 0.15s ease-in-out;
            border: none;
          }

          .notification-default-action,
          .notification-action {
            padding: 4px;
            margin: 0;
            box-shadow: none;
            background: @dark2-80;
            border: 1px solid @white-15;
            color: white;
            transition: all 200ms ease;
          }

          .notification-default-action:hover,
          .notification-action:hover {
            -gtk-icon-effect: none;
            background: @dark3-80;
          }

          .notification-default-action {
            border-radius: 12px;
          }

          /* When alternative actions are visible */
          .notification-default-action:not(:only-child) {
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
          }

          .notification-action {
            border-radius: 0px;
            border-top: none;
            border-right: none;
          }

          /* add bottom border radius to eliminate clipping */
          .notification-action:first-child {
            border-bottom-left-radius: 10px;
          }

          .notification-action:last-child {
            border-bottom-right-radius: 10px;
            border-right: 1px solid @white-15;
          }

          .image {
          }

          .body-image {
            margin-top: 6px;
            background-color: white;
            border-radius: 12px;
          }

          .summary {
            font-size: 16px;
            font-weight: bold;
            background: transparent;
            color: white;
            text-shadow: none;
          }

          .time {
            font-size: 16px;
            font-weight: bold;
            background: transparent;
            color: white;
            text-shadow: none;
            margin-right: 18px;
          }

          .body {
            font-size: 15px;
            font-weight: normal;
            background: transparent;
            color: white;
            text-shadow: none;
          }

          .control-center {
            background: @dark-80;
            border-radius: 12px;
            background-clip: border-box;
            padding: 4px;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 3px 1px rgba(0, 0, 0, 0.7),
              0 2px 6px 2px rgba(0, 0, 0, 0.3);
          }

          .control-center-list {
            background: transparent;
          }

          .control-center-list-placeholder {
            opacity: 0.5;
          }

          .floating-notifications {
            background: transparent;
          }

          /* Window behind control center and on all other monitors */
          .blank-window {
            background: transparent;
          }

          /*** Widgets ***/

          /* Title widget */
          .widget-title {
            margin: 8px;
            font-size: 1.5rem;
          }
          .widget-title > button {
            font-size: initial;
            color: white;
            text-shadow: none;
            background: @dark2-80;
            border: 1px solid @white-15;
            box-shadow: none;
            border-radius: 12px;
          }
          .widget-title > button:hover {
            background: @dark3-80;
          }

          .widget-dnd {
            margin: 8px;
            font-size: 1.1rem;
          }
          .widget-dnd > switch {
            font-size: initial;
            border-radius: 12px;
            background: @dark2-80;
            border: 1px solid @white-15;
            box-shadow: none;
          }
          .widget-dnd > switch:checked {
            background: @secondary;
          }
          .widget-dnd > switch slider {
            background: @dark3-80;
            border-radius: 12px;
          }

          .widget-label {
            margin: 8px;
          }
          .widget-label > label {
            font-size: 1.1rem;
          }

          .widget-mpris {
          }
          .widget-mpris-player {
            padding: 8px;
            margin: 8px;
            background-color: @dark2-80;
            border-radius: 12px;
          }
          .widget-mpris-title {
            font-weight: bold;
            font-size: 1.25rem;
          }
          .widget-mpris-subtitle {
            font-size: 1.1rem;
          }

          .widget-buttons-grid {
            padding: 8px;
            margin: 8px;
            border-radius: 12px;
            background-color: @dark2-80;
          }

          .widget-buttons-grid > flowbox > flowboxchild > button {
            background: @dark2-80;
            border-radius: 12px;
          }

          .widget-buttons-grid > flowbox > flowboxchild > button:hover {
            background: @dark3-80;
          }

          .widget-menubar > box > .menu-button-bar > button {
            border: none;
            background: transparent;
          }

          .topbar-buttons > button {
            border: none;
            background: transparent;
          }

          .widget-volume {
            background-color: @dark2-80;
            padding: 8px;
            margin: 8px;
            border-radius: 12px;
          }

          .widget-backlight {
            background-color: @dark2-80;
            padding: 8px;
            margin: 8px;
            border-radius: 12px;
          }

          .widget-inhibitors {
            margin: 8px;
            font-size: 1.5rem;
          }
          .widget-inhibitors > button {
            font-size: initial;
            color: white;
            text-shadow: none;
            background: @dark2-80;
            border: 1px solid @white-15;
            box-shadow: none;
            border-radius: 12px;
          }
          .widget-inhibitors > button:hover {
            background: @dark3-80;
          }
        '';
      };
      # waybar
      "waybar/config" = {
        text = ''
          {
            "layer": "top",
            "position": "top",
            "height": 8,
            "modules-left": [
              "sway/workspaces"
            ],
            "modules-center": [],
            "modules-right": [
              "idle_inhibitor",
              "tray",
              "pulseaudio",
              "backlight",
              "battery",
              "clock",
              "custom/notification"
            ],
            "sway/workspaces": {
              "disable-scroll": true,
              "all-outputs": true,
              "format": "{name}"
            },
            "idle_inhibitor": {
              "format": "{icon}",
              "format-icons": {
                "activated": "🏀",
                "deactivated": "🍪"
              }
            },
            "pulseaudio": {
              "format": "{icon}",
              "format-muted": "🔈️",
              "format-icons": {
                "default": [
                  "🔈️",
                  "🔉",
                  "🔊"
                ]
              },
              "on-click": "/usr/bin/pavucontrol"
            },
            "backlight": {
              "format": "{percent}% {icon}",
              "format-icons": [
                "",
                ""
              ]
            },
            "battery": {
              "states": {
                "good": 95,
                "warning": 30,
                "critical": 15
              },
              "format": "{capacity}% {icon}",
              "format-charging": "{capacity}% ",
              "format-plugged": "{capacity}% ",
              "format-full": "",
              "format-icons": [
                "",
                "",
                "",
                "",
                ""
              ]
            },
            "tray": {
              "icon-size": 12,
              "spacing": 12
            },
            "clock": {
              "format": "{:%Y-%m-%d - %H:%M}"
            },
            "custom/notification": {
              "tooltip": false,
              "format": "{icon}",
              "format-icons": {
                "notification": "<span foreground='red'><sup></sup></span>",
                "none": "",
                "dnd-notification": "<span foreground='red'><sup></sup></span>",
                "dnd-none": "",
                "inhibited-notification": "<span foreground='red'><sup></sup></span>",
                "inhibited-none": "",
                "dnd-inhibited-notification": "<span foreground='red'><sup></sup></span>",
                "dnd-inhibited-none": ""
              },
              "return-type": "json",
              "exec-if": "which swaync-client",
              "exec": "/usr/bin/swaync-client -swb",
              "on-click": "/usr/bin/swaync-client -t -sw",
              "on-click-right": "/usr/bin/swaync-client -d -sw",
              "escape": true
            }
          }
        '';
      };
      "waybar/style.css" = {
        text = ''
          @define-color white #ebdbb2;
          @define-color dark #1d2021;
          @define-color primary #fd472f;
          @define-color secondary #689d6a;
          @define-color hint #fabd2f;

          * {
            border: none;
            border-radius: 0px;
            font-family: "Hasklig";
            font-size: 12px;
            min-height: 0;
            color: @white;
          }

          window#waybar {
            background: @dark;
          }

          #clock,
          #workspaces {
            font-weight: 800;
          }

          #tray * {
            color: @dark;
          }

          #workspaces button label {
            color: @secondary;
          }
          #workspaces button.focused label {
            color: @dark;
          }
          #workspaces button.focused {
            background: @secondary;
          }

          #clock {
            font-family: "Nerd Font Symbols Mono";
            color: @hint;
          }

          #pulseaudio.muted {
            color: @primary;
          }

          #backlight,
          #battery,
          #clock,
          #custom-notification,
          #idle_inhibitor,
          #pulseaudio,
          #tray {
            padding: 0 8px;
            margin: 0;
          }

          #backlight,
          #battery,
          #custom-notification,
          #idle_inhibitor,
          #pulseaudio,
          #tray {
            font-family: "Font Awesome 6 Free";
          }
        '';
      };
      # wofi
      "wofi/config" = {
        text = ''
          mode=drun
        '';
      };
      "wofi/style.css" = {
        text = ''
          @define-color white #ebdbb2;
          @define-color dark #1d2021;
          @define-color dark2 #282c2e;
          @define-color secondary #689d6a;

          * {
            border-radius: 3px;
            border: none;
            font-family: "Hasklig";
            font-size: 20px;
          }

          window {
            background-color: @dark;
            color: white;
          }

          #input {
            background-color: @dark2;
            color: @dark;
          }

          #entry:selected {
            background-color: @secondary;
          }
        '';
      };
      # xfce4
      "xfce4/xfconf/xfce-perchannel-xml" = {
        text = ''
          <?xml version="1.0" encoding="UTF-8"?>

          <channel name="thunar" version="1.0">
              <property name="misc-middle-click-in-tab" type="bool" value="true" />
              <property name="last-restore-tabs" type="bool" value="true" />
              <property name="misc-show-delete-action" type="bool" value="true" />
          </channel>
        '';
      };
      # Thunar
      "Thunar/uca.xml" = {
        text = ''
          <?xml version="1.0" encoding="UTF-8"?>
          <actions>
              <action>
                  <icon>utilities-terminal</icon>
                  <name>Open Terminal Here</name>
                  <submenu></submenu>
                  <unique-id>1682361916909654-1</unique-id>
                  <command>&quot;$TERMINAL&quot; --working-directory %F</command>
                  <description></description>
                  <range></range>
                  <patterns>*</patterns>
                  <startup-notify />
                  <directories />
              </action>
          </actions>
        '';
      };
    };
    dataFile = {
      # gnupg
      ".local/share/gnupg/gpg-agent.conf" = {
        text = ''
          pinentry-program /usr/bin/pinentry-gnome3
        '';
      };
    };
  };
}
