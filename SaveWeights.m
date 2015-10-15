function SaveWeights()
%% Saves weithts to a file 
global NoOfLayer config w;
fileID = fopen('weights.txt','wt');
for i = 1:1:NoOfLayer % Counting layers
    for j = 1:1:config(i+1) % Counting neurons in each layer
        for k = 1:1:config(i) % Counting input to each layer (= # of neurons in the previous layer)
            out = w{i}(j,k);
            fprintf(fileID, '%f\n', out);
        end
    end
end
fclose(fileID);
end