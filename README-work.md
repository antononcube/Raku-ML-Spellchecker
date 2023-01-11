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

Here we get the possible candidates:

```perl6
word-candidates('krama');
```

Here we get the possible candidates for multiple words:

```perl6
say word-candidates(<crise beutiful buterfly>):p;
```


------

## Command Line Interface (CLI)

The package provides the CLI script `ml-spellchecker`:

```shell
ml-spellchecker --help
```

Here we spellcheck a word:

```shell
ml-spellchecker krama
```

Here we spellcheck a sentence:

```shell
ml-spellchecker "krama aggain ard aggain"
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