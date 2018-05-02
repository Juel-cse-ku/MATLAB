function bp = bp_sigmoid_value(v)
bp = 1 ./ (1 + exp(-v));
end