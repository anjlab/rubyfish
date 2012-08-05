RubyFish
=========

RubyFish is a ruby port of python library <a href = "http://github.com/sunlightlabs/jellyfish">jellyfish</a> for doing approximate and phonetic matching of strings.

-------------

RubyFish is a project of AnjLab (c) 2010.
All code is released under a BSD-style license, see LICENSE for details.

Originally written by
Written by <a href="mailto:mstephens@sunlightfoundation.com">Michael Stephens</a> and <a href="mailto:jturk@sunlightfoundation.com">James Turk</a>.

Ported by <a href="mailto:yury.korolev@gmail.com">Yury Korolev</a>
Source is available on <a href="http://github.com/anjlab/rubyfish">GitHub</a>

Included Algorithms
-------------------

String comparison:

  * Levenshtein Distance
  * Damerau-Levenshtein Distance
  * Jaro Distance
  * Jaro-Winkler Distance
  * Hamming Distance
  * Longest Substring
  * Longest Subsequence

Phonetic encoding:  
  
  * Double Metaphone

Example Usage
-------------

    ruby-1.9.2-p0 > require 'rubyfish'
    ruby-1.9.2-p0 > RubyFish::Levenshtein.distance("jellyfish", "rubyfish")
    => 4
    ruby-1.9.2-p0 > RubyFish::Jaro.distance("jellyfish", "rubyfish")
    => 0.7268518518518519
    ruby-1.9.2-p0 > RubyFish::DamerauLevenshtein.distance("rubyfish", "rubyfihs")
    => 1
    
    ruby-1.9.2-p0 > RubyFish::DoubleMetaphone.phonetic_code "prived"
     => ["PRFT", nil] 
    ruby-1.9.2-p0 > RubyFish::DoubleMetaphone.phonetic_code "privet"
     => ["PRFT", nil]