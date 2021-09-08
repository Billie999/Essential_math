
function slope = findSlope(x,y)

coeffs = polyfit(x,y,1);

slope = coeffs(1);

end