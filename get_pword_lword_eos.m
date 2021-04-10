
function  [pword, last, end_of_sent] = get_pword_lword_eos(decoded_string);


        pword = '';
        end_of_sent = 0;
        if (isempty(decoded_string) == 0) % not empty
          last=decoded_string(end);
        else
          last = {'_'};
          end_of_sent = 1;
        end
           
        ii = length(decoded_string);
        done = 0;
        while (ii >= 1) && done == 0
            if (strcmp(decoded_string(ii),'_') == 0) % Decrement until "_" found
               ii = ii - 1;
            else
               done = 1;
            end
            if ii == 1
              lword = decoded_string(1:end);
            else
              lword = decoded_string(ii+1:end);  
            end
        end

        if (iii == 1)
            pword = decoded_string(1:ii-1);
        else
            pword = decoded_string(iii+1:ii-1);
        end
end            