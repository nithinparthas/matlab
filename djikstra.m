
function [word_list, word_pr] = djikstra(word_model, biword_model, trigram_model, word_pr, lword, end_of_sent, pword, charset, depth)

  len_charset = length(charset)-3;
    

  word_list = string.empty;
  word_pr = [];
  
%  if isempty(pword) && isempty(lword)
  if end_of_sent == 1   % No prediction if end of sentence
  else
    pr = zeros(len_charset,1);
   
    pr = smooth_kn(word_model, biword_model, trigram_model, charset, lword, pword);
    pr_c = smooth_kn_onechar(word_model, biword_model, trigram_model, charset,'_', lword, pword); 
    if length(lword)> 0 && pr_c > 0
       word_list(1) = lword;
       word_pr(1) =  pr_c;
    end
    oldstoreword = strings(1,len_charset);
    newstoreword = strings(1,len_charset);
    oldweight = ones(1,len_charset);
    newweight = ones(1,len_charset);
    for i = 1: len_charset
       oldstoreword(i) = strcat(lword, charset(i));
       newstoreword(i) = '';
       oldweight(i) = pr(i); % Initial weight drawn from smoothed distribution
       chk_word = strcat(lword, charset(i));
       pr_c = 0;
       pr_c = smooth_kn_onechar(word_model, biword_model, trigram_model, charset,'_', chk_word, pword); 
       if oldweight(i)> 0 && pr_c > 0
         if isempty(word_list) 
           word_list(1) = chk_word;
           word_pr(1) =  oldweight(i)*pr_c;
         else
           if ~contains(word_list, chk_word)
              word_list(end+1) = chk_word;
              word_pr(end+1) = oldweight(i)*pr_c;
           end
         end 
       end
    end
    
    maxword = '';
  
    for i = 1: depth-1% depth is the max search depth
      for j = 1: len_charset % Go through all the letters
          maxweight = 0;
          for k = 1: len_charset % Search through all the characters for min weight
             
             pr_c = 0;
             pr_c = smooth_kn_onechar(word_model, biword_model, trigram_model, charset, charset(j), oldstoreword(k), pword);

%              chk_biword = cell2mat([oldstoreword(k) charset(j)]);
%              chk_biword_result = isKey(biword_model,chk_biword)
              
               metric = oldweight(k)*pr_c;
               chk_word = strcat(oldstoreword(k),charset(j));
               if metric > maxweight
                    maxweight = metric;
                    maxword = chk_word;
               end
               pr_c = 0;
               pr_c = smooth_kn_onechar(word_model, biword_model, trigram_model, charset,'_', chk_word, pword);
               if metric > 0 && pr_c > 0
                 if isempty(word_list) 
                   word_list(1) = chk_word;
                   word_pr(1) =  metric*pr_c;
                 else
                   if ~contains(word_list, chk_word )
                      word_list(end+1) = chk_word;
                      word_pr(end+1) = metric*pr_c;
                   end
                 end
               end
          end % end for k = 1:len_charset
          newweight(j) = maxweight;
         % cell2mat(maxword)
          newstoreword(j) = maxword;        
        end % end for j = 1: len_charset
        oldweight = newweight;
        oldstoreword = newstoreword;
      
      end % i = 1: depth
    end  
    [word_pr, idx] = sort(word_pr);
     word_list = word_list(idx);
     
%      if ~isempty(word_list)
%        fprintf(f_wid, "Prev_curr word is %s\n", strcat(pword,'_',lword));
%        for jj=1:min(10, length(word_list))
%           fprintf(f_wid, "%s  %1.2e\n", word_list(end-jj+1), word_pr(end-jj+1));
%        end
%        fprintf(f_wid, "\n");
%      end
 
     if length(word_list) > 5 
          word_list = word_list(end-5:end);
          word_pr = word_pr(end-5:end);
%      if length(word_list) > 0 
%           word_list = word_list(end);
%           word_pr = word_pr(end);
          if word_pr < 0
              fprintf("WARNING, negative probability\n");
          end
     end
     if ~isempty(word_list)
         word_list = strcat(word_list,'_');
     end
end

function outcell = my_mat2cell(inp_string)

    outcell = {};
    char_string = char(inp_string);
    for z=1: length(char_string)
        outcell{end+1} = char_string(z);
    end
end
