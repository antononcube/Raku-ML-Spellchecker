# Raku-ML-Spellchecker

## Introduction

This Raku package is for simple and contextual spellchecking.

The method "simple" re-uses code from [DT1] (which itself is based on [PT1].) 

------

## Installation

To install from GitHub:

```
zef install https://github.com/antononcube/Raku-ML-Spellchecker.git
```

To install from the zef ecosystem:

```
zef install ML::Spellchecker
```

------

## Usage examples

Here we spellcheck a word:

```perl6
use ML::Spellchecker;

word-correction('krama');
```
```
# drama
```

Here we get the possible candidates:

```perl6
word-candidates('krama');
```
```
# (drama kramm)
```

Here we get the possible candidates for multiple words:

```perl6
say word-candidates(<crise beutiful buterfly>):p;
```
```
# (crise => (rise arise frise crile crime crisp cruise) beutiful => (beautiful) buterfly => (butterfly))
```


------

## Command Line Interface (CLI)

The package provides the CLI script `ml-spellchecker`:

```shell
ml-spellchecker --help
```
```
# Usage:
#   ml-spellchecker <text> [--splitter=<Str>] [--method=<Str>] [-p|--pairs] [--format=<Str>] -- Spellchecks words in text.
#   ml-spellchecker [<words> ...] [--method=<Str>] [-p|--pairs] [--format=<Str>] -- Spellchecks words.
#   ml-spellchecker [--method=<Str>] [-p|--pairs] [--format=<Str>] -- Spellchecks words in (pipeline) input.
#   
#     <text>              Text to spilt and its words stemmed.
#     --splitter=<Str>    String to make a split regex with. [default: '\W+']
#     --method=<Str>      Which method to use. [default: 'simple']
#     -p|--pairs          Should pairs be returned or not? [default: False]
#     --format=<Str>      Output format one of 'text', 'lines', or 'raku'. [default: 'text']
#     [<words> ...]       Words to be stemmed.
```

Here we spellcheck a word:

```shell
ml-spellchecker krama
```
```
# drama
```

Here we spellcheck a sentence:

```shell
ml-spellchecker "krama aggain ard aggain"
```
```
# drama again and again
```

------

## Design

I want(ed) to (re-)implement a spellchecker that produces suggestions of misspelled words taking into account the surrounding words.

Basically, I use the tries-with-frequencies data structure to find most probably completions. 
For example, "cooking ice in the kitchen" should get a correction suggestion for "cooking rice in the kitchen", 
although none of the words in the former phrase are misspelled.

See the article 
["Using Tries for Markov chain text generation"](https://rakuforprediction.wordpress.com/2023/01/29/using-tries-for-markov-chain-text-generation/), [AA1],
for n-gram-based predictions utilization for generating text. In this package instead of generating text we censure text. 

------

## References

### Articles

[AA1] Anton Antonov,
["Using Tries for Markov chain text generation"](https://rakuforprediction.wordpress.com/2023/01/29/using-tries-for-markov-chain-text-generation/),
(2023),
[RakuForPrediction at WordsPress](https://rakuforprediction.wordpress.com).

[PN1] Peter Norvig,
["How to Write a Spelling Corrector"](http://norvig.com/spell-correct.html),
(2007),
[norvig.com](http://norvig.com).

### Packages

[AAp1] Anton Antonov,
[ML::TriesWithFrequencies Raku package](https://raku.land/zef:antononcube/ML::TriesWithFrequencies),
(2021-2023),
[raku.land/zef:antononcube](https://raku.land/zef:antononcube).

[DT1] ducktape,
["spellchecker-p6"](https://gitlab.com/ducktape/spellchecker-p6),
(2018),
[GitLab/ducktape](https://gitlab.com/ducktape).

