clear all;close all;clc

%% View 1

mu      = [1 1; 7 5];
sigma   = cat(3,[0.3 0;0 0.3],[0.8 0;0 0.8]);
mix     = [0.2 0.8];
rng(2); 
points_n= 800;

obj    = gmdistribution(mu,sigma,mix);
[points_ori,label_ori] = random(obj,points_n);

temp_points = sortrows([points_ori label_ori],3);
points{1}   = [temp_points(:,1) temp_points(:,2)];
label       = temp_points(:,3);



%% View 2

points{2}   = bsxfun(@minus,1,points{1})*0.5+5;

clear temp_points label_ori mix mu obj points_ori sigma 


save data_seven.mat


c=figure;

% Defaults for this blog post
width = 4;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

% Set Tick Marks
set(gca,'XTick',-3:3);
set(gca,'YTick',0:10);

% Here we preserve the size of the image when we save it.
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);

set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz


a=find(label==1); a1=points{1}(a,:);
b=find(label==2); b1=points{1}(b,:);
% c=find(label==3); c1=points{1}(c,:);
% d=find(label==4); d1=points{1}(d,:);
% e=find(label==5); e1=points{1}(e,:);
% f=find(label==6); f1=points{1}(f,:);
% g=find(label==7); g1=points{1}(g,:);


scatter(a1(:,1),a1(:,2),20,'bo');
hold on
scatter(b1(:,1),b1(:,2),20,'ro');
% scatter(c1(:,1),c1(:,2),20,'bo');
% scatter(d1(:,1),d1(:,2),20,'bo');
% scatter(e1(:,1),e1(:,2),20,'bo');
% scatter(f1(:,1),f1(:,2),20,'bo');
% scatter(g1(:,1),g1(:,2),20,'bo');
hold off


xlabel('x_{1}^{1}');
ylabel('x_{2}^{1}');

grid on


c=figure;

% Defaults for this blog post
width = 4;     % Width in inches
height = 3;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

% Set Tick Marks
set(gca,'XTick',-3:3);
set(gca,'YTick',0:10);

% Here we preserve the size of the image when we save it.
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);

set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz


a=find(label==1); a1=points{2}(a,:);
b=find(label==2); b1=points{2}(b,:);
% c=find(label==3); c1=points{2}(c,:);
% d=find(label==4); d1=points{2}(d,:);
% e=find(label==5); e1=points{2}(e,:);
% f=find(label==6); f1=points{2}(f,:);
% g=find(label==7); g1=points{2}(g,:);


scatter(a1(:,1),a1(:,2),20,'bo');
hold on
scatter(b1(:,1),b1(:,2),20,'ro');
% scatter(c1(:,1),c1(:,2),20,'bo');
% scatter(d1(:,1),d1(:,2),20,'bo');
% scatter(e1(:,1),e1(:,2),20,'bo');
% scatter(f1(:,1),f1(:,2),20,'bo');
% scatter(g1(:,1),g1(:,2),20,'bo');
hold off


xlabel('x_{1}^{2}');
ylabel('x_{2}^{2}');

grid on

