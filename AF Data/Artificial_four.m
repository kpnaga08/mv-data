Clear all; close all;clc

% set the parameters
num_clusters = 2; % number of clusters
num_samples = 200; % number of data points in each cluster
num_dimensions_view1 = 2; % number of dimensions in view 1
num_dimensions_view2 = 3; % number of dimensions in view 2
num_views = 2; % number of views

% generate the mean and covariance matrices for each view
center1_view1 = [2 2];
center2_view1 = [-6 6];
center1_view2 = [5 5 -3];
center2_view2 = [2 2 -3];
cov1_view1 = [10.9 -0.0255; -0.0255 0.9];
cov2_view1 = [0.5 0; 0 0.3];
cov1_view2 = [1.5 -0.4 0; -0.4 1.5 0; 0 0 1];
cov2_view2 = [1 0.4 0; 0.4 0.7 0; 0 0 0];
means_view1 = [center1_view1; center2_view1];
covariances_view1 = cat(3, cov1_view1, cov2_view1);
means_view2 = [center1_view2; center2_view2];
covariances_view2 = cat(3, cov1_view2, cov2_view2);

% generate the multi-view data
for i = 1:num_views
    if i == 1
        data{i} = mvnrnd(means_view1, covariances_view1, num_samples);
    else
        data{i} = [mvnrnd(means_view2, covariances_view2, num_samples), ...                   unifrnd(-4, -2, num_samples, 1)];
    end
end

% concatenate the views
X = cat(2, data{1}, data{2});

% fit k-means model to the data
[km_idx, km_centers] = kmeans(X, num_clusters);

% plot the results
figure;
scatter3(X(:,1), X(:,2), X(:,3), 20, km_idx, 'filled');
title('k-Means Clustering Results');
xlabel('Feature 1');
ylabel('Feature 2');
zlabel('Feature 3');
