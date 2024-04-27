% Assuming H, R, and x are cell arrays of matrices/vectors
H = cell(1, 129);  % Replace with your actual cell array of H matrices
R = cell(1, 129);  % Replace with your actual cell array of R matrices
x = cell(1, 129);  % Replace with your actual cell array of x vectors

% Number of terms in the summation
n = 129;

% Initialize the summation terms
sum_HtRiH = zeros(size(H{1}));
sum_HtRiX = zeros(size(x{1}));

% Compute the summation terms
for i = 1:n
    % Compute the current term
    term_HtRiH = H{i}' * inv(R{i}) * H{i};
    term_HtRiX = H{i}' * inv(R{i}) * x{i};
    
    % Update the summation terms
    sum_HtRiH = sum_HtRiH + term_HtRiH;
    sum_HtRiX = sum_HtRiX + term_HtRiX;
end

% Compute the result
y_hat = inv(sum_HtRiH) * sum_HtRiX;

% Display the result
disp('Result of y_hat:');
disp(y_hat);