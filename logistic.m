function v = logistic(t,x)
    v = 0.5 - 1./(1+exp(t.*x));
end
