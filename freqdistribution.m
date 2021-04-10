function [row1_prob_regular, row2_prob_regular, row3_prob_regular, row4_prob_regular, row5_prob_regular, row6_prob_regular, col1_prob_regular, col2_prob_regular, col3_prob_regular, col4_prob_regular, col5_prob_regular, col6_prob_regular,... 
    row1_prob_new, row2_prob_new, row3_prob_new, row4_prob_new, row5_prob_new, row6_prob_new, col1_prob_new, col2_prob_new, col3_prob_new, col4_prob_new, col5_prob_new, col6_prob_new,...
    row1_prob_diag, row2_prob_diag, row3_prob_diag, row4_prob_diag, row5_prob_diag, row6_prob_diag, col1_prob_diag, col2_prob_diag, col3_prob_diag, col4_prob_diag, col5_prob_diag, col6_prob_diag] = freqdistribution()

space = 0.2;
e= 12.02/100;
t= 9.10/100;
a= 8.12/100;
o=7.68/100;
i=7.31/100;
n=6.95/100;
s=6.28/100;
r=6.02/100;
h=5.92/100;
d=4.32/100;
l=3.98/100;
u=2.88/100;
c=2.71/100;
m=2.61/100;
f=2.30/100;
y=2.11/100;
w=2.09/100;
g=2.03/100;
p=1.82/100;
b=1.49/100;
v=1.11/100;
k=0.69/100;
x=0.17/100;
q=0.11/100;
j=0.10/100;
z=0.07/100;
one=1/36;
two=1/36;
three=1/36;
four=1/36;
five=1/36;
six=1/36;
seven=1/36;
eight=1/36;
nine=1/36;


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

col1_prob_regular+col2_prob_regular+col3_prob_regular+col4_prob_regular+col5_prob_regular+col6_prob_regular-(one+two+three+four+five+six+seven+eight+nine+space);
col_total=col1_prob_regular+col2_prob_regular+col3_prob_regular+col4_prob_regular+col5_prob_regular+col6_prob_regular;
col1_prob_regular = col1_prob_regular/col_total;
col2_prob_regular = col2_prob_regular/col_total;
col3_prob_regular = col3_prob_regular/col_total;
col4_prob_regular = col4_prob_regular/col_total;
col5_prob_regular = col5_prob_regular/col_total;
col6_prob_regular = col6_prob_regular/col_total;

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


