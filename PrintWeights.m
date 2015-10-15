function PrintWeights()
%% Prints complete information about the network
global NoOfLayer config w z y;

for i = 1:1:NoOfLayer % Counting layers
    disp(['Layer ' num2str(i)]);
    for j = 1:1:config(i+1) % Counting neurons in each layer
        disp(['Neuron ' num2str(i)]);
        for k = 1:1:config(i) % Counting input to each layer (= # of neurons in the previous layer)
            disp(['w[' num2str(i) '][' num2str(j) '][' num2str(k) ']=' num2str(w{i}(j,k))]);
        end
        disp(['w[' num2str(i) '][' num2str(j) '][BIAS]=' num2str(w{i}(j, config(i)+1))]);
        disp(['z[' num2str(i) '][' num2str(j) ']=' num2str(z(i,j))]);
        disp(['y[' num2str(i) '][' num2str(j) ']=' num2str(y(i,j))]);
    end
end
end