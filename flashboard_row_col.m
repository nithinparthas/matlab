function [rows, cols] = flashboard_row_col(flashboard_choice, targets, nc, nr)


if flashboard_choice == 0
   rows=floor(((1:length(targets))-1)/nc)+1; %row labels for each letter
   cols=mod((1:length(targets))-1,nc)+1+nr; %column labels for each letter
elseif flashboard_choice == 1
   rows = [1 4 3 2 1 3 4 2 1 5 4 2 3 2 1 4 5 2 2 1 3 4 3 4 3 5 5 5 5 6 6 6 6 6 6 1];
   cols = [10 9 8 11 8 10 7 10 12 8 11 12 9 7 11 8 7 9 8 9 7 10 12 12 11 9 9 10 11 7 8 9 10 11 12 7];
elseif flashboard_choice == 2
   rows = [1 4 1 4 1 4 4 1 4 1 4 1 2 5 2 5 2 5 5 2 5 2 5 2 3 6 3 6 3 6 6 3 6 3 6 3];
   cols = [7 13 8 14 9 15 16 10 17 11 18 12 7 13 8 14 9 15 16 10 17 11 18 12 7 13 8 14 9 15 16 10 17 11 18 12]; 
elseif flashboard_choice == 3
   rows = [1 6 4 1 1 1 4 4 3 6 3 2 5 1 2 5 5 3 2 2 3 2 3 4 2 3 4 5 6 4 5 6 5 6 6 1];
   cols = [9 7 8 11 8 12 9 7 7 8 11 10 7 10 8 8 9 8 9 7 9 12 10 10 11 12 11 10 9 12 11 10 12 11 12 7];
elseif flashboard_choice == 4
   rows = [4 3 4 5 2 6 3 4 6 2 5 2 5 1 5 4 1 3 2 3 3 4 2 6 1 3 4 5 6 1 2 5 6 1 6 1];
   cols = [10 7 9 12 8 11 11 11 12 11 9 7 10 8 11 12 10 10 9 9 8 8 10 10 9 12 7 8 9 11 12 7 8 12 7 7];     
end