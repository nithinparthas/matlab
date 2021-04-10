function [unmask_decoded_word, tot_word_comp] = get_decoded_word(word_list, tot_word_comp, word_array, decoded)

    length_word_list = length(word_list);
    unmask_decoded_word = '';
    
    if strcmp(decoded,word_array(1)) && length_word_list >= 6
        unmask_decoded_word = word_list(length_word_list-5);
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(2)) && length_word_list >= 5
        unmask_decoded_word = word_list(length_word_list-4);
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(3)) && length_word_list >= 4
        unmask_decoded_word = word_list(length_word_list-3);
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(4)) && length_word_list >= 3
        unmask_decoded_word = word_list(length_word_list-2);
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(5)) && length_word_list >= 2
        unmask_decoded_word = word_list(length_word_list-1);
        tot_word_comp = tot_word_comp + 1;
    elseif strcmp(decoded,word_array(6)) && length_word_list >= 1
        unmask_decoded_word = word_list(length_word_list);
        tot_word_comp = tot_word_comp + 1;
    end
end