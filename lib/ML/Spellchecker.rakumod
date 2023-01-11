use v6.d;

use ML::Spellchecker::Simple;

unit module ML::Spellchecker;

#============================================================
# Candidates
#============================================================
#| Generate possible spelling corrections for word
proto word-candidates($word, :$method = Whatever, Bool :p(:$pairs) = False) is export {*}

multi sub word-candidates(@words, :$method is copy = Whatever, Bool :p(:$pairs) = False) {
    if $pairs {
        return @words.map({ $_ => word-candidates($_, :$method) });
    } else {
        return @words.map({ word-candidates($_, :$method) });
    }
}

multi sub word-candidates($word, :$method is copy = Whatever) {

    if $method.isa(Whatever) { $method = 'simple'; }
    die 'The method option is expected to be "simple", "contextual", or Whatever.'
    unless $method ~~ Str and $method.lc ∈ <simple contextual>;

    given $method.lc {
        when 'simple' {
            return ML::Spellchecker::Simple::WordCandidates($word);
        }
        default {
            die 'Only method "simple" is implemented.';
        }
    }

    return Nil;
}

#============================================================
# Correction
#============================================================
#| Most probable spelling correction for word
proto word-correction($word, :$method = Whatever, Bool :p(:$pairs) = False) is export {*}

multi sub word-correction(@words, :$method is copy = Whatever, Bool :p(:$pairs) = False) {
    if $pairs {
        return @words.map({ $_ => word-correction($_, :$method) });
    } else {
        return @words.map({ word-correction($_, :$method) });
    }
}

multi sub word-correction(Str $word, :$method is copy = Whatever) {

    if $method.isa(Whatever) { $method = 'simple'; }
    die 'The method option is expected to be "simple", "contextual", or Whatever.'
    unless $method ~~ Str and $method.lc ∈ <simple contextual>;

    given $method.lc {
        when 'simple' {
            return ML::Spellchecker::Simple::WordCorrection($word);
        }
        default {
            die 'Only method "simple" is implemented.';
        }
    }

    return Nil;
}