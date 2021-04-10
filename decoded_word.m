
function decoded_word, tot_word_comp = get_decoded_word(word_list, tot_word_comp, word_array)

    length_word_list = length(word_list);
    if strcmp(decoded,word_array(1)) && length_word_list >= 6
        decoded_word = cell2mat(word_list(length_word_list-5));
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(2)) && length_word_list >= 5
        decoded_word = cell2mat(word_list(length_word_list-4));
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(3)) && length_word_list >= 4
        decoded_word = cell2mat(word_list(length_word_list-3));
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(4)) && length_word_list >= 3
        decoded_word = cell2mat(word_list(length_word_list-2));
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(5)) && length_word_list >= 2
        decoded_word = cell2mat(word_list(length_word_list-1));
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(6)) && length_word_list >= 1
        decoded_word = cell2mat(word_list(length_word_list));
        tot_word_comp = tot_word_comp + 1;
    end
    
end