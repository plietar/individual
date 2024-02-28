library(ggplot2)
library(forcats)
library(dplyr)
devtools::load_all("individual")

#grid <- expand.grid(
#  size=c(1e4, 1e5, 1e6, 1e7),
#  rate=c(0.005, 0.05, 0.25, 0.4, 0.5, 0.6, 0.75, 0.95, 0.995))

grid <- expand.grid(
  size=c(1e6),
  #size=c(1e4, 1e5, 1e6, 1e7),
  rate=c(0.005, 0.05, 0.25, 0.5, 0.75, 0.95, 0.995)
)

data <- bench::press({
  bs <- individual::Bitset$new(size)
  bench::mark(
    naive = {
      bs$fill()
      bitset_sample_naive(bs$.bitset, rate)
    },
    naive_bulk = {
      bs$fill()
      bitset_sample_naive_bulk(bs$.bitset, rate)
    },
    binomial = {
      bs$fill()
      bitset_sample_binomial(bs$.bitset, rate)
    },
    binomial_opt = {
      bs$fill()
      bitset_sample_binomial_opt(bs$.bitset, rate)
    },
    binomial_opt_faster = {
      bs$fill()
      bitset_sample_binomial_opt_faster(bs$.bitset, rate)
    },
    binomial_opt_faster_bmi2 = {
      bs$fill()
      bitset_sample_binomial_opt_faster_bmi2(bs$.bitset, rate)
    },
    skip = {
      bs$fill()
      bitset_sample_skip(bs$.bitset, rate)
    },
    skip_faster = {
      bs$fill()
      bitset_sample(bs$.bitset, rate)
    },
    skip_faster_bmi2 = {
      bs$fill()
      bitset_sample_skip_faster_bmi2(bs$.bitset, rate)
    },
    min_iterations = 10,
    check = FALSE
  )
}, .grid = grid)

autoplot(data) +
  aes(x=fct_rev(fct_inorder(expression)), color=fct_inorder(expression)) +
  ggh4x::facet_grid2(rate ~ size, scales = "free", labeller = ggplot2::label_both) +
  labs(x="expression", color="expression")
