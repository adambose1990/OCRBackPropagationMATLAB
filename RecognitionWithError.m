function RecognitionWithError(num)
%% Recognition statistics for 1, 2 and 3 false bit cases 
global NoOfExemplar NoOfLayer Exemplar TrueOutput config y Thresh;

switch num
    case 1
        tic
        disp('With 1 false bit per character:');
        TotalCases = config(1);
        for in = 1:1:NoOfExemplar % Looking at each dataset
            count = 0;
            for j = 1:1:config(1) % Looking at each bit in a dataset
                if(Exemplar(in,j))
                    Exemplar(in,j) = 0;
                else
                    Exemplar(in,j) = 1;
                end
                ApplyInput(in);
                if(y(NoOfLayer,1) > (TrueOutput(in,1) - Thresh) ...
                && y(NoOfLayer,1) < (TrueOutput(in,1) + Thresh) ...
                && y(NoOfLayer,2) > (TrueOutput(in,2) - Thresh) ...
                && y(NoOfLayer,2) < (TrueOutput(in,2) + Thresh))
                        count = count + 1;
                end
                if(Exemplar(in,j)) % Switching back
                    Exemplar(in,j) = 0;
                else
                    Exemplar(in,j) = 1;
                end
            end
            disp(['Training Set ' num2str(in) ': ' num2str(count) '/' num2str(TotalCases) ' recognitions (' num2str(count / TotalCases * 100) '%)']);
        end
        t=toc;
        disp(['Total time elapsed : ' num2str(t) ' secs']);
    case 2
        tic
        disp('With 2 false bit per character:');
        TotalCases = config(1)*(config(1)-1);
        for in = 1:1:NoOfExemplar % Looking at each dataset
            count = 0;
            for j = 1:1:config(1) % Looking at each bit in a dataset
                for k = 1:1:config(1)
                    if j==k
                        continue;
                    end
                    if(Exemplar(in,j)) % Switching back
                        Exemplar(in,j) = 0;
                    else
                        Exemplar(in,j) = 1;
                    end
                    if(Exemplar(in,k))
                        Exemplar(in,k) = 0;
                    else
                        Exemplar(in,k) = 1;
                    end
                    ApplyInput(in);
                    if(y(NoOfLayer,1) > (TrueOutput(in,1) - Thresh) ...
                    && y(NoOfLayer,1) < (TrueOutput(in,1) + Thresh) ...
                    && y(NoOfLayer,2) > (TrueOutput(in,2) - Thresh) ...
                    && y(NoOfLayer,2) < (TrueOutput(in,2) + Thresh))
                            count = count + 1;
                    end
                    if(Exemplar(in,j))
                        Exemplar(in,j) = 0;
                    else
                        Exemplar(in,j) = 1;
                    end
                    if(Exemplar(in,k))
                        Exemplar(in,k) = 0;
                    else
                        Exemplar(in,k) = 1;
                    end
                end
            end
            disp(['Training Set ' num2str(in) ': ' num2str(count) '/' num2str(TotalCases) ' recognitions (' num2str(count / TotalCases * 100) '%)']);
        end
        t=toc;
        disp(['Total time elapsed : ' num2str(t) ' secs']);
    case 3
        tic
        disp('With 3 false bit per character:');
        TotalCases = config(1) * (config(1)-1) * (config(1)-2);
        for in = 1:1:NoOfExemplar % Looking at each dataset
            count = 0;
            for j = 1:1:config(1) % Looking at each bit in a dataset
                for k = 1:1:config(1)
                    if j==k
                        continue;
                    end
                    for l = 1:1:config(1)
                        if k==l || j==l
                            continue;
                        end
                        if(Exemplar(in,j))
                            Exemplar(in,j) = 0;
                        else
                            Exemplar(in,j) = 1;
                        end
                        if(Exemplar(in,k))
                            Exemplar(in,k) = 0;
                        else
                            Exemplar(in,k) = 1;
                        end
                        if(Exemplar(in,l))
                            Exemplar(in,l) = 0;
                        else
                            Exemplar(in,l) = 1;
                        end
                        ApplyInput(in);
                        if(y(NoOfLayer,1) > (TrueOutput(in,1) - Thresh) ...
                        && y(NoOfLayer,1) < (TrueOutput(in,1) + Thresh) ...
                        && y(NoOfLayer,2) > (TrueOutput(in,2) - Thresh) ...
                        && y(NoOfLayer,2) < (TrueOutput(in,2) + Thresh))
                                count = count + 1;
                        end
                        if(Exemplar(in,j)) % Switching back
                            Exemplar(in,j) = 0;
                        else
                            Exemplar(in,j) = 1;
                        end
                        if(Exemplar(in,k))
                            Exemplar(in,k) = 0;
                        else
                            Exemplar(in,k) = 1;
                        end
                        if(Exemplar(in,l))
                            Exemplar(in,l) = 0;
                        else
                            Exemplar(in,l) = 1;
                        end
                    end
                end
            end
            disp(['Training Set ' num2str(in) ': ' num2str(count) '/' num2str(TotalCases) ' recognitions (' num2str(count / TotalCases * 100) '%)']);
        end
        t=toc;
        disp(['Total time elapsed : ' num2str(t) ' secs']);
end
end