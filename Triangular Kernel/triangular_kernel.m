

data = input('number of samples: ','s');
n = str2double(data);

samples = zeros(n,1);


for i=1:n
    X = ['sample ',num2str(i),' :'];
    data = input(X,'s');
    samples(i,1) = str2double(data);
end

area_each_triangle = 1 / n;

data = input('enter base: ','s');
base_each_triangle = str2double(data);

height_each_triangle = 2 * area_each_triangle / base_each_triangle;

data = input('density sample: ','s');
density_sample = str2double(data);

half_base = base_each_triangle / 2;

start_base = density_sample - half_base;
end_base = half_base + density_sample;

density_probability = 0;

for i=1:n
    if(samples(i,1) > start_base && samples(i,1) < density_sample)
        density_probability = density_probability + ((samples(i,1)-start_base) * height_each_triangle / half_base);
    
    elseif(samples(i,1) > density_sample && samples(i,1) < end_base)
            density_probability = density_probability + ((end_base-samples(i,1)) * height_each_triangle / half_base);
    elseif(samples(i,1) == density_sample)
        density_probability = density_probability + height_each_triangle;
    end
    
end

fprintf('Probability Density: %f\n',density_probability);

    
    
    
    