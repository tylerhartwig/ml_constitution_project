addpath('./Utility/');
addpath('./Distance Metrics/');
addpath('./Methods/');

fid = fopen('./variables.csv');
variable_string = strrep(fgetl(fid), ',', ' ');
variables_cell = textscan(variable_string, '%s');
variables_request = variables_cell{1};

[data, variables, countries] = read_constitution_data(variables_request{:});

data_filtered = filter_data(data);
[rows, ~] = size(data_filtered);

figure;
Z = linkage(data_filtered);
dendrogram(Z, rows, 'Labels', countries, 'Orientation', 'left');
hold on;
title('Default Dendrogram');

figure;
hamming_Z = linkage(data_filtered, 'complete', { @hamming_distance });
dendrogram(hamming_Z, rows, 'Labels', countries, 'Orientation', 'left');
hold on;
title('Hamming Dendrogram');


% Use Relative distance
basis_countries = {'United States Of America', 'United Kingdom'};
basis_idx = ismember(countries, basis_countries);
countries(basis_idx,:) = [];
relative_Z = relative_distance(data_filtered, basis_idx, @hamming_distance);
dendrogram(relative_Z, rows, 'Labels', countries, 'Orientation', 'left');
hold on;
title('Relative Dendrogram');