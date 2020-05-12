// SICRLMQC.stan
// Latent variable linear SICR model with mitigation, q>0, sigmac time dependence

#include functionsSICRL.stan
#include data.stan

transformed data {
    real x_r[0];
    int x_i[0];
    real sigmar1 = 0.;
    int n_difeq = 5;     // number of differential equations for yhat
    // real q = 0.;
    real n_pop = 1000;
}

parameters {
    real<lower=0> f1;             // initial infected to case ratio
    real<lower=0> f2;             // f2  beta - sigmau
    real<lower=0> sigmar;         // recovery rate
    real<lower=0> sigmad;         // death rate
    real<lower=0> sigmau;         // I disappearance rate
    real<lower=0> mbase;          // mitigation strength
    real<lower=0> mlocation;      // day of mitigation application
    real<lower=0> extra_std;      // phi = 1/extra_std^2 in neg_binomial_2(mu,phi)
    real<lower=0> q;              // infection factor for cases
    real<lower=0> cbase;          // case detection factor
    real<lower=0> clocation;      // day of case change
    //real<lower=0> sigmar1;      // 1st compartment recovery rate
    //real<lower=1> n_pop;      // population size
}

#include transformedparameters.stan
#include model.stan
#include generatedquantities.stan
