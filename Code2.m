%double layer
n1 = 1.5;
n0 = 1.33;
n3 = 3.5;
n2 = 2.43;

%Coefficients de reflection
ref01 = (n0 - n1)/(n0 + n1); 
ref12 = (n1 - n2)/(n1 + n2); 
ref23 = (n2 - n3)/(n2 + n3); 

%Coefficients de Transmission
TC01 = (2*n0)/(n0 + n1);
TC12 = (2*n1)/(n1 + n2);
TC23 = (2*n2)/(n2 + n3);

%Matrice dynamique
Q01 = (1/TC01)*[1 ref01; ref01 1];
Q12= (1/TC12)*[1 ref12; ref12 1]; 
Q23 = (1/TC23)*[1 ref23; ref23 1];

Puissance = 0;
for wavelength = 400:1400
    Gx=(pi/2)*(650/wavelength);
    P = [exp(1i*Gx) 0; 0 exp(-1i*Gx)];
    T = Q01 * (P*Q12*P*Q23);
    REF = T(2,1)/T(1,1); %Coefficient de reflexion du systeme
    R (wavelength) = (abs(REF)^2)*100; %En pourcentage
    TRA = 1/T(1,1);
    TTY (wavelength) = (abs(TRA)^2)*(n3/n0); %Transmetivite
    I = (6.16*10^15)/((wavelength^5)*(exp(2484/wavelength) -1));
    Puissance = Puissance + TTY(wavelength)*I;
end
wavelength = 1:1400;
plot(wavelength,R);
xlim([400 1400]);
title("Refractivite vs Longueur d'onde");
xlabel("Longueur d'onde (nm)");
ylabel("refractivite %");
disp('Puissance :');
disp(Puissance);