#!/usr/bin/env gawk -f

# gawk -v char_index="${char_pos}"
function throw_error(msg) {
    printf("ERROR: %s\n", msg) > "/dev/stderr";
    exit length(msg) + 1
}
function buf_append_char(chrval) {
    if (length(chrval) > 1) {
        throw_error(sprintf("length(chrval) > 1"));
    }
    chars[char_count++]=chrval;
    # if (chrval ==  "\\") {
    #     if ((length(chars) > 0) && (chars[char_count-1] != "\\")) {
    #         next_char_shall_backslash=1;
    #     }
    # } else if (next_char_shall_backslash) {
    #     buf=sprintf("%s%s", buf, "\\");
    #     next_char_shall_backslash=0;
    #     printf("<next_char_shall_backslash>\n%s\n</next_char_shall_backslash>\n", buf) > "/dev/stderr"
    # }

    buf=sprintf("%s%s", buf, char)
}
function format_key(key, array_name)
{
    key_ty = typeof(key)
    if (key_ty == "string" && typeof(array_name) == "string" && length(array_name) > 0) {
        return sprintf("%s[\"%s\"]", array_name, key)
    } else {
        return sprintf("%s", key)
    }
}

function format_value(value)
{
    value_ty = typeof(value)
    if (value_ty == "string") {
        return sprintf("\"%s\"", value)
    } else {
        return sprintf("%s", value)
    }
}

function gen_indent(depth,  space_str)
{
    if (!space_str) {
        space_str="    "
    }
    if (! depth) {
        depth = 0
    }
    indent = ""
    if (depth <= 0) {
        return indent
    }
    for (indent_idx = 0; indent_idx < depth; indent_idx++) {
        indent = sprintf("%s%s", indent, space_str)
    }
    return indent
}

function print_value(key, value, depth, array_name)
{
    if (! depth) {
        depth = 0
    }
    indent = gen_indent(depth)
    value_ty = typeof(value)
    key_display = format_key(key, array_name);
    if (value_ty == "array") {
        printf("%s%s # %s\n", gen_indent(depth - 1), key_display, value_ty);
        for (idx in value) {
            key_display = format_key(key, array_name);
            print_value(idx, value[idx], depth + 1, format_key(idx, key_display))
        }
    } else {
        printf("%s%s=%s # %s\n", indent, key_display, format_value(value), value_ty);
    }
}

function print_procinfo()
{
    for (key in PROCINFO) {
        print_value(key, PROCINFO[key], 0, "PROCINFO")
    }
}


function print_char_identifiers() {
    print("") > "/dev/stderr"
    for (key in PROCINFO["identifiers"]) {
        if ( key ~ /^char_/ && typeof(PROCINFO["identifiers"][key]) != "array") {
            if (key ~ /^char_index/)  {
                continue
            }
            printf("\x1b[0m\x1b[1;38;5;231m%s\x1b[0m = \x1b[1;38;5;154m%s\x1b[0m\n", key, SYMTAB[key]) > "/dev/stderr"
        }
    }
    print("") > "/dev/stderr"
}
function assert_thing_value_type(thing, name, value, exp_type) {
    ty = typeof(value);
    if (ty != exp_type) {
        throw_error(sprintf("wrong of %s %s: should be %s but is %s", thing, name, exp_type, ty));
    }
}
function assert_var_type(name, value, exp_type) {
    assert_thing_value_type("variable", name, value, exp_type)
}
function assert_arg_type(name, value, exp_type) {
    assert_thing_value_type("argument", name, value, exp_type)
}

