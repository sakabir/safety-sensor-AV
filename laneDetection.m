
    function laneDetection(cameraImage)

    grayImage = rgb2gray(cameraImage);

    smoothedImage = imgaussfilt(grayImage, 3);

    edges = edge(smoothedImage, 'Canny');

    [H, T, ~] = hough(edges);

  
    peaks = houghpeaks(H, 10);

    lines = houghlines(edges, T, peaks);

    figure;
    imshow(cameraImage);
hold on;
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'r');
    end

    hold off;
    title('Lane Detection');
end
    