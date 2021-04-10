function score = get_response(curr_attended, prev_attended, model_score_type, scores00, scores01, scores10, scores11, length_scores00, length_scores01, length_scores10, length_scores11, mean_scores11, std_scores11, mean_scores10, std_scores10, mean_scores01, std_scores01, mean_scores00, std_scores00, ideal_simulation)
    if ideal_simulation == 1 % Override in case this flag is set
        if curr_attended == 1
          score = 1.2;
        else
          score = 0.01;
        end
   elseif (model_score_type == 0)
        if (curr_attended == 1) && (prev_attended == 1)
          score = scores11(randi([1 length_scores11],1,1));          
        elseif (curr_attended == 1) && (prev_attended == 0)
          score = scores10(randi([1 length_scores10],1,1));
        elseif (curr_attended == 0) && (prev_attended == 1)
          score = scores01(randi([1 length_scores01],1,1));
        else   %elseif (curr_attended == 0) && (prev_attended == 0)
          score = scores00(randi([1 length_scores00],1,1));
        end     
     else
        if (curr_attended == 1) && (prev_attended == 1)
          score = normrnd(mean_scores11,std_scores11);          
        elseif (curr_attended == 1) && (prev_attended == 0)
          score = normrnd(mean_scores10,std_scores10);
        elseif (curr_attended == 0) && (prev_attended == 1)
          score = normrnd(mean_scores01,std_scores01);
        else   %elseif (curr_attended == 0) && (prev_attended == 0)
          score = normrnd(mean_scores00,std_scores00);
        end  
     end
     
    
     