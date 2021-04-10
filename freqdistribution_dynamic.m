function [rv_vector] = freqdistribution_dynamic(flashboard_choice, pr)

space = 0.2;
a = pr(1);
b = pr(2);
c = pr(3);
d = pr(4);
e = pr(5);
f = pr(6);
g = pr(7);
h = pr(8);
i = pr(9);
j = pr(10);
k = pr(11);
l = pr(12);
m = pr(13);
n = pr(14);
o = pr(15);
p = pr(16);
q = pr(17);
r = pr(18);
s = pr(19);
t = pr(20);
u = pr(21);
v = pr(22);
w = pr(23);
x = pr(24);
y = pr(25);
z = pr(26);
one = pr(27);
two = pr(28);
three = pr(29);
four = pr(30);
five = pr(31);
six = pr(32);
seven = pr(33);
eight = pr(34);
nine = pr(35);

rv_vector = zeros(1,18);

   if flashboard_choice == 4   
       
       row1_prob_diag2 = space+(n+y+q) +four+ eight;
       row2_prob_diag2 = (l+e+s+w+j) + five;
       row3_prob_diag2 = (b+u+t+r+g+z);
       row4_prob_diag2 = one + (v+c+a+h+p);
       row5_prob_diag2 = six+two+(k+m+o+d);
       row6_prob_diag2 = nine+seven+three+(x+f+i);
       row1_prob_diag2+row2_prob_diag2+row3_prob_diag2+row4_prob_diag2+row5_prob_diag2+row6_prob_diag2-(one+two+three+four+five+six+seven+eight+nine+space);
       row_total=row1_prob_diag2+row2_prob_diag2+row3_prob_diag2+row4_prob_diag2+row5_prob_diag2+row6_prob_diag2;

       row1_prob_diag2 = row1_prob_diag2/row_total;
       row2_prob_diag2 = row2_prob_diag2/row_total;
       row3_prob_diag2 = row3_prob_diag2/row_total;
       row4_prob_diag2 = row4_prob_diag2/row_total;
       row5_prob_diag2 = row5_prob_diag2/row_total;
       row6_prob_diag2 = row6_prob_diag2/row_total;

       col1_prob_diag2 = space+(l+b)+ one+ six+ nine;
       col2_prob_diag2 = (n+e+u+v) +two+seven;
       col3_prob_diag2 = (y+s+t+c+k)+three;
       col4_prob_diag2 = (q+w+r+a+m+x);
       col5_prob_diag2 = four + (j+g+h+o+f);
       col6_prob_diag2 = eight+five+ (z+p+d+i);

       col1_prob_diag2+col2_prob_diag2+col3_prob_diag2+col4_prob_diag2+col5_prob_diag2+col6_prob_diag2-(one+two+three+four+five+six+seven+eight+nine+space);
       col_total=col1_prob_diag2+col2_prob_diag2+col3_prob_diag2+col4_prob_diag2+col5_prob_diag2+col6_prob_diag2;

       col1_prob_diag2 = col1_prob_diag2/col_total;
       col2_prob_diag2 = col2_prob_diag2/col_total;
       col3_prob_diag2 = col3_prob_diag2/col_total;
       col4_prob_diag2 = col4_prob_diag2/col_total;
       col5_prob_diag2 = col5_prob_diag2/col_total;
       col6_prob_diag2 = col6_prob_diag2/col_total;
       
       row1_prob = row1_prob_diag2;
       row2_prob = row2_prob_diag2;
       row3_prob = row3_prob_diag2;
       row4_prob = row4_prob_diag2;
       row5_prob = row5_prob_diag2;
       row6_prob = row6_prob_diag2;
       col1_prob = col1_prob_diag2;
       col2_prob = col2_prob_diag2;
       col3_prob = col3_prob_diag2;
       col4_prob = col4_prob_diag2;
       col5_prob = col5_prob_diag2;
       col6_prob = col6_prob_diag2;
       col7_prob = 0;
       col8_prob = 0;
       col9_prob = 0;
       col10_prob = 0;
       col11_prob = 0;
       col12_prob = 0;
   elseif flashboard_choice == 3  
       row1_prob_diag = space+(e+a+n+d+f);
       row2_prob_diag = (t+o+s+l+y+v);
       row3_prob_diag = (i+r+u+w+k+z);
       row4_prob_diag = (h+c+g+x)+one+four;
       row5_prob_diag = (m+p+q)+two+five+seven;
       row6_prob_diag = (b+j)+three+six+eight+nine;
       row1_prob_diag+row2_prob_diag+row3_prob_diag+row4_prob_diag+row5_prob_diag+row6_prob_diag-(one+two+three+four+five+six+seven+eight+nine+space);
       row_total=row1_prob_diag+row2_prob_diag+row3_prob_diag+row4_prob_diag+row5_prob_diag+row6_prob_diag;

       row1_prob_diag = row1_prob_diag/row_total;
       row2_prob_diag = row2_prob_diag/row_total;
       row3_prob_diag = row3_prob_diag/row_total;
       row4_prob_diag = row4_prob_diag/row_total;
       row5_prob_diag = row5_prob_diag/row_total;
       row6_prob_diag = row6_prob_diag/row_total;

       col1_prob_diag = space+(t+i+h+m+b);
       col2_prob_diag = (e+o+r+c+p+j);
       col3_prob_diag = (a+s+u+g+q)+three;
       col4_prob_diag = (n+l+w+x)+two+six;
       col5_prob_diag = (d+y+k)+one+five+eight;
       col6_prob_diag = (f+v+z)+four+seven+nine;

       col1_prob_diag+col2_prob_diag+col3_prob_diag+col4_prob_diag+col5_prob_diag+col6_prob_diag-(one+two+three+four+five+six+seven+eight+nine+space);
       col_total=col1_prob_diag+col2_prob_diag+col3_prob_diag+col4_prob_diag+col5_prob_diag+col6_prob_diag;

       col1_prob_diag = col1_prob_diag/col_total;
       col2_prob_diag = col2_prob_diag/col_total;
       col3_prob_diag = col3_prob_diag/col_total;
       col4_prob_diag = col4_prob_diag/col_total;
       col5_prob_diag = col5_prob_diag/col_total;
       col6_prob_diag = col6_prob_diag/col_total;
       
       row1_prob = row1_prob_diag;
       row2_prob = row2_prob_diag;
       row3_prob = row3_prob_diag;
       row4_prob = row4_prob_diag;
       row5_prob = row5_prob_diag;
       row6_prob = row6_prob_diag;
       col1_prob = col1_prob_diag;
       col2_prob = col2_prob_diag;
       col3_prob = col3_prob_diag;
       col4_prob = col4_prob_diag;
       col5_prob = col5_prob_diag;
       col6_prob = col6_prob_diag;
       col7_prob = 0;
       col8_prob = 0;
       col9_prob = 0;
       col10_prob = 0;
       col11_prob = 0;
       col12_prob = 0;
   elseif flashboard_choice == 2
