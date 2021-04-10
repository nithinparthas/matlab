     
function [rv, rv_vector, flash_sequence, flashboard_matrix, adap_flashboard] = flashboard_polling_adaptive_flashboard(j, rv, rv_vector, flashboard_choice, pr, adap_flashboard, flash_scheme, charset)

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
    
      if (j == 1)
         adap_flashboard = freqdistribution_adaptive_flashboard(flashboard_choice, charset, pr); 
      end
      if flash_scheme == 0
             
           if rv == 12
             rv = 1;
           else
             rv = rv + 1;
           end 
      elseif flash_scheme == 1
           if (j == 1)            
             rv_vector = randperm(12); 
             rv = rv_vector(1);
           else
             rv = rv_vector(j);
           end

      end
          
    flash_sequence = {' ',' ',' ',' ',' ',' ';
                      ' ',' ',' ',' ',' ',' ';
                      ' ',' ',' ',' ',' ',' ';
                      ' ',' ',' ',' ',' ',' ';
                      ' ',' ',' ',' ',' ',' ';
                      ' ',' ',' ',' ',' ',' '};
                       
    if rv <= 6
        flash_row = adap_flashboard(rv,:);
    else
        flash_row = adap_flashboard(:,rv-6);
    end
        
          
    for jj=1:6
      for kk = 1:6
         test = flash_sequence_regular{jj,kk};
         if any(strcmp(test,flash_row))==1
             flash_sequence{jj,kk} = test;
             flashboard_matrix(6*(jj-1)+kk) = rv;
         end
       end
    end
end