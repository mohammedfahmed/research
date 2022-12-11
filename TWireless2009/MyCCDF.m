function [CCDF_prec_u,CCDF_prec_g,CCDF_RayleighApp] = MyCCDF(N,P0,V,phi)

% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Collaborative beamforming for
% wireless sensor networks with Gaussian distributed sensor nodes," IEEE
% Trans. Wireless Communications, vol. 8, no. 2, pp.638-643, Feb. 2009.
% 
% 
% N : Number of sensor nodes
% R : Cluster radius
% V : Vairiance of the Gaussian spatial distribution corresponding to
% cluster radius R
% phi : The azimuth angle.
% alpha : Defined for Uniform and Gaussian spatial distributions.
% P0 : Power level.
% P0dB : Power level in dB.
% m_x : The mean of the real part X of the array factor level at a given
% angle phi, defined for Uniform and Gaussian spatial distributions.
% var_x : The variance of the real part X of the array factor level at a given
% angle phi, defined for Uniform and Gaussian spatial distributions.
% var_y : The variance of the imaginary part Y of the array factor level at a
% given angle phi, defined for Uniform and Gaussian spatial distributions.
% CCDF_prec : The precise CCDF of the beampattern level defined for Uniform and Gaussian
% spatial distributions.
% CCDF_RayleighApp : The approx. CCDF of the beampattern level defined for Uniform and Gaussian
% spatial distributions.

% 
R = 3*sqrt(V);
alpha_u = 4*pi*R*sin(phi/2);
alpha_g = 4*pi*sin(phi/2);


% - - -  Precise CCDF - equation 46 and 47 in paper: H. Ochiai, P. Mitran,
% H. V. Poor, and V. Tarokh, “Collaborative beamforming for distributed
% wireless ad hoc sensor networks," IEEE Trans. Signal Processing, vol. 53,
% no. 11, pp. 4110-4124, Nov. 2005. - - -

m_x_u = 2*(besselj(1,alpha_u)/alpha_u)*sqrt(N);
var_x_u = 0.5*(1+(besselj(1,2*alpha_u)/alpha_u))-(2*(besselj(1,alpha_u)/alpha_u))^2;
var_y_u=0.5*(1-(besselj(1,2*alpha_u)/alpha_u));

m_x_g=sqrt(N)*exp(-(alpha_g^2)*V/2);
var_x_g=(1/(2))*(1+ exp(-((2*alpha_g)^2)*V/2) )-(1/1)*(exp(-(alpha_g^2)*V/2))^2;
var_y_g=(1/(2))*(1- exp(-((2*alpha_g)^2)*V/2) );

for cntr=1:length(P0)
    
    w=-pi:(2*pi/1000):pi;
    
    for n=1:length(w)
        
        U_u=sqrt((((cos(w(n)))^2)/(2*var_x_u))+(((sin(w(n)))^2)/(2*var_y_u)));
        V_u=m_x_u*cos(w(n))/(2*var_x_u*U_u);
        W_u=sqrt(N*P0(cntr))*U_u;
        
        U_g=sqrt((((cos(w(n)))^2)/(2*var_x_g))+(((sin(w(n)))^2)/(2*var_y_g)));
        V_g=m_x_g*cos(w(n))/(2*var_x_g*U_g);
        W_g=sqrt(N*P0(cntr))*U_g;
        
        y_u(n)=(1/(4*pi*sqrt(var_x_u)*sqrt(var_y_u)*U_u^2))*exp(V_u^2-((m_x_u^2)/(2*var_x_u)))*(sqrt(pi)*V_u*erfc(W_u-V_u)+exp(-(W_u-V_u)^2));
        y_g(n)=(1/(4*pi*sqrt(var_x_g)*sqrt(var_y_g)*U_g^2))*exp(V_g^2-((m_x_g^2)/(2*var_x_g)))*(sqrt(pi)*V_g*erfc(W_g-V_g)+exp(-(W_g-V_g)^2));
    end
    
    CCDF_prec_u(cntr)=2*pi*mean(y_u);
    CCDF_prec_g(cntr)=2*pi*mean(y_g);
    
end




% - - -  approx. CCDF - equation 49 in paper: H. Ochiai, P. Mitran,
% H. V. Poor, and V. Tarokh, “Collaborative beamforming for distributed
% wireless ad hoc sensor networks," IEEE Trans. Signal Processing, vol. 53,
% no. 11, pp. 4110-4124, Nov. 2005. - - -


CCDF_RayleighApp = exp(-N*P0);