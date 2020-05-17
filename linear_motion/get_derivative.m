function [data_der] = get_derivative(data)
%This function computes the derivative of the input signal
%Inputs: data signal (array)
%Outputs: data derivative
%Created by: Daniel Kuhman
%Github: https://github.com/dkuhman
%Last updated: 2020-05-17

data_der = [];

for i = 1:length(data)
    if i == length(data)
        break
    else
        data_der(end+1) = data(i+1) - data(i);
    end
end

data_der = data_der';

end

