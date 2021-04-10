corpusdata = load('newmodels.mat');
charset = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x',...
           'y','z','1','2','3','4','5','6','7','.','9','_'];

       pword = '';
       chk_word = '';
       lword =chk_word;
       chk_char = 'i'; % Not needed for Djikstra
       end_of_sent = 0;
       depth = 3;
       word_pr = zeros(10,1);
       chk_prob = smooth_kn_onechar(corpusdata.word_model, corpusdata.biword_model, corpusdata.trigram_model, charset,chk_char, chk_word, pword); 
       [word_list, word_pr] = djikstra(corpusdata.word_model, corpusdata.biword_model, corpusdata.trigram_model, word_pr, lword, end_of_sent, pword, charset, depth);
       word_list
       word_pr