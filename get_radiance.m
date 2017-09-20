function radiance = get_radiance(image, transmission, atmosphere)

[m, n, ~] = size(image);

rep_atmosphere = repmat(reshape(atmosphere, [1, 1, 3]), m, n);

max_transmission = repmat(max(transmission, 0.1), [1, 1, 3]);

%whos atomosphere
%whos transmission
%whos image
%whos rep_atmosphere
%whos max_transmission
%pause
radiance = ((image - rep_atmosphere) ./ max_transmission) + rep_atmosphere;

end