function require_var_argv(name, value, var_type) {
    value_raw = value;
    if (!value || length(value) == 0) {
        throw_error(sprintf("missing param -v %s=%s\n", name, var_type));
    }

    if (var_type == "number") {
        value_number = strtonum(value);
        if ( value != value_number ) {
            throw_error(sprintf("invalid param -v %s=\"%s\" is not a %s but a %s\n", name, value, var_type, typeof(value)));
        } else {
            return value_number
        }
    }
    return value
}
function parse_sed_error(sed_stderr) {
    assert_arg_type("sed_stderr", sed_stderr, "string");

    expression_index=strtonum(get_sed_error_regex_match_subexpr(sed_stderr, 1));
    char_index=strtonum(get_sed_error_regex_match_subexpr(sed_stderr, 2));
    error_info["sed_command"]=sed_command
    error_info["expression_index"]=expression_index
    error_info["char_index"]=char_index;
    error_info["error_description"]=get_sed_error_regex_match_subexpr(sed_stderr, 3);
    print_value("error_info", error_info, 0)
}
function get_sed_error_regex_match_subexpr(haystack, subexpr) {
    assert_arg_type("haystack", haystack, "string");
    assert_arg_type("subexpr", subexpr, "number");
    return gensub(/^sed:\s*[-]e\s*expression\s*[#]([0-9]+),\s*char\s*([0-9]+):\s*(.*)$/, sprintf("\\%s", subexpr), "g", haystack);
}
BEGIN {
    PROCINFO["sorted_in"] = "@ind_str_asc"

    delete error_info
    delete chars;
    delete lines;
    line_count=0;
    buf_count=0;
    next_buf_shall_backslash=0;
}

{
    line=$0; # current line
    len=length(line);
    lines[line_count++]=line;
}
function populate_buf(){
    # if (length(chars) > 0) {
    #     return # already populated
    # }
    for (line_idx=0;line_idx<line_count;line_idx++) {
        line=lines[line_idx]; # current line
        len=length(line);

        char="";
        for (i=1;i<=len;i++) {
            char=substr(line, i, 1);
            buf_append_char(char);
        }

        if ((line_idx+1) < line_count) {
            buf_append_char("\n");
        }
    }
}

END {
    # print_procinfo();
    # exit
    populate_buf()

    parse_sed_error(buf)
# function assert_thing_value_type(thing, name, value, exp_type) {

    sed_command=require_var_argv("sed_command", sed_command, "string");
    sed_command_start=0;
    sed_command_count=length(sed_command)

    expression_number=assert_thing_value_type("error_info array key", "expression_index", error_info["expression_index"], "number");
    char_index=assert_thing_value_type("error_info array key", "char_index", error_info["char_index"], "number");
    error_description=assert_thing_value_type("error_info array key", "error_description", error_info["error_description"], "string");

    sed_command_highlight_end=char_index;
    sed_command_highlight_start=sed_command_highlight_end-1;

    if (sed_command_count==0) {
        throw_error("sed_command_count is zero");
    }
    if (sed_command_highlight_start > sed_command_count) {
        throw_error(sprintf("sed_command_highlight_start (%d) is greater than sed_command_count (%d)", sed_command_highlight_start, sed_command_count));
    }

    sed_command_highlight_start=sed_command_highlight_start;
    sed_command_highlight_end=(sed_command_highlight_start+1);
    sed_command_end=(sed_command_count-1);
    print_idx=0;


    # print_buf_identifiers();
    # exit 0

    # printf("<buffer>\n%s\n</buffer>\n\n", buf);
    start=""
    end=""
    if (sed_command_highlight_start > sed_command_start) {
        start =substr(sed_command, 0, sed_command_highlight_start-1);
    }
    to_highlight=substr(sed_command, sed_command_highlight_start, 1)
    if (sed_command_highlight_end < sed_command_count) {
        end=substr(sed_command, sed_command_highlight_end);
    }

    if (length(start) > 0) {
        printf("\x1b[0m\x1b[1;38;5;237m%s\x1b[0m", start);
    }
    printf("\x1b[1;38;5;220m%s\x1b[0m", to_highlight);
    if (length(end) > 0) {
        printf("\x1b[0m\x1b[1;38;5;237m%s\x1b[0m", end);
    }
    printf("\n")

    error_description_length = length(error_description)
    indicator_length = error_description_length + 2
    if (length(start) > error_description_length) {
        padding_left=gen_indent(error_description_length - length(start), " ")
        printf("%s%s↑", padding_left,error_description)
    } else {
        padding_left=gen_indent(length(start), " ")
        printf("%s↑ %s", padding_left,error_description)
    }
    printf("\n")
}
