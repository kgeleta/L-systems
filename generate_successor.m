function [ result ] = generate_successor(string, productions)
% predecessor - character array
% productions - map object: {char, char_array}
    
    result = '';
    for i = 1:length(string)
        predecessor = string(i);
        if(productions.isKey(predecessor))
            result = strcat(result, productions(predecessor));
        else
            result = strcat(result, predecessor);
        end
    end
end