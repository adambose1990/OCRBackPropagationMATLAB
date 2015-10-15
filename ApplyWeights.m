function ApplyWeights()
%% Apply existing weights and prints the output of the network 
global NoOfExemplar NoOfLayer TrueOutput config y Thresh;

for in = 1:1:NoOfExemplar % Counting number of datasets
    ApplyInput(in);
    str = ['Training Set: ' num2str(in) ':'];
    for j = 1:1:config(4) % Counting neurons in the output layer
        str = strcat(str, '[', num2str(y(NoOfLayer,j)), ']');
    end
    if(y(NoOfLayer,1) > (TrueOutput(in,1) - Thresh) ...
    && y(NoOfLayer,1) < (TrueOutput(in,1) + Thresh) ...
    && y(NoOfLayer,2) > (TrueOutput(in,2) - Thresh) ...
    && y(NoOfLayer,2) < (TrueOutput(in,2) + Thresh))
            decision = 'Passed';
        else
            decision = 'Failed';
    end
    disp([str ': ' decision]);
end
end