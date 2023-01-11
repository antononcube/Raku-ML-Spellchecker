#!/usr/bin/env raku
use v6.d;

use lib '.';
use lib './lib';

use ML::Spellchecker;
use ML::Spellchecker::Simple;

my $word = "krama";
say word-candidates($word);
say word-correction($word);

my $sentence = "what is the most beutiful butterfli";
say word-correction($sentence.words);
say word-candidates(<beutiful buterfly>):p;

say word-candidates(<crise aggain>):p;
