
function [cword, cword_eos, eos_flag] = get_words(dec)

   if length(dec) == 0
       cword = '';
   else
       cword = '';
       [found, idx] = find_space(dec);
       if found
         if length(dec) >= idx
            cword = dec(1:idx);
         end
       else
         if length(dec) > 0
            cword = dec(1:end);
         end
       end
   end
   cword_eos = cword;
   eos_flag = 0; % Next few lines is to find '.' and swap '_' and '.' as per Dr. Speier comment
   if strcmp(cword(end),'_') == 1
     if strcmp(cword(end-1),'.') == 1
         eos_flag = 1;
         cword = cword(1:end-1);
         cword(end) = '_';
     end
   end
end
       