 function [scores00, scores01, scores10, scores11, scores0, scores1, ...
 length_scores00, mean_scores00, std_scores00, ...
 length_scores01, mean_scores01, std_scores01, ...
 length_scores10, mean_scores10, std_scores10, ...
 length_scores11, mean_scores11, std_scores11, ...
 non_Mean, att_Mean, non_SD, att_SD] = get_scores_and_stats(SUBJECT)

                 
str1 = 'Results/';
%str1 = 'C:\Origucla\Results\';

filestr1 = strcat(str1,SUBJECT,'/scores11.txt');
filestr2 = strcat(str1,SUBJECT,'/scores10.txt');
filestr3 = strcat(str1,SUBJECT,'/scores01.txt');
filestr4 = strcat(str1,SUBJECT,'/scores00.txt');
filestr5 = strcat(str1,SUBJECT,'/scores0.txt');
filestr6 = strcat(str1,SUBJECT,'/scores1.txt');

scores11 = load(filestr1, 'r');
scores10 = load(filestr2, 'r');
scores01 = load(filestr3, 'r');
scores00 = load(filestr4, 'r');
scores0 = load(filestr5, 'r');
scores1 = load(filestr6, 'r');


non_Mean= mean(scores0);
att_Mean= mean(scores1);
non_SD = std(scores0);
att_SD = std(scores1);


length_scores00 = length(scores00);
mean_scores00 = mean(scores00);
std_scores00 = std(scores00);


length_scores01 = length(scores01);
mean_scores01 = mean(scores01);
std_scores01 = std(scores01);

length_scores10 = length(scores10);
mean_scores10 = mean(scores10);
std_scores10 = std(scores10);

length_scores11 = length(scores11);
mean_scores11 = mean(scores11);
std_scores11 = std(scores11);