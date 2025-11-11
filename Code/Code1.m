T=0.8;
lambda_1 = 200; lambda_2 = 2200; step = 1; % in nm
wav = lambda_1:step:lambda_2; % in nm

I = @(x) 6.16E15 ./ (x.^5 .* ( exp(2484./x) - 1));
P_lambda = I(wav) * T;

P = trapz(wav,P_lambda);

fprintf('Power = %.3f W.\n', P);