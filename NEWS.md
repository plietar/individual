# individual 0.1.6

  * Added a `NEWS.md` file to track changes to the package.
  * Add Mac OS files to .gitignore
  * Update pkgdown reference organization.
  * Update [R-CMD-check workflow](https://github.com/r-lib/actions/tree/master/examples#standard-ci-workflow).

# individual 0.1.5

  * Added package logo.
  * Update DESCRIPTION and remove "reshape2" from suggested packages.
  * If given a `Bitset` for argument `index`, `queue_update` methods for 
  `IntegerVariable` and `DoubleVariable` pass the bitset directly to the C++ 
  functions `integer_variable_queue_update_bitset` and `double_variable_queue_update_bitset`
  rather than converting to vector and using vector methods.
  * `CategoricalVariable.h`, `IntegerVariable.h`, and `DoubleVariable.h` now define
  class methods outside of the class definition for easier readability, and add
  documentation.
  * `CategoricalVariable`, `IntegerVariable`, and `DoubleVariable` classes define
  a virtual destructor with default implementation.
  * `get_index_of_set` and `get_size_of_set_vector` methods for `IntegerVariable`
  now pass arguments by reference.
  * `get_values` method for `IntegerVariable` and `DoubleVariable` corrected to
  return value rather than reference.
  * add overload for `get_values` for `IntegerVariable` and `DoubleVariable` to
  accept `std::vector<size_t>` as argument rather than converting to bitset.
  * add function `bitset_to_vector_internal` to `IterableBitset.h`.
  * split `testthat/test/test-variables.R` into `testthat/test/test-categoricalvariable.R`,
  `testthat/test/test-integervariable.R`, and `testthat/test/test-doublevariable.R`
  * remove unnecessary `#include` statements from header files.
  * remove unnecessary comparisons for `size_t` types.
  