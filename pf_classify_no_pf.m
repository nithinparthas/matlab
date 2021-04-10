function [nStims,rStims, bStims, tot_word_comp, tot_nstims, decoded_string, corrections, total_wcount]=pf_classify_no_pf(word,thresh,nr,nc,targets,corpus_dir,nPart,SUBJECT, verbose)

flash_scheme = 3; % 0: Deterministic, 1: Random, 3: Huffman
flashboard_choice = 4; % 0 is Regular, 1 is Freq. weight, 4: Diagonal 
bspace_prob = 0.05; % Set to 0.05
smoothing_method = 2; % 0: No smoothing, 1: Laplacian, 2: KN smoothing, 3: Interpolative smoothing, 
                      % 4: Witten Bell, 5: Stupic Backoff, 6: Abs Discount
depth = 2; % Djikstra depth of search 
f_wcomp_write = 0;  % Write autocomplete words to file
f_wcomp_read = 1;   % Read autocomplete words from file, NOTE: Both write and read cannot be 1 at the same time
ideal_simulation = 1;  % Set to 1 when generating autocomplete words to speed up simulation, or for quick debug
word_predict_mode = 0; % Set to 1 for predicting words
word_complete_technique = 2; % 0: Based on biword_model only, 1: Based on Trie with new bigram model, 2: Djikstra
Huffman_feedback_threshold = 2; % Huffman scanning requires feedback. It is provided by comparing "prob" to a threshold

STIMULUS_THRESHOLD = thresh; 
MAX_STIMS = 5000; % Threshold to make decision to prevent stimulus growing unbounded
charset = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',...
           'y','z','1','2','3','4','5','6','7','.','9','_'];
word_array = {'2','3','4','5','6','7'};
adap_flashboard = {' ',' ',' ',' ',' ',' ';
                   ' ',' ',' ',' ',' ',' ';
                   ' ',' ',' ',' ',' ',' ';
                   ' ',' ',' ',' ',' ',' ';
                   ' ',' ',' ',' ',' ',' ';
                   ' ',' ',' ',' ',' ',' '};
prev_attended = 0;
model_score_type = 0; % 0: Draw from stored scores randomly, 1: Normal distribution 
corrections = 0;
repeat = 0;
mask_wrong_last_char = 1;
wrong_last_char = '';
inc_word_count = 0;
last_char_in_error = 0;
is_attended_arr = zeros(10,1);

pword = '';

if f_wcomp_write == 1
   f_wcomp = fopen('word_completions.txt','w');
end
[f_idx, f_w1_pr, f_w2_pr, f_w3_pr, f_w4_pr, f_w5_pr, f_w6_pr] = deal([]); % Initialize
[f_pword, f_lword, f_w1, f_w2, f_w3, f_w4, f_w5, f_w6] = deal(''); % Initialize
if f_wcomp_read == 1
   f_wcomp = fopen('word_completions.txt','r');
   PR = textscan(f_wcomp,'%d %s %s %s %f %s %f %s %f %s %f %s %f %s %f', Inf);
   f_idx = PR{1};
   f_pword = PR{2};
   f_lword = PR{3};
   f_w1 = string(PR{4});
   f_w1_pr = PR{5};
   f_w2 = string(PR{6});
   f_w2_pr = PR{7};
   f_w3 = string(PR{8});
   f_w3_pr = PR{9};
   f_w4 = string(PR{10});
   f_w4_pr = PR{11};
   f_w5 = string(PR{12});
   f_w5_pr = PR{13};
   f_w6 = string(PR{14});
   f_w6_pr = PR{15};
   fclose(f_wcomp);
end
[scores00, scores01, scores10, scores11, scores0, scores1, ...
 length_scores00, mean_scores00, std_scores00, ...
 length_scores01, mean_scores01, std_scores01, ...
 length_scores10, mean_scores10, std_scores10, ...
 length_scores11, mean_scores11, std_scores11, ...
 non_Mean, att_Mean, non_SD, att_SD] = get_scores_and_stats(SUBJECT);
    
tot_nstims = 0;
go_back = 0;
decoded_string = [];
cstate = zeros(1,11);
branch_count = 1;
tot_word_comp = 0;
ccount = 1;
corpusdata = load('newmodels.mat');


if word_predict_mode == 1 && word_complete_technique == 1
    load trie.mat;
else
    trie = tree();
end
nLetters = length(word); %number of letters to classify

[rows, cols] = flashboard_row_col(flashboard_choice, targets, nc, nr);
                
rv_vector = zeros(12,1)';
[nStims, rStims, bStims] = deal(zeros(nLetters,1));
answer = zeros(30,1);

i = 1;
char_save = 0;
decoded_word = {};
decoded = '';
unmask_decoded_word = '';
curr_doi_word = '';
curr_doi_word_eos = '';
debug_flag=0;
eos_flag = 0;
total_wcount = 0;

