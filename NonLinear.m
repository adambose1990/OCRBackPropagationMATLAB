function [y] = NonLinear(z)
%% Activation function
    y = 1/(1 + exp(-z));
end