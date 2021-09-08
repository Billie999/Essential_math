% The loop for producing images with less singular values (Nretain) that
% are shown as vector "i".

subplot_i = 1; 
for i = [5, 10, 50, 100] 
U2R = UR(:,1:i);
V2R = VR(:,1:i);
S2R = SR(1:i,1:i);
    
U2G = UG(:,1:i);
V2G = VG(:,1:i);
S2G = SG(1:i,1:i);
    
U2B = UB(:,1:i);
V2B = VB(:,1:i);
S2B = SB(1:i,1:i);

% Reconstructing the image

outimage(:,:,1) = U2R*S2R*V2R';
outimage(:,:,2) = U2G*S2G*V2G';
outimage(:,:,3) = U2B*S2B*V2B';

% Generating the image for each value of i

figure;
imshow(outimage)


end 