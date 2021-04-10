function print_words_tofile(verbose, i, f_wcomp, f_wcomp_write, go_back, repeat, word_list, pr, pword, lword, curr_word)     

         if f_wcomp_write == 1 && go_back == 0 && repeat == 0    % Write only when it's not a word error or backspace
              if length(pword) == 0   % Just to identify empty characters
                  pword = '*';
              elseif strcmp(pword(end),'_')
                  pword = pword(1:end-1);
              end
              if length(lword) == 0
                  lword = '*';
              elseif strcmp(lword(end),'_')
                  lword = lword(1:end-1);
              end
              
              fprintf(f_wcomp, "%d %s %s ", i, pword, lword);
              if length(word_list) > 0
                for zz=1:length(word_list)
                  fprintf(f_wcomp, "%s %1.3e ", cell2mat(word_list(zz)), pr(33 - length(word_list) + zz));
                end
              end
              fprintf(f_wcomp, "\n");
         end
         if verbose    
           fprintf("%s  %s  %s \n", curr_word, pword, lword);
           for zz=1:length(word_list)
               fprintf("%s %1.1e ", cell2mat(word_list(zz)), pr(33 - length(word_list) + zz));
           end
           fprintf(" sum=%0.2f \n", sum(pr(33-length(word_list)+1:33)));
         end
end