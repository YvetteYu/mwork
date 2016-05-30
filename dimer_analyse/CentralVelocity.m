clc;clear all;close all;
ExpName='dimer_exp19';
File=['/Users/yvette/GoogleDrive/HexagonBoundary/' ExpName '/ref/'];
load([File 'exp_parameter.mat'],'Exp_info');
wind=Exp_info.wind;
for iwind=1:length(wind)
    
    load([File num2str(wind(iwind)) '/velocity.mat'],'V*');
    load([File num2str(wind(iwind)) '/pair.mat'],'index');
    Vxc=zeros(size(Vx,1),size(Vx,2)/2);
    Vyc=zeros(size(Vy,1),size(Vy,2)/2);
    for ipar=1:Exp_info.Pnumber/2
        Vxc(:,ipar)=Vx(:,index(1,ipar))+Vx(:,index(2,ipar));
        Vyc(:,ipar)=Vy(:,index(1,ipar))+Vy(:,index(2,ipar));
    end
    Vxc=Vxc/2; % Vc=m(v1+v2)/2m=(v1+v2)/2
    Vyc=Vyc/2;
    MSVxc=mean((Vxc).^2,2)';
    MSVyc=mean((Vyc).^2,2)';
    save([File num2str(wind(iwind)) '/velocity.mat'],'-append','V*c','MSV*c');
end
