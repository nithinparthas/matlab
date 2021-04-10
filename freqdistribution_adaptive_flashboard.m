function [adap_flashboard] = freqdistribution_adaptive_flashboard(flashboard_choice, charset, pr)

rv_vector = zeros(1,18);
[sorted_pr, idx] = sort(pr, 'descend');
for jj=1:36
    sorted_charset(jj) = charset(idx(jj));
end

idx = arrayfun(@(x)find(charset==x,1),sorted_charset);

if (flashboard_choice == 1) 
    for jj=1:6
      for kk = 1:6
         adap_flashboard{jj,kk} = charset(idx(6*(jj-1) + kk));
%         adap_flashboard{jj+6,kk} = charset(idx(jj + 6*(kk-1)));
      end
    end

elseif (flashboard_choice == 4)
   
    for jj=1:6
         adap_flashboard{jj,jj} = charset(idx(jj));
    end
    for jj=2:6
         adap_flashboard{jj-1,jj} = charset(idx(jj+5));
    end
    for jj=2:6
         adap_flashboard{jj,jj-1} = charset(idx(jj+10));
    end   
    for jj=3:6
         adap_flashboard{jj-2,jj} = charset(idx(jj+14));
    end
    for jj=3:6
         adap_flashboard{jj,jj-2} = charset(idx(jj+18));
    end
    for jj=4:6
         adap_flashboard{jj-3,jj} = charset(idx(jj+21));
    end
    for jj=4:6
         adap_flashboard{jj,jj-3} = charset(idx(jj+24));
    end
    adap_flashboard{1,5} = charset(idx(31));
    adap_flashboard{2,6} = charset(idx(32));
    adap_flashboard{5,1} = charset(idx(33));
    adap_flashboard{6,2} = charset(idx(34));
    adap_flashboard{1,6} = charset(idx(35));
    adap_flashboard{6,1} = charset(idx(36));
%     for jj = 1:6
%       for kk=1:6
%         adap_flashboard{jj+6,kk} = adap_flashboard{kk,jj};
%       end
%     end
end



end
