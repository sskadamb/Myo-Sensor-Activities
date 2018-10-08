function data_csv = DataFormatter(filepath_cellarray)
%DATAFORMATTER Summary of this function goes here
%   Detailed explanation goes here
prev = 0;
for x = filepath_cellarray
    fpc = string(x);
    t1 = csvread(fpc,1,1); % get rid of the timestamp column 
    if prev == 0
        prev = t1;
    else
        %now vertcat with the previous t1(and all data):
        prev = vertcat(prev, t1);
    end 
end
data_csv = prev;
