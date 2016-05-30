%3. define the angle of chain and calculate angle correction S
clc;clear all;close all;
ExpName='dimer_exp19';
load(['J:\Granule\' ExpName '\ref\exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;

for t=1:length(wind)
    ProcessFile = ['J:\Granule\' ExpName '\ref\' num2str(wind(t)) '\'];
    load([ProcessFile 'tra.mat'],'BX','BY');
    % at B(time,Pi)
    load([ProcessFile 'pair.mat'],'index');
    % first pair=index(:,1);
    %%
    dnumber=length(index);
    tempS=zeros(1,size(BX,1));
    S=zeros(1,size(BX,1));
    cos_theta=zeros(1,dnumber);
    sin_theta=zeros(1,dnumber);
    sin_2theta=zeros(1,dnumber);
    cos_2theta=zeros(1,dnumber);
    theta=zeros(size(BX,1),dnumber);
    vector=zeros(size(BX,1),2*dnumber);
    %%
    for frames=1:size(BX,1)
        
        [index]=myNewIndex(index,BX(frames,:),BY(frames,:));
        % made the angle in region [ pi/2, -pi/2 )
        [d]=mydistance(BX(frames,index(1,:)),BY(frames,index(1,:)),BX(frames,index(2,:)),BY(frames,index(2,:)));
        vector(frames,:)=[BX(frames,index(1,:))-BX(frames,index(2,:)) BY(frames,index(1,:))-BY(frames,index(2,:))];
         % value of index = Pi = BX(1, Pi)
         % vector = [ V1x~V50x V1y~v50y ]
         % there is a problem : the O(0,0) located on upper left corner
        cos_theta= vector(frames,1:length(index))./d;
        sin_theta= vector(frames,(length(index)+1):2*length(index))./d;
        theta(frames,:)=asin(sin_theta);
        cos_2theta= (cos_theta.^2 - sin_theta.^2);
        sin_2theta= (2*cos_theta.*sin_theta);
        tan_2alpha=sum(2*cos_theta.*sin_theta)/sum(cos_theta.^2 - sin_theta.^2);
        cos_2alpha=sqrt(1/(tan_2alpha^2+1));
        sin_2alpha=tan_2alpha/sqrt((tan_2alpha^2+1));
        tempS=sum(3*cos_2theta*cos_2alpha+3*sin_2theta*sin_2alpha)/(4*dnumber);
        S(frames)=abs(tempS)+0.25;
    end
    save([ProcessFile 'inf_orientation.mat'],'vector','S','theta');
    clear theta cos* sin* S tempS
end