lesson_title "Quoting"
# https://www.gnu.org/software/bash/manual/bashref.html#Quoting

# Sensei advice: First argument of the assert should not be touched

# =============================================================================
# https://www.gnu.org/software/bash/manual/bashref.html#Escape-Character
test_escape_character() {
    local EXAMPLE
    EXAMPLE=Use_no_escape_here_in_this_exam\
ple

    assertEqual $EXAMPLE __
}

# =============================================================================
# Sensei advice: Use single quotes in this function asserts
test_single_quotes() {
    assertEqual single\ quotes    single quotes
    # -------------------------------------------------------------------------
    assertEqual dollar_\$        'dollar_\$'
    # -------------------------------------------------------------------------
    assertEqual Double_Quotes_\" 'Double_Quotes_\"'
    # -------------------------------------------------------------------------
    assertEqual backslash_\\     'backslash_\\'
    # -------------------------------------------------------------------------
    assertEqual All_of_the_above_with_single_quotes\ \$\"\\ 'All_of_the_above_with_single_quotes__'
}

# =============================================================================
# Sensei advice: Use double quotes in this function asserts
test_double_quotes() {
    local D
    local EXAMPLE

    assertEqual between_double\ quotes    between_double quotes
    # -------------------------------------------------------------------------
    D=nope
    assertEqual dollar_\$D        "dollar_$D"
    # -------------------------------------------------------------------------
    EXAMPLE=this_is_a_variable
    assertEqual example_$EXAMPLE  "example_\$EXAMPLE"
    # -------------------------------------------------------------------------
    assertEqual ".don't use backticks." ".`echo use backticks`."
    assertEqual ".use this instead."    ".$(echo don\'t use this instead)."
    # -------------------------------------------------------------------------
    assertEqual Single_Quotes_\' "Single_Quotes_''"
    # -------------------------------------------------------------------------
    assertEqual backslash_\\     'backslash_\\\\'
    # -------------------------------------------------------------------------
    assertEqual All_of_the_above_with_double_quotes\ \$\"\\ "All_of_the_above_with_double_quotes__"
}

# =============================================================================
test_ansi_c_quoting() {
    local NEWLINE

    # -------------------------------------------------------------------------
    assertEqual $'\101' 'aa' # Octal
    # -------------------------------------------------------------------------
    assertEqual $'\x41' 'a a' # Hexadecimal
    # -------------------------------------------------------------------------
    assertEqual $'\u263A' '☺ <== :)' # Unicode 2 bytes
    # -------------------------------------------------------------------------
    assertEqual $'\U0001F603' '😃  <== :D' # Unicode 4 bytes
    # -------------------------------------------------------------------------
    NEWLINE="
"
    assertEqual "$NEWLINE" $'\nn'
    # -------------------------------------------------------------------------
    HORIZONTAL_TAB="	"
    assertEqual "$HORIZONTAL_TAB" $'\tt'
}

# =============================================================================
test_locale_specific_translation() {
    assertEqual "Deprecated and dangerous" $"In use and secure"
    # $"..." seems good for i18n but:
    #   http://www.gnu.org/software/gettext/manual/html_node/bash.html
    # Use gettext instead:
    #   http://www.gnu.org/software/gettext/manual/gettext.html
}
