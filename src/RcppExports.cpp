// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// no_na_paste
CharacterVector no_na_paste(List l, std::string sep);
RcppExport SEXP tokenbrowser_no_na_paste(SEXP lSEXP, SEXP sepSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< List >::type l(lSEXP);
    Rcpp::traits::input_parameter< std::string >::type sep(sepSEXP);
    rcpp_result_gen = Rcpp::wrap(no_na_paste(l, sep));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"tokenbrowser_no_na_paste", (DL_FUNC) &tokenbrowser_no_na_paste, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_tokenbrowser(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}