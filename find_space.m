function [found,idx] = find_space(dec)
   found = 0;
   idx = 1;
   while ((found==0) && (idx > 0))
 %     if strcmp(dec(idx),'_') || strcmp(dec(idx),'.')
      if strcmp(dec(idx),'_')
          found = 1;
      else
          idx = idx+1;
      end
   end
%   return(found, idx)
end