    function [child, found] = myTrie_find(trie, child, word)
    
        found = 1;
        for ll=1:length(word)
          if found
            [get_child_node] = getchildren(trie, child);
            if ~isempty(get_child_node)
                node = trie.Node(get_child_node);
                idx  = find(strcmp(word(ll), node));
                if isempty(idx)
                  found = 0;
                else
                  child = get_child_node(idx);
                end
            else
                found = 0;
            end
            
          end
        end
        if isempty(child) 
            found = 0;
        end
    end