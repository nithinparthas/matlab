function is_attended = find_if_attended(word_predict_mode, word_array, word_list, curr_word, flashboard_choice, rv, flash_scheme, flash_sequence, answer)
   
    is_present1 = 0;
    is_present2 = 0;
    is_present3 = 0;
    is_present4 = 0;
    is_present5 = 0;
    is_present6 = 0;    
    is_attended = 0;
    is_attended1 = 0;
    is_attended2= 0;
    is_attended3 = 0;
    is_attended4 = 0;
    is_attended5 = 0;
    is_attended6 = 0;    
    is_attended = 0;

    word_in_word_list = 0;
    
    if (word_predict_mode == 1)
      if ~isempty(word_list)
        word_in_word_list = sum(ismember(word_list, curr_word));
        %word_array = word_array(length(word_array)-length(word_list)+1:length(word_array));
        if word_in_word_list == 1
            is_present1 = sum(sum(ismember(flash_sequence,word_array(1)))); 
            is_present2 = sum(sum(ismember(flash_sequence,word_array(2))));
            is_present3 = sum(sum(ismember(flash_sequence,word_array(3))));
            is_present4 = sum(sum(ismember(flash_sequence,word_array(4))));
            is_present5 = sum(sum(ismember(flash_sequence,word_array(5))));
            is_present6 = sum(sum(ismember(flash_sequence,word_array(6))));
        end
        
      end   
    end
    
    length_word_list = length(word_list);
    
    if is_present1==1 && length_word_list >= 6
        decoded_word = cell2mat(word_list(length_word_list-5));
        is_attended1 =  strcmp(decoded_word, curr_word);
    end
    if is_present2==1 && length_word_list >= 5
        decoded_word = cell2mat(word_list(length_word_list-4));
        is_attended2 = strcmp(decoded_word, curr_word); 
    end
    if is_present3==1 && length_word_list >= 4
        decoded_word = cell2mat(word_list(length_word_list-3));
        is_attended3 =  strcmp(decoded_word, curr_word);
    end
    if is_present4==1 && length_word_list >= 3
        decoded_word = cell2mat(word_list(length_word_list-2));
        is_attended4 =  strcmp(decoded_word, curr_word);
    end
    if is_present5==1 && length_word_list >= 2
        decoded_word = cell2mat(word_list(length_word_list-1));
        is_attended5 =  strcmp(decoded_word, curr_word);
    end
    if is_present6==1 && length_word_list >= 1
        decoded_word = cell2mat(word_list(length_word_list));
        is_attended6 =  strcmp(decoded_word, curr_word);
    end
    
    if word_in_word_list == 1
        is_attended = is_attended1 | is_attended2 | is_attended3 | is_attended4 | is_attended5 | is_attended6;
    elseif word_in_word_list == 0  || word_predict_mode == 0 % Attended Word blocks attended character
        
     %   if (adaptive_flashboard == 1) % If adaptive flashboard then 
            is_attended = sum(sum(ismember(flash_sequence,char(answer))));  
    %    else 
      %      is_attended = sum(ismember(flash_sequence(rv,:),char(answer)));
       % end
    end    
end