while (i <= nLetters) 
 
  ccount = ccount + length(curr_doi_word); % Increment character count
 % fprintf("ccount is %d DoiWord is %s doiwordlen is %d remaining=%d\n", ccount, curr_doi_word, length(curr_doi_word), length(word(ccount:end)));
  if eos_flag == 0
    [curr_doi_word, curr_doi_word_eos, eos_flag] = get_words(word(ccount:end));
    total_wcount = total_wcount + 1; % Increment total word count
  else
    curr_doi_word = '.';
  end
  repeat = 0;
  kk =1;
  j = 0;
  if strcmp(decoded,'.') == 1
     pword = '';
  else
     pword = decoded_word;
  end
  decoded_word = {};
  decoded = '';
  
  while (kk <= length(curr_doi_word)) || (go_back >= 1) || (repeat == 1) %Loop text through one letter at a time
                                   % Last 2 conditions take care of error
                                   % in last letter 
    fprintf("\n");
    fprintf("DOI_word=%s, Charloc=%d, debug_flag=%d goback=%d rpt=%d\n", curr_doi_word, kk, debug_flag, go_back, repeat)
    if (go_back >= 1)
       answer(kk)= '9';
    elseif (repeat == 1)
       answer(kk)= char(curr_doi_word(kk));
    else
       answer(kk)= char(curr_doi_word(kk));
    end
    fprintf("Target is %s, kk=%d, Ccount is %d\n",char(answer(kk)), kk, ccount);
    last_nStims = 0;
    [pr, word_list] = get_probs(trie, word_predict_mode, word_complete_technique, cell2mat(pword), cell2mat(decoded_word), repeat, wrong_last_char, mask_wrong_last_char, STIMULUS_THRESHOLD,smoothing_method, charset, bspace_prob, verbose, corpusdata.word_model, corpusdata.biword_model, corpusdata.trigram_model, ccount-1+kk, f_idx, f_pword, f_lword, f_w1, f_w1_pr, f_w2, f_w2_pr, f_w3, f_w3_pr, f_w4, f_w4_pr, f_w5, f_w5_pr, f_w6, f_w6_pr, f_wcomp_read, depth);
    print_words_tofile(verbose, ccount-1+kk, f_wcomp, f_wcomp_write, go_back, repeat, word_list, pr, cell2mat(pword), cell2mat(decoded_word), curr_doi_word);
    dist = pr; % Initialize the dist variable
    rv=0;   
    while  (max(dist)<STIMULUS_THRESHOLD) && (last_nStims < MAX_STIMS)  %add stimulus responses until the decision threshold is exceeded
        if (last_nStims >= 25)
           fprintf("LARGE NSTIMS:  Word number %d, Nstims=%d, target=%s\n",i, nStims(i), char(answer(kk)));
        end
        nStims(ccount-1+kk)=nStims(ccount-1+kk)+1;
        last_nStims = last_nStims + 1;

        j = j+1;
        if (flash_scheme == 3) % Huffman Scanning
           [rv, is_attended_arr, flashboard_matrix,flash_sequence, cstate, branch_count] = flashboard_polling_huffman(rv, pr, is_attended_arr, nStims(i), cstate, branch_count);
        else
           [rv, rv_vector, flash_sequence, flashboard_matrix, adap_flashboard] = flashboard_polling_adaptive_flashboard(j, rv, rv_vector, flashboard_choice, pr, adap_flashboard, flash_scheme, charset);
        end
        j=mod(j,12);  

        is_attended  = find_if_attended(word_predict_mode, word_array, word_list, curr_doi_word, flashboard_choice, rv, flash_scheme, flash_sequence, answer(kk)); 

        curr_attended = is_attended;
        score = get_response(curr_attended, prev_attended, model_score_type, scores00, scores01, scores10, scores11, length_scores00, length_scores01, length_scores10, length_scores11, mean_scores11, std_scores11, mean_scores10, std_scores10, mean_scores01, std_scores01, mean_scores00, std_scores00, ideal_simulation);

        prev_attended = curr_attended; % Update previous attended variable

        prob=normpdf(score,att_Mean,att_SD)/normpdf(score,non_Mean,non_SD); %convert score into probability
        if flash_scheme == 3 % Only for Huffman scheme, to provide feedback
           for res=10:-1:2 % Array of flash results
             is_attended_arr(res) = is_attended_arr(res-1);
           end
           is_attended_arr(1) = 0;
           if (prob >= Huffman_feedback_threshold) % This is only for the Huffman code to move left or right on the tree
               is_attended_arr(1) = 1;
           end
        end
        probs=ones(length(targets),1); %create probability distribution across letters      
        probs(rv == flashboard_matrix)=prob;        
        probs=probs/sum(probs);
        dist = dist.*probs;
        dist = dist/sum(dist);
    end
    
    decoded = targets(find(dist == max(dist), 1)); %get results to this point
