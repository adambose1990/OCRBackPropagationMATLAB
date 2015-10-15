%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECE 599 Neural Networs                                       %
% Name: Arindam Bose                                           %
% UIN: 665387232                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Implementation of Character Recognition system using Backpropagation Neural Network
%% Initialization
global NoOfExemplar NoOfInput NoOfOutput NoOfLayer Exemplar TrueOutput config w z y Fi Rate Thresh;
Initialization();

%% Main menu
first = true;
while first
    clc;
    disp('------------- Main Menu -------------');
	disp('1: Apply weights and print output');
	disp('2: Train network'); 
    disp('3: Print current weights and parameters');
	disp('4: Save weights');
	disp('5: Load weights');
	disp('6: Recognition with noise');
    disp('7: Recognition with different input without noise');
	disp('0: Exit'); 
    ch = input('Your choice: ', 's');
    switch ch
        case '1'
            ApplyWeights(); % Apply weights and print output
        case '2'
            n = input('How many iteration? ');
            TrainNetwork(n); % Train network
            disp('Training Complete...');
        case '3'
            PrintWeights(); % Print current weights and parameters
        case '4'
            SaveWeights(); % Save weights to text file
            disp('Weights are saved to the file...');
        case '5'
            LoadWeights(); % Load weights from text file
            disp('Weights are loaded from the file...');
        case '6'
            n = input('Number of error bits (1-3)? ');
            RecognitionWithError(n); % Recognition with noise
        case '7'
            n = input('Test character (A/C/N/X/Y/Z)? ', 's');
            Testing(n); % Recognition with different input without noise
        case '0'
            first = false;
            disp('Exiting...');
    end
    disp('Press any key to continue...');
    pause;
end
clear all;