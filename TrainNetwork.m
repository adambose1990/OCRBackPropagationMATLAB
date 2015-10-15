function TrainNetwork(num)
%% Training of network num # of iteration
global NoOfExemplar NoOfLayer Exemplar TrueOutput config w y Fi Rate;

fileID = fopen('error.txt','wt');
tic;
RateTemp = Rate; % Starting learning rate

for it = 1:1:num % Going through all tr training runs
    sqErr = 0; % Each training run consists of runs through each training set
    for in = 1:1:NoOfExemplar
        ApplyInput(in);
        for i = NoOfLayer:-1:1 % Counting the layers down
            for j = 1:1:config(i+1) % Counting neurons in the layer
                if(i == NoOfLayer) % If it is the output layer
                    multi = TrueOutput(in,j) - y(i,j);
                else
                    multi = 0;
                    for k = 1:1:config(i+2) % Counting neurons in the following layer
                        multi = multi + Fi(i+1,k) * w{i+1}(k,j);
                    end
                end
                Fi(i,j) = y(i,j) * (1-y(i,j)) * multi;
                for k = 1:1:config(i) % Counting input to each layer (= # of neurons in the previous layer)
                   if (i == 1) % If it is a first layer 
                       prevOutput = Exemplar(in,k);
                   else
                       prevOutput = y(i-1,k);
                   end
                   w{i}(j,k) = w{i}(j,k) + Rate * Fi(i,j)* prevOutput;
                end
                % Bias weight correction
                w{i}(j,config(i)+1) = w{i}(j,config(i)+1) + Rate * Fi(i,j);
            end
        end
        sqErr = sqErr + (y(NoOfLayer,1) - TrueOutput(in,1))^2 + ...
			(y(NoOfLayer,2) - TrueOutput(in,2))^2;
    end
    fprintf(fileID, '%f\n' , 0.5*sqErr);
    if(~rem(it,100)) % Decrease learning rate every 100th iteration
		Rate = Rate/2;
    end 
    if(~rem(it,400)) % Go back to original learning rate every 400th iteration
		Rate = RateTemp;
    end
end
t=toc;
disp(['Total training time elapsed : ' num2str(t) ' secs']);
fclose(fileID);
end