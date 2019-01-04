#!/usr/bin/env perl

# Convert all DB object names to lowercase.
while (<>) {
    do {} while s{
        (?:
            (?&start)
            (?&text)
            (?: (?&object_name) (?&text) )*?   # Any number of names, non-greedy
            (?&backtick)                       # Start of an uppercase name
            \K                                 # Everything up to here is look-behind
            ( (?&uppercase_text) )             # The name itself
            (?=(?&backtick))                   # Lookahead for backtick as next character
        )
        (?(DEFINE)
            (?<start>          ^                                                        )
            (?<text>           [^`]*                                                    )
            (?<uppercase_text> (?: [^`]* [[:upper:]] [^`]* )                            )
            (?<backtick>       `                                                        )
            (?<object_name>    (?: (?&backtick) (?&text) (?&backtick) )                 )
        )
    }{\L$1}xmsg;
    print;
}
