function Testing(sym)
%% Recognition with different input without noise
global NoOfLayer config y Thresh;

tic;
switch sym % Choose the input
    case 'A'
        in = 1;
    case 'C'
        in = 2;
    case 'N'
        in = 3;
    case 'X'
        in = 4;
    case 'Y'
        in = 5;
    case 'Z'
        in = 6;
    otherwise
        disp('Wrong selection...');
        in = 0;
end
if (in > 0)
    ApplyInput(in); % Apply input to the network with existing weights
    disp(['Test Character: ' sym]);
    str = 'N/W Output: ';
    for j = 1:1:config(4)
        str = strcat(str, '[', num2str(y(NoOfLayer,j)), ']');
        if (y(NoOfLayer,j) > (1 - Thresh)) % Threshold output layer
            k = 1;
        elseif (y(NoOfLayer,j) < Thresh)
            k = 0;
        else
            k = 2;
        end
        match(j) = k;
    end
    disp(str);
    if match(1)==0 && match(2)==1 % Recognition of output
        found = 'A';
    elseif match(1)==1 && match(2)==0
        found = 'C';
    elseif match(1)==1 && match(2)==1
        found = 'N';
    else
        found = 'Other';
    end
    disp(['Recognized Character: ' found]);
end
t=toc;
disp(['Total testing time elapsed : ' num2str(t) ' secs']);
end