%    decoded_word, tot_word_comp = get_decoded_word(word_list, tot_word_comp, word_array, decoded);

    if (go_back >= 1)
        bStims(ccount-1+kk) = bStims(ccount-1+kk) + last_nStims;
    end
    if (repeat == 1)
        rStims(ccount-1+kk) = rStims(ccount-1+kk) + last_nStims;
    end

    word_dec = 0; 
    debug_flag=0;
    if sum(ismember(cell2mat(word_array), decoded)) && (word_predict_mode==1) %First check if it was a word decoding (1,2, 3, 4. 5 or 6)
        length_word_list = length(word_list);
        word_dec = 1;
        if strcmp(decoded,word_array(1)) && length_word_list >= 6
           unmask_decoded_word = word_list(length_word_list-5);
        elseif strcmp(decoded,word_array(2)) && length_word_list >= 5
           unmask_decoded_word = word_list(length_word_list-4);
        elseif strcmp(decoded,word_array(3)) && length_word_list >= 4
           unmask_decoded_word = word_list(length_word_list-3);
        elseif strcmp(decoded,word_array(4)) && length_word_list >= 3
           unmask_decoded_word = word_list(length_word_list-2);
        elseif strcmp(decoded,word_array(5)) && length_word_list >= 2
           unmask_decoded_word = word_list(length_word_list-1);
        elseif strcmp(decoded,word_array(6)) && length_word_list >= 1
           unmask_decoded_word = word_list(length_word_list);
        end
%        [unmask_decoded_word, tot_word_comp] = get_decoded_word(word_list, tot_word_comp, word_array, decoded);
    end
    
    repeat = 0;
    if word_dec == 1 % If word was decoded
       if strcmp(unmask_decoded_word,curr_doi_word) == 0 % Word was decoded but in error
           go_back = go_back + 1;
 %          kk = length(cell2mat(unmask_decoded_word));
           temp_word = cell2mat(unmask_decoded_word);
           decoded_word{end+1} = temp_word(length(decoded_word)+1:length(temp_word));
           debug_flag=1;
       else % Word Decoded correctly
           kk = length(cell2mat(unmask_decoded_word)) + 1;
           decoded_word = unmask_decoded_word;
           debug_flag=2;
           tot_word_comp = tot_word_comp + 1;
       end 
    elseif (strcmp(decoded, '9')==1) && (strcmp(char(answer(kk)),'9')==1) %Backspace correctly decoded
        go_back = max(0, go_back-1);
        if length(decoded_word) >= 1
          if go_back == 0 % Repeat only after all the go_back's are done
            repeat = 1;
          end
          decoded_word = decoded_word(1:end-1);
        end
        debug_flag=3;
    elseif (strcmp(decoded, '9')==1) && (strcmp(char(answer(kk)),'9')==0)  %Backspace was decoded instead of character
        if length(decoded_word) >= 1
          if go_back == 0 % Repeat only after all the go_back's are done
            repeat = 1;
            kk = max(1, kk-1); % Need to reset the target character
          end
        end
        if length(decoded_word) >= 1
          decoded_word = decoded_word(1:end-1);
        end
        debug_flag=4;
    elseif (strcmp(decoded, char(answer(kk)))==0) % Character mismatch
        go_back = go_back + 1;
        decoded_word{end+1} = decoded;
        debug_flag=5;
    else   % Character was decoded correctly
        decoded_word = [decoded_word decoded];
        kk = kk + 1;
        debug_flag=6;
    end

    if word_dec == 1 && word_predict_mode == 1 && f_wcomp_read == 1
 %     unmask_decoded_word
 %     debug_flag
      fprintf("Current DOI word= %s, decoded_word= %s word= %s\n", curr_doi_word, unmask_decoded_word, cell2mat(decoded_word));
    elseif word_dec == 1 && word_predict_mode == 1 
      fprintf("Current DOI word= %s, decoded_word= %s word= %s\n", curr_doi_word, unmask_decoded_word, decoded_word);
    else
      fprintf("Current DOI word= %s, decoded_char= %s word= %s\n", curr_doi_word, decoded, cell2mat(decoded_word));
    end
 
  end
corrections = corrections + repeat;
i = i + length(curr_doi_word);
if strcmp(decoded_word(end),'.')==1 && strcmp(curr_doi_word,'.')==1 && eos_flag == 1
   decoded_string = horzcat(decoded_string, curr_doi_word_eos); % Concatanate word to string
   eos_flag = 0;
elseif eos_flag == 0
   decoded_string = horzcat(decoded_string, decoded_word); % Concatanate word to string
end
end
end

            
        
        
        