use v6.d;

unit module ML::Spellchecker::Simple;

# Taken from : https://gitlab.com/ducktape/spellchecker-p6 .
# - Minor comment edits.
# - Definition reordering edit in order to run in Emacs.

# See also Peter Norvig's "How to Write a Spelling Corrector", http://norvig.com/spell-correct.html .

my %WORDS = %?RESOURCES<big.txt>.IO.slurp.lc.comb(/\w+/).Bag;

#| The subset of `words` that appear in the Bag of WORDS
sub known(@words) {
    @words.grep({ $_ ~~ Str && (%WORDS{$_}:exists) }).unique
}

#| All edits that are one edit from `word`
sub edits1(Str $word) {
    my @letters = 'a'..'z';
    my @splits = (|($word.substr(0..$_-1), $word.substr($_)) for 0..$word.chars);
    my @deletes = do for @splits -> $L, $R { if $R {$L ~ $R.substr(1)} };
    my @transposes = do for @splits -> $L, $R { if $R.chars > 1 {$L ~ $R.substr(1,1) ~ $R.substr(0,0) ~ $R.substr(2)}}
    my @replaces = do for @splits -> $L, $R {@letters.map: {$L~$_~$R.substr(1)} if $R}
    my @inserts = do for @splits -> $L, $R {@letters.map: {$L ~ $_ ~ $R}}
    return (gather (@deletes, @transposes, @replaces, @inserts).deepmap: *.take).unique;
}

#| All edits that are two edits from `word`
sub edits2(Str $word) {
    return ( for edits1($word) -> $e1 { $_ for edits1($e1) } )
}

#| Probability of `word`
sub P(Str $word, Int $N=%WORDS.values.sum) {
    %WORDS{$word} / $N;
}

#| Generate possible spelling corrections for word
our sub WordCandidates(Str $word) is export {
    known(($word,)) || known(edits1($word)) || known(edits2($word)) || ($word,);
}

#| Most probable spelling correction for word
our sub WordCorrection(Str $word) is export {
    WordCandidates($word).max({P($_)});
}
