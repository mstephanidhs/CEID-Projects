x = sourceB();

for N = [2, 4]
    % execute the LloydMax function
    [Xq, centers, D] = LloydMax(x, N, -1, 1);

    img = centers(Xq);
    img = 128*img + 128;
    image = reshape(img, 256, 256);
    imshow(uint8(image));
	caption = sprintf('Image for N=%s', num2str(N));
	title(caption, 'FontSize', 14);
	drawnow;

end

