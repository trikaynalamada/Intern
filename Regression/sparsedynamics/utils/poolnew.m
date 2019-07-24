function yout = poolnew(yin,nVars,polyorder,usesine)
% Copyright 2015, All Rights Reserved
% Code by Steven L. Brunton
% For Paper, "Discovering Governing Equations from Data: 
%        Sparse Identification of Nonlinear Dynamical Systems"
% by S. L. Brunton, J. L. Proctor, and J. N. Kutz

n = size(yin,1);
% yout = zeros(n,1+nVars+(nVars*(nVars+1)/2)+(nVars*(nVars+1)*(nVars+2)/(2*3))+11);

ind = 1;
% poly order 0
yout(:,ind) = ones(n,1);
ind = ind+1;
% 


if(polyorder>=1)
    for i=1:nVars
        yout(:,ind) = (yin(:,i));
        ind = ind+1;
    end
end

% if(polyorder>=1)
%     for i=1:nVars
%         yout(:,ind) = exp(yin(:,i));
%         ind = ind+1;
%     end
% end



if(polyorder>=2)
    % poly order 2
    for i=1:nVars
        for j=i:nVars
            yout(:,ind) = yin(:,i).*yin(:,j);
            ind = ind+1;
        end
    end
end

if(polyorder>=3)
    % poly order 3
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                yout(:,ind) = yin(:,i).*yin(:,j).*yin(:,k);
                ind = ind+1;
            end
        end
    end
end














%poly order 1

% if(polyorder>=1)
%     
%         yout(:,ind) = (1./(yin(:,1)));
%         ind = ind+1;
%     
% end
% 
% if(polyorder>=1)
%     
%         yout(:,ind) = (yin(:,2)./(1+yin(:,1)+yin(:,i)));
%         ind = ind+1;
%         
% 
% end




% if(polyorder>=2)
%     % poly order 4
%     for i=1:nVars
%         
%                     yout(:,ind) = ((1./((1+(yin(:,i).^5)))));
%                     ind = ind+1;
%               
%     end
% end
% 
% 











% if(polyorder>=1)
%     for i=1:nVars
%         yout(:,ind) = exp(-yin(:,i)./(1+yin(:,i))).*(1./(1+yin(:,i).^1.29));
%         ind = ind+1;
%     end
% end

% if(polyorder>=1)
%     
%         yout(:,ind) = (yin(:,1)./(1+yin(:,2)));
%         ind = ind+1;
%     
% end
% 
% if(polyorder>=1)
%     
%         yout(:,ind) = (yin(:,1)./(1+yin(:,3).^1.29));
%         ind = ind+1;
%     
% end



% if(polyorder>=2)
%     % poly order 2
%     for i=1:nVars
%         for j=i:nVars
%             yout(:,ind) = ((1./((yin(:,i).*yin(:,j)))));
%             ind = ind+1;
%         end
%     end
% end

% if(polyorder>=2)
%     % poly order 2
%     for i=1:nVars
%         for j=i:nVars
%             yout(:,ind) = ((yin(:,i)./((1+yin(:,i).*yin(:,j)))));
%             ind = ind+1;
%         end
%     end
% end
% 



% 
% if(polyorder>=2)
%     % poly order 2
%     for i=1:nVars
%         for j=i:nVars
%             yout(:,ind) = ((1./((1+yin(:,i)+(yin(:,i).*yin(:,j))))));
%             ind = ind+1;
%         end
%     end
% end
% 
% if(polyorder>=2)
%     % poly order 2
%     for i=1:nVars
%         for j=i:nVars
%             yout(:,ind) = ((yin(:,i)./((1+yin(:,i)+yin(:,i).*yin(:,j)))));
%             ind = ind+1;
%         end
%     end
% end


% if(polyorder>=3)
%     % poly order 3
%     for i=1:nVars
%         for j=i:nVars
%             for k=j:nVars
%                 yout(:,ind) = ((1./((1+yin(:,i).*yin(:,j).*yin(:,k)))));
%                 ind = ind+1;
%             end
%         end
%     end
% end

if(polyorder>=4)
    % poly order 4
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                for l=k:nVars
                    yout(:,ind) = ((1./((1+yin(:,i).*yin(:,j).*yin(:,k).*yin(:,k)))));
                    ind = ind+1;
                end
            end
        end
    end
end




if(polyorder>=4)
    % poly order 4
    for i=1:nVars
        for j=i:nVars
            for k=j:nVars
                for l=k:nVars
                    yout(:,ind) = ((yin(:,i)./((1+yin(:,i).*yin(:,j).*yin(:,k).*yin(:,k)))));
                    ind = ind+1;
                end
            end
        end
    end
end



% if(polyorder>=4)
%     % poly order 4
%     for i=1:nVars
%         for j=i:nVars
%             for k=j:nVars
%                 for l=k:nVars
%                     yout(:,ind) = ((yin(:,1)./((1+yin(:,i).*yin(:,j).*yin(:,k).*yin(:,k)))));
%                     ind = ind+1;
%                 end
%             end
%         end
%     end
% end
% 







% 
% if(polyorder>=5)
%     % poly order 5
%     for i=1:nVars
%         for j=i:nVars
%             for k=j:nVars
%                 for l=k:nVars
%                     for m=l:nVars
%                         yout(:,ind) = yin(:,i).*yin(:,j).*yin(:,k).*yin(:,l).*yin(:,m);
%                         ind = ind+1;
%                     end
%                 end
%             end
%         end
%     end
% end

if(usesine)
    for k=1:10;
        yout = [yout sin(k*yin) cos(k*yin)];
    end
end