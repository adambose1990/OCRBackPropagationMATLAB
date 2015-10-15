fileID = fopen('error.txt','r');
in = fscanf(fileID,'%f');
plot(in,'LineWidth',2);
xlabel('No of Iteration');
ylabel('Squared Error');
fclose(fileID);