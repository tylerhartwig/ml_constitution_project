function [ Z ] = relative_distance( data, basis, distance_function )

basis_data = data(basis,:);
[basis_rows, ~] = size(basis_data);
data(basis,:) = [];
[data_rows, ~] = size(data);

new_data = zeros(data_rows, basis_rows);

for i=1:basis_rows
    distances = distance_function(basis_data(i,:), data);
    new_data(:,i) = distances;
end

Z = linkage(new_data);

end

