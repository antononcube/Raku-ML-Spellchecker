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

## References

[DT1] ducktape,
["spellchecker-p6"](https://gitlab.com/ducktape/spellchecker-p6),
(2018),
[GitLab/ducktape](https://gitlab.com/ducktape).

[PN1] Peter Norvig,
["How to Write a Spelling Corrector"](http://norvig.com/spell-correct.html),
(2007),
[norvig.com](http://norvig.com).