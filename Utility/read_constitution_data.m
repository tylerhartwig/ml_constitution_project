function [ data, header, countries ] = read_constitution_data( varargin )

xls_file_path = './A_C_M_Finalized.xlsx';
csv_file_path = './constitution.csv';

fid = fopen(csv_file_path);
read_line = fgetl(fid);
header_line = read_line;

% Read out header values of converted to CSV file 
header_cell = textscan(strrep(header_line, ',', ' '), '%s');
header_values = [];
for i=1:length(header_cell) 
    header_values = [header_values string(header_cell{i,1})];
end

countries = [];
read_line = fgetl(fid);
while ischar(read_line)
    values = textscan(read_line, '%*d %q %*[...]', 'Delimiter', ',');
    countries = [countries; values{1,1}];
    read_line = fgetl(fid);
end
fclose(fid);


% Find which indexes function requires
idx = ismember(header_values, varargin);
header = header_values(idx);

% Return values requested 
data_values = xlsread(xls_file_path);
data = data_values(:,idx);
end

