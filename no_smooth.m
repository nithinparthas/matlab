function pr = no_smooth(word_model, biword_model, trigram_model, charset, lword, pword)

         totalchar = length(charset);
         pr = zeros(totalchar, 1);
                  
         for charidx=1:totalchar         
             
              nchar = charset(charidx);
              if isempty(lword) == 1
                  trigram_lword_nchar = strcat('__', nchar);
                  trigram_lword = '';
              elseif length(lword) == 1
                  trigram_lword_nchar = strcat('_', lword,nchar);
                  trigram_lword = strcat('__', lword);
              else
                  if length(lword) == 2
                      trigram_lword = strcat('_', lword);
                  else
                      trigram_lword = lword;
                  end
                  trigram_lword_nchar = strcat(lword,nchar);
              end
 %             fprintf("  %s  %s  %s\n", strcat(pword,'_',lword, nchar), strcat(pword,'_',lword), nchar);
              if isKey(biword_model,strcat(pword,'_',lword, nchar)) && isKey(biword_model,strcat(pword,'_',lword))
                  pr(charidx) = biword_model(strcat(pword,'_',lword, nchar))/biword_model(strcat(pword,'_',lword));
              elseif isKey(word_model,strcat(lword,nchar)) && isKey(word_model,lword)
                  pr(charidx) = word_model(strcat(lword, nchar))/word_model(lword);
              elseif isKey(trigram_model,trigram_lword_nchar) && isKey(trigram_model,trigram_lword)
                  pr(charidx) = trigram_model(trigram_lword_nchar)/trigram_model(trigram_lword);
              else
                  pr(charidx) = 0;
              %    pr(charidx) = 1/length(charset);
              end           
         end
end