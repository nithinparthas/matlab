function [word_list, word_pr] = find_autocomplete_word(biword_model, trie, word_pr, lword, end_of_sent, pword)



  word_list = [''];
  word_pr = zeros(10,1);
  
  if ~end_of_sent
     biword = strcat(cell2mat(pword),'_',cell2mat(lword));
     [child, found] = myTrie_find(trie, 1, biword);   
  else
     found = 0;
  end
  
  if found
     [word_list, prob_list] = getallleaves(trie, child);   

     for ll = 1:length(word_list)
        biword = strcat(cell2mat(pword),'_',cell2mat(word_list(ll)));
        if isKey(biword_model, biword) 
           if biword_model(biword) < 10
              prob_list(ll) = 0;
           end
        else
           prob_list(ll) = 0;
        end
     end
     idxx = find(prob_list > 0); % Get rid of values which have 0 probability
     prob_list = prob_list(idxx);
     word_list = word_list(idxx);
     
     if length(word_list) >= 4 
        if length(word_list) <= 1000 % Make sure there are few choices so that they are reliable
          word_list = word_list(1:4);
          prob_list = prob_list(1:4);
        else
          word_list = '';
          prob_list = 0;
        end
     else
        word_list = word_list(1:length(word_list));
        prob_list = prob_list(1:length(prob_list));
     end
     
     
     word_list = flip(word_list);
     prob_list = flip(prob_list);
     for zz = 1:length(word_list) % Append _ to the word and put it back
         tempword = cell2mat(word_list(zz));
         tempword(end+1) = '_';
         word_list{zz} = tempword;
     end

     for ll = 1: length(word_list)
        word = cell2mat(word_list(ll));
        
        for mm = 1: length(word) - length(lword)
          
          if mm == 1
            word_pr(ll) = 1;
          end
          new_biword = strcat(cell2mat(pword),'_',word(1:length(lword)+ mm)); % Multiply the transition probabilities
          biword = strcat(cell2mat(pword),'_',word(1:length(lword)+mm-1));

          
          chk_biword_model_new_biword = isKey(biword_model, new_biword);
          chk_biword_model_biword = isKey(biword_model, biword);
          if chk_biword_model_new_biword 
            if chk_biword_model_biword
               word_pr(ll) = word_pr(ll) * biword_model(new_biword)/biword_model(biword);    
            else
               word_pr(ll) = 0;
            end
          else
            word_pr(ll) = 0;
          end
        end
     end
  end
  if ~isempty(word_list)
     word_pr = word_pr(1:length(word_list));
     [word_pr, idx] = sort(word_pr);
     word_list = word_list(idx);
%      for zz = 1: length(word_list)
%          if word_pr(zz) > 0.75
%              word_pr(zz) = 0;
%              word_list(zz) = '';
%          end
%      end
     if sum(word_pr) > 0.9
         word_pr = word_pr * 0.75;
     end
  end
  

end