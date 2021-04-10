
function autocorrect(decoded_string, word, word_model, biword_model, charset)

ii = 1;
start_ii = 1;

corrected_decoded_string = strings(0);
dec_word = '';
prev_word = '';

while (ii < length(word))
     replace_list = strings(0);
     biword_list = strings(0);
     word_list = strings(0);
     word_pr = [];
     biword_pr = [];
     found = 0;
     while (found == 0)
      if ~strcmp(decoded_string(ii),'_')     
         if ii < length(word)
            ii = ii + 1;  
         else
            found = 1;
         end
      else
         found = 1;    
      end
     end
     
     dec_word = decoded_string(start_ii:ii);
     orig_word = word(start_ii:ii);
     ii=ii+1;
     start_ii = ii;

     replace_list =  replace_one_word_char(dec_word, charset, replace_list);
     replace_list(end+1) = cell2mat(dec_word);
   
     chk_dec_status = 1;
     if ~isempty(prev_word)   % Check status of decoded word
          chk_dec_status = isKey(biword_model,strcat(cell2mat(prev_word),'_',dec_word));
     end
     
     for jj = 1:length(replace_list)
        chk_word = replace_list(jj);  
        if isempty(prev_word)
          chk_biword = chk_word;
        else
          chk_biword = strcat(cell2mat(prev_word),'_',chk_word);
        end
        if isKey(biword_model, chk_biword)
              biword_list(end+1) = chk_word;
              biword_pr(end + 1) = biword_model(chk_biword);
        end
        if isKey(word_model, chk_word)
              word_list(end+1) = chk_word;
              word_pr(end + 1) = word_model(chk_word);
        end
     end  
     [biword_pr, idx] = sort(biword_pr);
     biword_list = biword_list(idx);

     [word_pr, idx] = sort(word_pr);
     word_list = word_list(idx); 
     if (chk_dec_status == 0)
          if ~isempty(biword_list)
            fixed_word = char(biword_list(end));
            for zz = 1:length(fixed_word)
               corrected_decoded_string(end+1) = fixed_word(zz);
            end
          end
     else % Could not fix or assuming correct word
          for zz = 1:length(dec_word)
             corrected_decoded_string(end+1) = dec_word(zz);
          end
     end
     prev_word = dec_word(1:end-1);
end
error= 0;
auto_error = 0;
for ii=1:length(word) 
  if ~strcmp(word(ii), decoded_string(ii))
     error = error + 1;
  end
  if ~strcmp(word(ii), corrected_decoded_string(ii))
      auto_error = auto_error + 1;
  end
end
fprintf("Error before correction is %d\n", error);        
fprintf("Error after correction is %d\n", auto_error);    

end

%-------------------------------------------------------------------------------
 
function replace_list =  replace_one_word_char(dec_word, charset, replace_list)
     
    for jj = 1:length(dec_word)
     for kk = 1:length(charset)-2
        if (jj > 1) 
          left = dec_word(1:jj-1); % Partition into left, char and right
          nchar = charset(kk);          
          right = dec_word(jj+1:end);
        elseif jj == 1 
          left = "";
          nchar = charset(kk);          
          right = dec_word(jj+1:end);
        end
        rword = strcat(cell2mat(left), nchar, cell2mat(right));
        if ~strcmp(rword, cell2mat(dec_word))
           replace_list(end+1) = rword;
        end
     end 
    end
end
  