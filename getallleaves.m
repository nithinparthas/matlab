function [word_list, prob_list] = getallleaves(trie, startnode)

  [iterator] = depthfirstiterator(trie,startnode);
  if ~isempty(iterator)
    allFreq = trie.Freq(iterator); % Non zero Frequency values
    allWord = trie.Word(iterator);
    nzFreq = find(allFreq);
    word_list  = allWord(nzFreq);
    [prob_list, p_order] = sort(allFreq(nzFreq),'Descend');    
    word_list = word_list(p_order);
    prob_list = prob_list/sum(prob_list);
  end 
end