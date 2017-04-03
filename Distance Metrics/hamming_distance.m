function [ d2 ] = hamming_distance( XI, XJ )

[rows, ~] = size(XJ);
d2 = zeros(rows, 1);


for i=1:rows
    difference = XI - XJ(i,:);
    d2(i) = sum(difference(:) == 0);
end

end