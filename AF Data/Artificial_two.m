clear all;close all;clc

% set the parameters
num_clusters = 2; % number of clusters
num_samples = 200; % number of data points in each cluster
num_dimensions = 2; % number of dimensions in each view
num_views = 2; % number of views

% generate the mean and covariance matrices for each view
mean1 = [0 0];
mean2 = [5 5];
cov1 = [1 0; 0 1];
cov2 = [1 0; 0 1];
means = [mean1; mean2];
covariances = cat(3, cov1, cov2);

% generate the multi-view data
for i = 1:num_views
    data{i} = mvnrnd(means, covariances, num_samples);
end

% concatenate the views
X = cat(2, data{1}, data{2});

% fit GMM model to the data
gm = fitgmdist(X, num_clusters);

% get the cluster indices
idx = cluster(gm, X);

% plot the results
figure;
scatter(X(:,1), X(:,2), 20, idx, 'filled');
title('GMM Clustering Results');
xlabel('Feature 1');
ylabel('Feature 2');


% Generate Multi-View Artificial Data with 2 Clusters, 2 Views, and 2 Dimensions
clear all; close all; clc;

% Set random seed for reproducibility
rng(1);

% Set parameters
num_samples = 200;          % Number of samples
num_clusters = 2;           % Number of clusters
num_views = 2;              % Number of views
num_dimensions = 2;         % Number of dimensions

% Generate random cluster centers for each view
center1_view1 = [1, 1];
center2_view1 = [-1, -1];
center1_view2 = [-1, 1];
center2_view2 = [1, -1];

% Generate data for each view
data_view1 = zeros(num_samples, num_dimensions);
data_view2 = zeros(num_samples, num_dimensions);

for i = 1:num_samples
    % Randomly assign each sample to one of the two clusters
    if rand() > 0.5
        % Sample from first cluster
        data_view1(i, :) = center1_view1 + 0.1*randn(1, num_dimensions);
        data_view2(i, :) = center1_view2 + 0.1*randn(1, num_dimensions);
    else
        % Sample from second cluster
        data_view1(i, :) = center2_view1 + 0.1*randn(1, num_dimensions);
        data_view2(i, :) = center2_view2 + 0.1*randn(1, num_dimensions);
    end
end

% Plot data for each view
figure;
subplot(1, num_views, 1);
scatter(data_view1(:, 1), data_view1(:, 2), 'filled');
hold on;
scatter(data_view2(:, 1), data_view2(:, 2), 'filled');
title('View 1');
axis equal;

subplot(1, num_views, 2);
scatter(data_view1(:, 1), data_view1(:, 2), 'filled');
hold on;
scatter(data_view2(:, 1), data_view2(:, 2), 'filled');
title('View 2');
axis equal;


% set the parameters
num_clusters = 2; % number of clusters
num_samples = 200; % number of data points in each cluster
num_dimensions = 2; % number of dimensions in each view
num_views = 2; % number of views

% define the centers for each view and cluster
center1_view1 = [1, 1];
center2_view1 = [-1, -1];
center1_view2 = [-1, 1];
center2_view2 = [1, -1];

% define the covariance matrices for each cluster
cov1 = [1 0; 0 1];
cov2 = [1 0; 0 1];
covariances = cat(3, cov1, cov2);

% generate the data for each view
for i = 1:num_samples/2
    % generate data for view 1
    data_view1(i,:) = mvnrnd(center1_view1, covariances(:,:,1));
    data_view1(i+num_samples/2,:) = mvnrnd(center2_view1, covariances(:,:,1));
    
    % generate data for view 2
    data_view2(i,:) = mvnrnd(center1_view2, covariances(:,:,2));
    data_view2(i+num_samples/2,:) = mvnrnd(center2_view2, covariances(:,:,2));
end

% combine the views
X = [data_view1 data_view2];

% fit GMM model to the data
gm = fitgmdist(X, num_clusters);

% get the cluster indices
idx = cluster(gm, X);

% plot the results
figure;
scatter(X(:,1), X(:,2), 20, idx, 'filled');
title('GMM Clustering Results');
xlabel('Feature 1');
ylabel('Feature 2');

