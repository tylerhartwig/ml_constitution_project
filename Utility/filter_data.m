function [ filtered_data ] = filter_data( data )

[rows, cols] = size(data);

to_remove = [];

for i=1:cols
    col = data(:,i);
    bad_idx = isnan(col);
    

    
    if bad_idx == ones(rows,1) 
        to_remove = [to_remove i];
    else
        data(bad_idx, i) = 99;
    end
end

data(:,to_remove) = [];

filtered_data = data;
end