%       targets = cell2mat(reshape(flash_sequence_checkerboard_3x6(1:6,:)',[],1));
       row1_prob_checkerboard_3x3= space + (e+t+a+o+i);
       row2_prob_checkerboard_3x3=(n+s+r+h+d+l);
       row3_prob_checkerboard_3x3=(u+c+m+f+y+w);
       row4_prob_checkerboard_3x3=(g+p+b+v+k+x);
       row5_prob_checkerboard_3x3=(q+j+z+one+two+three);
       row6_prob_checkerboard_3x3=(four+five+six+seven+eight+nine);

       row1_prob_checkerboard_3x3+row2_prob_checkerboard_3x3+row3_prob_checkerboard_3x3+row4_prob_checkerboard_3x3+row5_prob_checkerboard_3x3+row6_prob_checkerboard_3x3-(one+two+three+four+five+six+seven+eight+nine+space);
       row_total=row1_prob_checkerboard_3x3+row2_prob_checkerboard_3x3+row3_prob_checkerboard_3x3+row4_prob_checkerboard_3x3+row5_prob_checkerboard_3x3+row6_prob_checkerboard_3x3;

       row1_prob_checkerboard_3x3 = row1_prob_checkerboard_3x3/row_total;
       row2_prob_checkerboard_3x3 = row2_prob_checkerboard_3x3/row_total;
       row3_prob_checkerboard_3x3 = row3_prob_checkerboard_3x3/row_total;
       row4_prob_checkerboard_3x3 = row4_prob_checkerboard_3x3/row_total;
       row5_prob_checkerboard_3x3 = row5_prob_checkerboard_3x3/row_total;
       row6_prob_checkerboard_3x3 = row6_prob_checkerboard_3x3/row_total;

       col1_prob_checkerboard_3x3 = (a+m+y);
       col2_prob_checkerboard_3x3 = (c+o) + one;
       col3_prob_checkerboard_3x3 = (e+q) + three;
       col4_prob_checkerboard_3x3 = (h+t) + six;
       col5_prob_checkerboard_3x3 = (j+v) + eight;
       col6_prob_checkerboard_3x3 = (l+x) + space;
       col7_prob_checkerboard_3x3 = (b+n+z);
       col8_prob_checkerboard_3x3 = (d+p) + two;
       col9_prob_checkerboard_3x3 = (f+r) + four;
       col10_prob_checkerboard_3x3 = (g+s) + five;
       col11_prob_checkerboard_3x3 = (i+u) + seven;
       col12_prob_checkerboard_3x3 = (k+w) + nine;

       col1_prob_checkerboard_3x3 + col2_prob_checkerboard_3x3+col3_prob_checkerboard_3x3+col4_prob_checkerboard_3x3+col5_prob_checkerboard_3x3+col6_prob_checkerboard_3x3 - (one+two+three+four+five+six+seven+eight+nine+space                                                                );
       col_total=col1_prob_checkerboard_3x3+col2_prob_checkerboard_3x3+col3_prob_checkerboard_3x3+col4_prob_checkerboard_3x3+col5_prob_checkerboard_3x3+col6_prob_checkerboard_3x3+...
       col7_prob_checkerboard_3x3+col8_prob_checkerboard_3x3+col9_prob_checkerboard_3x3+col10_prob_checkerboard_3x3+col11_prob_checkerboard_3x3+col12_prob_checkerboard_3x3;
       col1_prob_checkerboard_3x3 = col1_prob_checkerboard_3x3/col_total;
       col2_prob_checkerboard_3x3 = col2_prob_checkerboard_3x3/col_total;
       col3_prob_checkerboard_3x3 = col3_prob_checkerboard_3x3/col_total;
       col4_prob_checkerboard_3x3 = col4_prob_checkerboard_3x3/col_total;
       col5_prob_checkerboard_3x3 = col5_prob_checkerboard_3x3/col_total;
       col6_prob_checkerboard_3x3 = col6_prob_checkerboard_3x3/col_total;
       col7_prob_checkerboard_3x3 = col7_prob_checkerboard_3x3/col_total;
       col8_prob_checkerboard_3x3 = col8_prob_checkerboard_3x3/col_total;
       col9_prob_checkerboard_3x3 = col9_prob_checkerboard_3x3/col_total;
       col10_prob_checkerboard_3x3 = col10_prob_checkerboard_3x3/col_total;
       col11_prob_checkerboard_3x3 = col11_prob_checkerboard_3x3/col_total;
       col12_prob_checkerboard_3x3 = col12_prob_checkerboard_3x3/col_total;

       row1_prob = row1_prob_checkerboard_3x3;
       row2_prob = row2_prob_checkerboard_3x3;
       row3_prob = row3_prob_checkerboard_3x3;
       row4_prob = row4_prob_checkerboard_3x3;
       row5_prob = row5_prob_checkerboard_3x3;
       row6_prob = row6_prob_checkerboard_3x3;
       col1_prob = col1_prob_checkerboard_3x3;
       col2_prob = col2_prob_checkerboard_3x3;
       col3_prob = col3_prob_checkerboard_3x3;
       col4_prob = col4_prob_checkerboard_3x3;
       col5_prob = col5_prob_checkerboard_3x3;
       col6_prob = col6_prob_checkerboard_3x3;
       col7_prob = col7_prob_checkerboard_3x3;
       col8_prob = col8_prob_checkerboard_3x3;
       col9_prob = col9_prob_checkerboard_3x3;
       col10_prob = col10_prob_checkerboard_3x3;
       col11_prob = col11_prob_checkerboard_3x3;
       col12_prob = col12_prob_checkerboard_3x3;       
   elseif flashboard_choice == 1
 %      targets = cell2mat(reshape(flash_sequence_new(1:6,:)',[],1));
 
       row1_prob_new= space + (e+t+a+o+i);
       row2_prob_new=(n+s+r+h+d+l);
       row3_prob_new=(u+c+m+f+y+w);
       row4_prob_new=(g+p+b+v+k+x);
       row5_prob_new=(q+j+z+one+two+three);
       row6_prob_new=(four+five+six+seven+eight+nine);
       row1_prob_new+row2_prob_new+row3_prob_new+row4_prob_new+row5_prob_new+row6_prob_new - (one+two+three+four+five+six+seven+eight+nine+space);
       row_total=row1_prob_new+row2_prob_new+row3_prob_new+row4_prob_new+row5_prob_new+row6_prob_new;
       row1_prob_new = row1_prob_new/row_total;
       row2_prob_new = row2_prob_new/row_total;
       row3_prob_new = row3_prob_new/row_total;
       row4_prob_new = row4_prob_new/row_total;
       row5_prob_new = row5_prob_new/row_total;
       row6_prob_new = row6_prob_new/row_total;

       col1_prob_new = space +(n+u+g+q) + four;
       col2_prob_new = (e+s+c+p+j) + five;
       col3_prob_new = (t+r+m+b+z) + six;
       col4_prob_new = (a+h+f+v) + one + seven;
       col5_prob_new = (o+d+y+k) + two + eight;
       col6_prob_new = (i+l+w+x) + three + nine;

       col1_prob_new + col2_prob_new+col3_prob_new+col4_prob_new+col5_prob_new+col6_prob_new - (one+two+three+four+five+six+seven+eight+nine+space);
       col_total=col1_prob_new+col2_prob_new+col3_prob_new+col4_prob_new+col5_prob_new+col6_prob_new;
       col1_prob_new = col1_prob_new/col_total;
       col2_prob_new = col2_prob_new/col_total;
       col3_prob_new = col3_prob_new/col_total;
       col4_prob_new = col4_prob_new/col_total;
       col5_prob_new = col5_prob_new/col_total;
       col6_prob_new = col6_prob_new/col_total;

       row1_prob_new+row2_prob_new+row3_prob_new+row4_prob_new+row5_prob_new+row6_prob_new;
       col1_prob_new+col2_prob_new+col3_prob_new+col4_prob_new+col5_prob_new+col6_prob_new;

       row1_prob = row1_prob_new;
       row2_prob = row2_prob_new;
       row3_prob = row3_prob_new;
       row4_prob = row4_prob_new;
       row5_prob = row5_prob_new;
       row6_prob = row6_prob_new;
       col1_prob = col1_prob_new;
       col2_prob = col2_prob_new;
       col3_prob = col3_prob_new;
       col4_prob = col4_prob_new;
       col5_prob = col5_prob_new;
       col6_prob = col6_prob_new;
       col7_prob = 0;
       col8_prob = 0;
       col9_prob = 0;
       col10_prob = 0;
       col11_prob = 0;
       col12_prob = 0;
   elseif flashboard_choice == 0
%       targets = cell2mat(reshape(flash_sequence_regular(1:6,:)',[],1));

       row1_prob_regular = (a+b+c+d+e+f);
       row2_prob_regular = (g+h+i+j+k+l);
       row3_prob_regular = (m+n+o+p+q+r);
       row4_prob_regular = (s+t+u+v+w+x);
       row5_prob_regular = (y+z+one+two+three+four);
       row6_prob_regular = (five+six+seven+eight+nine+space);
       row1_prob_regular+row2_prob_regular+row3_prob_regular+row4_prob_regular+row5_prob_regular+row6_prob_regular-(one+two+three+four+five+six+seven+eight+nine+space);
       row_total=row1_prob_regular+row2_prob_regular+row3_prob_regular+row4_prob_regular+row5_prob_regular+row6_prob_regular;

       row1_prob_regular = row1_prob_regular/row_total;
       row2_prob_regular = row2_prob_regular/row_total;
       row3_prob_regular = row3_prob_regular/row_total;
       row4_prob_regular = row4_prob_regular/row_total;
       row5_prob_regular = row5_prob_regular/row_total;
       row6_prob_regular = row6_prob_regular/row_total;

       col1_prob_regular = (a+g+m+s+y) + five;
       col2_prob_regular = (b+h+n+t+z) + six;
       col3_prob_regular = (c+i+o+u) + one+seven;
       col4_prob_regular = (d+j+p+v) + two+eight;
       col5_prob_regular = (e+k+q+w) + three+nine;
       col6_prob_regular = (f+l+r+x) + four+space;

       
       row1_prob_regular+row2_prob_regular+row3_prob_regular+row4_prob_regular+row5_prob_regular+row6_prob_regular;
       col1_prob_regular+col2_prob_regular+col3_prob_regular+col4_prob_regular+col5_prob_regular+col6_prob_regular-(one+two+three+four+five+six+seven+eight+nine+space);
       col_total=col1_prob_regular+col2_prob_regular+col3_prob_regular+col4_prob_regular+col5_prob_regular+col6_prob_regular;
 
       col1_prob_regular = col1_prob_regular/col_total;
       col2_prob_regular = col2_prob_regular/col_total;
       col3_prob_regular = col3_prob_regular/col_total;
       col4_prob_regular = col4_prob_regular/col_total;
       col5_prob_regular = col5_prob_regular/col_total;
       col6_prob_regular = col6_prob_regular/col_total;
       
       row1_prob = row1_prob_regular;
       row2_prob = row2_prob_regular;
       row3_prob = row3_prob_regular;
       row4_prob = row4_prob_regular;
       row5_prob = row5_prob_regular;
       row6_prob = row6_prob_regular;
       col1_prob = col1_prob_regular;
       col2_prob = col2_prob_regular;
       col3_prob = col3_prob_regular;
       col4_prob = col4_prob_regular;
       col5_prob = col5_prob_regular;
       col6_prob = col6_prob_regular;
       col7_prob = 0;
       col8_prob = 0;
       col9_prob = 0;
       col10_prob = 0;
       col11_prob = 0;
       col12_prob = 0;
   end
%    row1_prob_regular+row2_prob_regular+row3_prob_regular+row4_prob_regular+row5_prob_regular+row6_prob_regular;
%    col1_prob_regular+col2_prob_regular+col3_prob_regular+col4_prob_regular+col5_prob_regular+col6_prob_regular;
%    row1_prob_new+row2_prob_new+row3_prob_new+row4_prob_new+row5_prob_new+row6_prob_new;
%    col1_prob_new+col2_prob_new+col3_prob_new+col4_prob_new+col5_prob_new+col6_prob_new;
%    row1_prob_checkerboard_3x3+row2_prob_checkerboard_3x3+row3_prob_checkerboard_3x3+row4_prob_checkerboard_3x3+row5_prob_checkerboard_3x3+row6_prob_checkerboard_3x3;
%    col1_prob_checkerboard_3x3+col2_prob_checkerboard_3x3+col3_prob_checkerboard_3x3+col4_prob_checkerboard_3x3+col5_prob_checkerboard_3x3+col6_prob_checkerboard_3x3+...
%    col7_prob_checkerboard_3x3+col8_prob_checkerboard_3x3+col9_prob_checkerboard_3x3+col10_prob_checkerboard_3x3+col11_prob_checkerboard_3x3+col12_prob_checkerboard_3x3    ;
   
   all_prob = [row1_prob row2_prob row3_prob row4_prob row5_prob row6_prob col1_prob col2_prob col3_prob col4_prob col5_prob col6_prob ];
   Max_no = 12;
   if (flashboard_choice == 2) % Longer in the case of checkerboard
       all_prob = [all_prob col7_prob col8_prob col9_prob col10_prob col11_prob col12_prob];
       Max_no = 18;
   end
   for idx=1:length(all_prob)
     if all_prob(idx) == 0
         rv_vector(Max_no) = idx;
         Max_no = Max_no - 1;
     end
   end
    
   if flashboard_choice == 2
         row_prob = [row1_prob  row2_prob  row3_prob  row4_prob row5_prob row6_prob];
         idx_no = [1 2 3 4 5 6];
         [row_prob, idxsort] = sort(row_prob, 'descend');
         rv_vector(1:6) = idx_no(idxsort);
         col_prob = [col1_prob col2_prob col3_prob col4_prob col5_prob col6_prob col7_prob col8_prob col9_prob col10_prob col11_prob col12_prob ];
         idx_no = [7 8 9 10 11 12 13 14 15 16 17 18];
         [col_prob, idxsort] = sort(col_prob, 'descend');
         rv_vector(7:18) = idx_no(idxsort);
   else
         row_prob = [row1_prob  row2_prob  row3_prob  row4_prob row5_prob row6_prob];
         idx_no = [1 2 3 4 5 6];
         [row_prob, idxsort] = sort(row_prob, 'descend');
         rv_vector(1:6) = idx_no(idxsort);
         col_prob = [col1_prob col2_prob col3_prob col4_prob col5_prob col6_prob];
         idx_no = [7 8 9 10 11 12];
         [col_prob, idxsort] = sort(col_prob, 'descend');
         rv_vector(7:12) = idx_no(idxsort);
   end
end
