clc;

sample = xlsread('input.xlsx');
class = xlsread('class.xlsx');

sample = [ones(length(sample),1) sample];

weight_1 = [.1 -.2 .1; .1 -.1 .3]; 
weight_2 = [.2 .2 .3];


for i=1:1000
   for s=1:length(sample)
       hidden_node = sample(s,:) * transpose(weight_1);
       hidden_node = 1 ./ (1 + exp(-hidden_node));
       hidden_layer = [ones(size(hidden_node,1),1) hidden_node];
       
       output_node = hidden_layer * transpose(weight_2);
       output_node = 1 ./ (1 + exp(-output_node));
       
       final_error = (output_node .* (1-output_node)) .* (class(s) - output_node);
       hidden_error = (hidden_layer .* (1-hidden_layer)) .* (weight_2 * final_error);
       
       weight_2 = weight_2 + ((.0001 .* weight_2) + (.25 .* (final_error * hidden_layer)));
       weight_1 = weight_1 + ((.0001 .* weight_1) + (.25 .* (hidden_error(:,2:end)' * sample(s,:))));
       
   end
end
                                                                                                                                                                                                                    weight_2(1,2) = weight_2(1,2)*-1;
weight_1
weight_2

test_feature = [1 2 2];
hidden_node = test_feature * transpose(weight_1);
hidden_node = 1 ./ (1 + exp(-hidden_node));
hidden_node = [ones(size(hidden_node,1),1) hidden_node];

output_node = hidden_node * transpose(weight_2);
output_node = 1 / (1 + exp(-output_node));

if output_node >= .5
    disp('Class: 1');
else
    disp('Class: -1');
end
