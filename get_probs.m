
function [pr, word_list] = get_probs(trie, word_predict_mode, word_complete_technique, pword, lword, repeat, wrong_last_char, mask_wrong_last_char, STIMULUS_THRESHOLD, smoothing_method, charset, bspace_prob, verbose, word_model, biword_model, trigram_model, ...
                                     charno, f_idx, f_pword, f_lword, f_w1, f_w1_pr, f_w2, f_w2_pr, f_w3, f_w3_pr, f_w4, f_w4_pr, f_w5, f_w5_pr, f_w6, f_w6_pr, f_wcomp_read, depth)
      

        totalchar = length(charset);
        if length(pword) > 0       % Take out the "_" from the previous word last character if present
           if strcmp(pword(end),'_') == 1 
               pword = pword(1:end-1);
           end
        end
        pr = zeros(totalchar,1);
        if (smoothing_method == 0)% No smoothing
            pr = no_smooth(word_model, biword_model, trigram_model, charset, lword, pword);
        elseif (smoothing_method == 1) % Laplacian
            pr = smooth_laplacian(word_model, biword_model, charset, lword, pword);
        elseif (smoothing_method == 2) %Kneyer Neyes (KN) smoothing
            pr = smooth_kn(word_model, biword_model, trigram_model, charset, lword, pword);
        elseif (smoothing_method == 3) %Interpolative smoothing
            pr = smooth_interp(word_model, biword_model, trigram_model, charset, lword, pword);
        elseif (smoothing_method == 4) %Witten-Bell smoothing
            pr = smooth_witten_bell(word_model, biword_model, trigram_model,charset,lword, pword);
        elseif (smoothing_method == 5) %Stupid backoff smoothing
            pr = smooth_stupid_backoff(word_model, biword_model, trigram_model, charset, lword, pword);
        elseif (smoothing_method == 6) %Absolute discounting
            pr = smooth_abs_discount(word_model, biword_model, trigram_model, charset, lword, pword);            
        end % end of if (smoothing)
        
        if sum(pr) > 0 % Normalize probabilities to 1
            pr = pr/sum(pr);
        end

        if (length(lword) > 20)
            fprintf("WARNING: Long word, length=%d lword=%s\n", length(lword), lword);
        end
        pr(35) = bspace_prob; %Probability of backspace
        end_of_sent = 0;
        if length(lword) > 0
           if strcmp(lword(end),'.') == 1 
               end_of_sent = 1;
           end
        end
        if end_of_sent == 1   % If the last char is a '.', next is a '_' with high probability (not 1). If you use
                              % it can get stuck when there is  a wrong
                              % decoding of '.'
 %           pr = zeros(length(charset),1);
 %           pr(36) = 1.0;
  %          pr(35) = 0;
            pr(34) = 0;
            pr(36) = 0.5;
        elseif repeat == 0
            pr(34)=0.0482*pr(36); % Following Dr. Speier's email about 4.8% of word spaces are sentence endings.
            pr(36)=0.9518*pr(36);  % Rest are word spaces            
        end

%        if repeat == 0
        word_list = [];
        if word_predict_mode
           word_pr = zeros(10,1);

           if word_complete_technique == 2 && f_wcomp_read == 1 % Read from file
               
               %---------------
             idx = find(f_idx==charno);
             if ~isempty(idx)
                 cmp1_word = f_pword(idx);
                 cmp1 = 0;
                 if length(pword) > 0
                    cmp1 = strcmp(cmp1_word, pword);
                 elseif strcmp(cmp1_word, '*') && length(pword) == 0
                    cmp1 = 1;
                 end
                 cmp2_word = f_lword(idx);
                 cmp2 = 0;
                 if length(lword) > 0
                    cmp2 = strcmp(cmp2_word, lword);
                 elseif strcmp(cmp2_word, '*') && length(lword) == 0
                    cmp2 = 1;
                 end
             end
             if isempty(idx) || (cmp1 == 0) || (cmp2 == 0)
                  if ~isempty(pword)
                     if (end_of_sent == 0)
                        [word_list, word_pr] = djikstra(word_model, biword_model, trigram_model, word_pr, lword, end_of_sent, pword, charset,depth);
                     end
                  end
             else
                  word_list = [f_w1(idx) f_w2(idx) f_w3(idx) f_w4(idx) f_w5(idx) f_w6(idx)];
                  word_pr = [f_w1_pr(idx) f_w2_pr(idx) f_w3_pr(idx) f_w4_pr(idx) f_w5_pr(idx) f_w6_pr(idx)];
             end
           elseif word_complete_technique == 2  % No file read    
             [word_list, word_pr] = djikstra(word_model, biword_model, trigram_model, word_pr, lword, end_of_sent, pword, charset, depth);
           elseif word_complete_technique == 1
             [word_list, word_pr] = find_autocomplete_word(biword_model, trie, word_pr, lword, end_of_sent, pword); 
             elseword_p
             [word_list, word_pr] = SearchLeafNodes(biword_model, end_of_sent, charset, lword, pword);
           end
           if length(word_list) > 0
             word_pr = word_pr(1:length(word_list));
           end
           idxx = find(word_pr > 0); % Get rid of values which have 0 probability
           word_pr = word_pr(idxx);
           word_list = word_list(idxx);
%            if sum(word_pr) > 0
%               word_pr = (word_pr/sum(word_pr))* 1.0;
%            end
           if isempty(word_list)
              if sum(pr) > 0
                 pr = pr/sum(pr);
              end
           else
              if sum(pr) > 0
                 pr = (pr/sum(pr));
              end
              word_pr = (word_pr/sum(word_pr))*0.5; % Scale word_pr to 0.5
           end
           
           pr = pr * (1 - sum(word_pr(1:length(word_list))));
           
           if repeat == 1
              if mask_wrong_last_char == 1                
                 if ~isempty(wrong_last_char)
                     word_pr = (1/length(charset)) * ones(length(word_list),1);
                     pr = (1/length(charset)) * ones(length(charset),1);
                 end
              end
           end

           if ~isempty(word_list)
             for idx = 1: length(word_list)
%                pr(34-length(word_list)-1 + idx) = word_pr(length(word_list)-idx+1);
                pr(34-length(word_list)-1 + idx) = word_pr(idx);
             end
%             word_list = flip(word_list);
           end
        
        else
            if repeat == 1
             if mask_wrong_last_char == 1                
                 if ~isempty(wrong_last_char)
                  %  pr(find(charset == wrong_last_char, 1)) = 1-STIMULUS_THRESHOLD;
                     pr = (1/length(charset)) * ones(length(charset),1);
                 end
             end
           end           
            
        end
% In above lines, character_probability = 1 - word_probability;


        if sum(pr) > 0
           pr = pr/sum(pr);
        end
        if pr < 0
            fprintf("WARNING: NEGATIVE PROBABILITY");
        end
     
      end