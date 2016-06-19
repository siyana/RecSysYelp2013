library(hydroGOF)

pRmse = function(a, predictedCol) {
   rmse(a[predictedCol],a[3])
}

varToString = function(x){
    deparse(substitute(x))
}