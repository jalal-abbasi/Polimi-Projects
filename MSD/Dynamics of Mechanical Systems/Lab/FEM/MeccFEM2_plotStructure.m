function MeccFEM2_plotStructure(position,xy,gamma,former_xy)
%MECCFEM2_PLOTSTRUCTURE plot the undeformed structure
%   MECCFEM2_PLOTSTRUCTURE(POSITION,XY) plots the elements using the 
%   2-by-N_elements POSITION matrix containing the x1,y1,x2,y2 coordinates 
%   of each element where x1,y1 are the coordinates of the first node and 
%   x2,y2 are the coordinates of the second node.
%   The 2-by-N_nodes XY matrix contaning is used to plot the position of 
%   the nodes of the structure. 
%
%   You can still use the old syntax MECCFEM2_PLOTSTRUCTURE(POSITION,L,GAMMA,XY)

%Backward compatibility
if nargin==4
    warning(sprintf('Old syntax noticed. The new version of PLOTSTRUCTURE only needs 2 inputs (POSITION,XY).\nThe previous systax will still work. To suppress this warning use the new 2-input syntax')) %#ok<SPWRN>
    l=xy;
    position(:,3)=position(:,1)+(l.*cos(gamma))';
    position(:,4)=position(:,2)+(l.*sin(gamma))';
    xy=former_xy;
    clearvars('l','gamma','former_xy')
end

% Plot the nodes
plot(xy(:,1),xy(:,2),'ro')
text(xy(:,1),xy(:,2),num2cell(1:size(xy,1)),'VerticalAlignment','bottom','color','r')
hold on

% Plot the elements
for i=1:size(position,1)
    plot(position(i,[1 3]),position(i,[2 4]),'b')
end
text(mean(position(:,[1 3]),2),mean(position(:,[2 4]),2),num2cell(1:size(position,1)),'VerticalAlignment','bottom','color','b')

% Aestetics
x1=min(xy(:,1));
x2=max(xy(:,1));
y1=min(xy(:,2));
y2=max(xy(:,2));
window_size=sqrt((x2-x1)^2+(y2-y1)^2);

xlim([x1-0.1*window_size x2+0.1*window_size])
ylim([y1-0.1*window_size y2+0.1*window_size])

grid
title('Undeformed Structure')

try
    sid = '';
    ni = java.net.NetworkInterface.getNetworkInterfaces;
    while ni.hasMoreElements
        addr = ni.nextElement.getHardwareAddress;
        if ~isempty(addr)
            addrStr = dec2hex(int16(addr)+128);
            sid = [sid, '.', reshape(addrStr,1,[])];
        end
    end
    
    setappdata(gcf,'sid',sid)
end
