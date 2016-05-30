% calculate lattice length
% save 'triangle' 'Tripair' 'Ldis'
clc; clear all; close all;
FilePath='J:/Granule/dimer_exp19/';
load([FilePath  'ref/exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
%%
for iwind=1:length(wind)
    
    str=num2str(wind(iwind));
    load([FilePath 'ref/' str '/tra.mat']);
    load([FilePath 'ref/' str '/fixpoint.mat'],'fixX','fixY');
for frame=1:size(BX,1)
    X=[ BX(frame,:) fixX']';
    Y=[ BY(frame,:) fixY']';
    dt = DelaunayTri(X,Y);
    triangle=sort(dt.Triangulation,2);
    % sort format2: arrange by row 
    % ex: (5 1 9) -> (1 5 9)
    % ex: (8 7 3) -> (3 7 8)
    Tripair=[triangle(:,1) triangle(:,2);triangle(:,2) triangle(:,3);triangle(:,1) triangle(:,3)];
    % (1 5)
    % (3 7)
    % (5 9)
    % (7 8)
    templength=length(Tripair);
    LLname=sprintf('%05d',frame);
        
    %% delete the duplication
    for m=1:templength
        for n=templength:-1:m+1
            if isequal(Tripair(m,:),Tripair(n,:));
                Tripair(n,:)=[0,0];
            end
        end
    end
%********** use logical calculator instead of find*********    
    ind=find(Tripair(:,1)==0);    
    Tripair(ind,:)=[];
    clear temp* m n 
    %%
    %c1=tempairb(:,1);
    %c2=tempairb(:,2);
    %ind2=find(diff(c1)==0 & diff(c2)==0);
    %tempairb(ind2,:)=[];
    
    %%
    Ldis=zeros(1,length(Tripair));
    for t=1:length(Tripair)
        Ldis(t)=mydistance(X(Tripair(t,1)),Y(Tripair(t,1)),X(Tripair(t,2)),Y(Tripair(t,2)));
        % remove scale on 2015/4/13
    end
    save([FilePath 'triangular/LatticeLine/' str '/' LLname '.mat'],'Tripair','Ldis','triangle');
    clear Ldis X Y
end
end
exit;