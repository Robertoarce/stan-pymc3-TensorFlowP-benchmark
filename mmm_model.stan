// marketing_mix_model.stan
data {
  int<lower=0> N; // Number of observations
  vector[N] tv;
  vector[N] lnl;
  vector[N] social;
  vector[N] display;
  vector[N] email;
  vector[N] search;
  vector[N] sales; // Sales data
}

parameters {
  real alpha; // Intercept
  real beta_tv;
  real beta_lnl;
  real beta_social;
  real beta_display;
  real beta_email;
  real beta_search;
  real<lower=0> sigma; // Error term
}

model {
  // Priors
  alpha ~ normal(0, 1000);
  beta_tv ~ normal(0, 1000);
  beta_lnl ~ normal(0, 1000);
  beta_social ~ normal(0, 1000);
  beta_display ~ normal(0, 1000);
  beta_email ~ normal(0, 1000);
  beta_search ~ normal(0, 1000);
  sigma ~ normal(0, 1000);

  // Likelihood
  sales ~ normal(alpha + beta_tv * tv + beta_lnl * lnl + beta_social * social + beta_display * display + beta_email * email + beta_search * search, sigma);
}