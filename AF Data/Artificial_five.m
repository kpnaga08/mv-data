Clear all; close all;clc

% Set the parameters
num_clusters = 2; % number of clusters
num_samples = 200; % number of data points in each cluster
num_dimensions_view1 = 2; % number of dimensions in view 1
num_dimensions_view2 = 3; % number of dimensions in view 2
num_views = 2; % number of views

% Generate the mean and covariance matrices for each view
center1_view1 = [2 2];
center2_view1 = [-6 6];
center1_view2 = [5 5 -3];
center2_view2 = [2 2 -3];
cov1_view1 = [10.9 -0.0255; -0.0255 0.9];
cov2_view1 = [0.5 0; 0 0.3];
cov1_view2 = [1.5 -0.4 0; -0.4 1.5 0; 0 0 0];
cov2_view2 = [1 0.4 0; 0.4 0.7 0; 0 0 0];

% Generate data for each view
data_view1 = zeros(num_samples*num_clusters, num_dimensions_view1, num_views);
data_view2 = zeros(num_samples*num_clusters, num_dimensions_view2, num_views);

for i=1:num_clusters
    data_view1((i-1)*num_samples+1:i*num_samples,:,1) = mvnrnd(center1_view1,cov1_view1,num_samples);
    data_view1((i-1)*num_samples+1:i*num_samples,:,2) = mvnrnd(center2_view1,cov2_view1,num_samples);
    data_view2((i-1)*num_samples+1:i*num_samples,:,1) = mvnrnd(center1_view2,cov1_view2,num_samples);
    data_view2((i-1)*num_samples+1:i*num_samples,1:2,2) = mvnrnd(center2_view2,cov2_view2,num_samples);
    data_view2((i-1)*num_samples+1:i*num_samples,3,2) = unifrnd(-4,-2,[num_samples,1]);
end

% Concatenate the views
X = cat(2, data_view1, data_view2);

% Shuffle the data
idx = randperm(size(X,1));
X = X(idx,:,:);

% Plot the results
figure;
scatter3(X(:,1,1), X(:,2,1), X(:,3,1), 20, 'r', 'filled');
hold on;
scatter3(X(:,1,2), X(:,2,2), X(:,3,2), 20, 'b', 'filled');
title('Multi-View Data');
xlabel('Feature 1');
ylabel('Feature 2');
zlabel('Feature 3');
legend('View 1', 'View 2');
