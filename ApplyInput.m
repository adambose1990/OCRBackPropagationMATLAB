function ApplyInput(in)
%% Apply input to the network with existing weight vector 
global NoOfLayer Exemplar config w z y;

for i = 1:1:NoOfLayer % Counting layers
    for j = 1:1:config(i+1) % Counting neurons in each layer
        z(i,j) = 0;
        for k = 1:1:config(i) % Counting input to each layer (= # of neurons in the previous layer)
            if (i == 1) % If the layer is not the first one 
                inputdata = Exemplar(in,k);
            else
                inputdata = y(i-1,k);
            end
            z(i,j) = z(i,j) + w{i}(j,k) * inputdata;
        end
        z(i,j) = z(i,j) + w{i}(j,config(i)+1); % Bias term
        y(i,j) = NonLinear(z(i,j));
    end
end
end