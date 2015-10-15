function LoadWeights()
%% Loads weithts from a file
global NoOfLayer config w;

fileID = fopen('weights.txt','r');
in = fscanf(fileID,'%f');
p = 1;
for i = 1:1:NoOfLayer % Counting layers
    for j = 1:1:config(i+1) % Counting neurons in each layer
        for k = 1:1:config(i) % Counting input to each layer (= # of neurons in the previous layer)
            w{i}(j,k) = in(p);
            p = p + 1;
        end
    end
end
fclose(fileID);
end