function [KE,KEt,KEr]=myKE(particle,FilePath,vol,volstart,volend)

switch particle
    case 'monomer'
        KE=zeros(1,volend-volstart+1);
        for ivol=volstart:volend
            load([FilePath num2str(vol(ivol)) '/velocity'],'MSV*')
            KE(ivol-volstart+1)=mean(MSVx+MSVy);
        end
        KEt=0; KEr=0;
    case 'dimer'
        load([FilePath '/exp_parameter.mat'],'Exp_info');
        rodlength=Exp_info.Lconstant_pixel*Exp_info.scale(2); % unit:mm
        inertial=rodlength^2/2;
        KEt=zeros(1,volend-volstart+1);
        KEr=zeros(1,volend-volstart+1);
        
        for ivol=volstart:volend
            display(ivol)
            load([FilePath num2str(vol(ivol)) '/velocity'],'MSV*')
            KEt(ivol-volstart+1)=mean(MSVxc+MSVyc); 
            % for central velocity, the mass is two times.
            KEr(ivol-volstart+1)=inertial*mean(MSVr)/2;
        end
        KE=KEt+KEr;
end
end