=========
jellyfish
=========

RubyFish is a ruby port of python library jellyfish (http://github.com/sunlightlabs/jellyfish) for doing approximate and phonetic matching of strings.

RubyFish is a project of AnjLab (c) 2010.
All code is released under a BSD-style license, see LICENSE for details.

Originally written by
Written by Michael Stephens <mstephens@sunlightfoundation.com> and James Turk
<jturk@sunlightfoundation.com>.

Ported by Yury Korolev <yury.korolev@gmail.com>
Source is available at http://github.com/anjlab/rubyfish

Included Algorithms
===================

String comparison:

  * Levenshtein Distance
  * Damerau-Levenshtein Distance
  * Jaro Distance
  * Jaro-Winkler Distance
  * Hamming Distance
  * Longest Substring
  * Longest Subsequence

Example Usage
=============

    ruby-1.9.2-p0 > require 'rubyfish'
    ruby-1.9.2-p0 > RubyFish::Levenshtein.distance("jellyfish", "rubyfish")
    => 4
    ruby-1.9.2-p0 > RubyFish::Jaro.distance("jellyfish", "rubyfish")
    => 0.7268518518518519
    ruby-1.9.2-p0 > RubyFish::DamerauLevenshtein.distance("rubyfish", "rubyfihs")
    => 1