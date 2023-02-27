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

% define the covariance matrices for each view and cluster
cov1_view1 = [1 0; 0 1];
cov2_view1 = [0.5 0; 0 0.5];
cov1_view2 = [0.5 0; 0 0.5];
cov2_view2 = [1 0; 0 1];

% generate the data for each view
for i = 1:num_samples/2
    % generate data for view 1
    data_view1(i,:) = mvnrnd(center1_view1, cov1_view1);
    data_view1(i+num_samples/2,:) = mvnrnd(center2_view1, cov2_view1);
    
    % generate data for view 2
    data_view2(i,:) = mvnrnd(center1_view2, cov1_view2);
    data_view2(i+num_samples/2,:) = mvnrnd(center2_view2, cov2_view2);
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
