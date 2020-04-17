#' Calculate residuals for a model excluding one of the predictors
#'
#' Allows access to residuals without the influence of a particular predictor
#'
#' @param model The input model, e.g. lm(a ~ b + c)
#' @param predictor The name of the predictor to be excluded
#'
#' @return A tibble containing true value, predicted values without the
#'   predictor, and the residuals without the predictor
#' @export
#'
#' @examples
#'
#' data(mtcars)
#' model1 <- lm(mpg ~ cyl + disp + gear, data=mtcars)
#' resout <- residuals_for(model1, "cyl")
#'
#' model2 <- lm(residuals ~ cyl + 0, data=resout)
#'
#' coef(model1)
#' coef(model2)
#'
#'
residuals_for <- function(model, predictor) {

  dv <- all.vars(as.formula(model$terms)[[2]])
  predictors <- all.vars(as.formula(model$terms)[[3]])
  modeldata <- model$model

  if(!predictor %in% predictors) {
    stop("The predictor is not found in the model")
  }

  coefdf <- tibble::as_tibble(as.list(model$coefficients))

  rescoefdf <- dplyr::select(coefdf, -starts_with(predictor))

  intercept <- ifelse( "(Intercept)" %in% names(rescoefdf), rescoefdf$`(Intercept)`[1], 0 )

  slopecoefdf <- dplyr::select(rescoefdf, -"(Intercept)")

  slopecoefdf <- slopecoefdf[rep(1, each=nrow(modeldata)),]

  predictorsdf <- dplyr::select(modeldata, names(modeldata)[names(modeldata) %in% names(slopecoefdf)] )

  predictiondf <- slopecoefdf * predictorsdf
  predictiondf$intercept = intercept

  predicted <- rowSums(predictiondf)

  true <- dplyr::pull(modeldata, dv)

  residuals <- true - predicted

  predictorvals <- dplyr::select(modeldata, predictor)

  out <- tibble::tibble(true = true, predicted = predicted, residuals = residuals)
  out <- dplyr::bind_cols(out, predictorvals)

  return(out)

}
