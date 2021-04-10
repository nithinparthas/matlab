
function [rv, ismem_arr, flashboard_matrix, flash_sequence, cstate, branch_count] = flashboard_polling_huffman(rv, pr, ismem_arr, nstims, cstate, branch_count)

flash_sequence_regular = {'a','b','c','d','e','f';
             'g','h','i','j','k','l';
             'm','n','o','p','q','r';
             's','t','u','v','w','x';
             'y','z','1','2','3','4';
             '5','6','7','.','9','_';};
           
           flashboard_matrix =    [0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0];
           flashboard_matrix_else =[0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0 ...
                                   0 0 0 0 0 0];
           valid_else = 0;

           if (nstims == 100)
               fprintf("Large Nstims=%d \n", nstims);
           end
           if rv == 11
              rv = 1;
           else
              rv = rv + 1;
           end
%            prob = [0.0963, 0.0383, 0.0400, 0.0251, 0.0202, 0.0339, 0.0142, 0.0450, 0.0563, 0.0045, 0.0042, 0.0196, ...
%                    0.0328, 0.0180, 0.0592, 0.0326, 0.0016, 0.0217, 0.0574, 0.1320, 0.0097, 0.0054, 0.0506, 0.0001, ...
%                    0.0071, 0.0002, 0.0034, 0.0013, 0.0007, 0.0005, 0.0004, 0.0003, 0.0003, 0.0002, 0.0002 0.1667 ];
%            prob = prob/sum(prob);
           dict = huffmandict([1:1:36],pr);  
           count_if = 0;
           count_else = 0;
           if (rv == 1) %First flash, MSB= 0 
             branch_count = 1;
             for idx = 1:36
                 if dict{idx,2}(1) == 1
                    flashboard_matrix(idx) = 1;
                    flashboard_matrix_else(idx) = 0;
                    count_if = count_if + 1;
                 else
                    flashboard_matrix(idx) = 0;
                    flashboard_matrix_else(idx) = 1;
                    count_else = count_else + 1;
                 end
             end
           else  
             cstate(branch_count) = ismem_arr(1); % Record the state of the Huffman tree
             branch_count = branch_count + 1;
             for idx = 1:36
               if length(dict{idx,2}) >= branch_count
                 str1 = dict{idx,2}(1:branch_count-1);
                 str2 = cstate(1:branch_count - 1);
                 if (isequal(str1,str2) == 1)
                   if  dict{idx,2}(branch_count) == 1 
                      flashboard_matrix(idx) = rv;
                      flashboard_matrix_else(idx) = 0;
                      count_if = count_if + 1;
                      cstate(branch_count) = 1;
                   else
                      flashboard_matrix(idx) = 0;
                      flashboard_matrix_else(idx) = rv;
                      count_else = count_else + 1;
                      cstate(branch_count) = 0;
                   end
                 end
               end
             end
           end
      if (count_if == 0) && (count_else == 0)
          fprintf("Invalid Branch of Huffman, rv=%d, nstims=%d\n", rv, nstims);
          rv = 0;
          ismem_arr = zeros(10,1);
          cstate = zeros(1,11);
      end
      if (count_if > 0)
           valid_if = 1;
      end
      if (count_else > 0)
           valid_else = 1;
      end
      for row = 1:6
        for col = 1:6
            if flashboard_matrix((row-1)*6 + col) > 0
                flash_sequence{row,col} = flash_sequence_regular{row,col};
            else
                flash_sequence{row,col} = ' ';
            end
            if flashboard_matrix_else((row-1)*6 + col) > 0
                flash_sequence_else{row,col} = flash_sequence_regular{row,col};
            else
                flash_sequence_else{row,col} = ' ';
            end
        end
      end
      