

data = input('number of samples: ','s');
n = str2double(data);

samples = zeros(n,1);


for i=1:n
    X = ['sample ',num2str(i),' :'];
    data = input(X,'s');
    samples(i,1) = str2double(data);
end

area_each_rectangle = 1 / n;

data = input('enter base: ','s');
base_each_rectangle = str2double(data);

height_each_rectangle = area_each_rectangle / base_each_rectangle;

data = input('density sample: ','s');
density_sample = str2double(data);

half_base = base_each_rectangle / 2;

start_base = density_sample - half_base;
end_base = half_base + density_sample;

density_probability = 0;

for i=1:n
    if(samples(i,1) > start_base && samples(i,1) < end_base)
        density_probability = density_probability + height_each_rectangle;
    
    end
    
end

fprintf('Probability Density: %f\n',density_probability);

    
    
    
    