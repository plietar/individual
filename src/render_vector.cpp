/*
 * render_vector.cpp
 *
 *  Created on: 21 Dec 2023
 *      Author: pl2113
 */


#include "../inst/include/RenderVector.h"
#include <Rcpp.h>


//[[Rcpp::export]]
Rcpp::XPtr<RenderVector> create_render_vector(Rcpp::NumericVector data) {
    return Rcpp::XPtr<RenderVector>(new RenderVector(data), true);
}

//[[Rcpp::export]]
void render_vector_update(Rcpp::XPtr<RenderVector> v, size_t index, float value) {
    v->update(index, value);
}

//[[Rcpp::export]]
Rcpp::NumericVector render_vector_data(Rcpp::XPtr<RenderVector> v) {
    return v->data();
}
