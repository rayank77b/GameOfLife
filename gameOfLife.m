% game of life
clc;
clear all;

cellcnts = 400;
Ln = zeros(cellcnts);
L = randi([0,1], cellcnts);

%% raender auf null setzen
for ii = 1:cellcnts
    L(1,ii) = 0;
    L(cellcnts, ii) = 0;
    L(ii,1) = 0;
    L(ii,cellcnts) = 0;
end

%%
for jj=1:600
imagesc(L);
disp(['Generation: ', num2str(jj)]);
for ix = 2:cellcnts-1
    for iy = 2:cellcnts-1
        U = L(ix-1:ix+1,iy-1:iy+1); % Umgebung der Zelle 
        s = sum(sum(U)); % summe alle lebenden
        if L(ix,iy) == 0   % falls die Zelle leer ist
            if s == 3
                Ln(ix,iy) = 1;  % erzeugen
            end
        else
            if  s <= 2   % nur ein Nachbar
                Ln(ix,iy) = 0; % dead alone
            elseif s > 4     % zu vielle da
                Ln(ix,iy) = 0; % starvation
            else
                Ln(ix,iy) = 1; % stay alive
            end
        end
    end
end
pause(0.1);
L = Ln;
end



