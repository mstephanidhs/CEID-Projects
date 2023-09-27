function y = sourceB()
    img = load ("cameraman.mat");
    img = img.i;
    y = img(:);
    y = (y-128)/128;   
end

