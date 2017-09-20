function [ A ] = make_A( I,win_size )

dark_channel = get_dark_channel(I, win_size);
A = get_atmosphere(I, dark_channel);

end

