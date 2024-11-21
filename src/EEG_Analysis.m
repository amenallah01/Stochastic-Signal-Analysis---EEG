% Clear workspace, close all figures, and clear command window
clear all;
close all;
clc;

% --- Load EEG Signal ---
disp('Loading EEG signal.');
load('../data/eeg1.mat'); % Load EEG data
fs = 128; % Sampling frequency

% --- Calculate AIC ---
disp('Calculating AIC and finding optimal model order.');
T = length(s); % Length of the signal
AIC = zeros(1, 50); % Initialize AIC vector
for p = 1:50
    [a, sigma] = aryule(s, p); % Estimate AR coefficients
    AIC(p) = (2 * p) / T + log(sqrt(sigma)); % Compute AIC
end
[min_val, opt_order] = min(AIC); % Find minimum AIC and corresponding order
disp(['Optimal model order: ', num2str(opt_order)]);

% --- Estimate AR Coefficients ---
[a_estim, sigma_estim] = aryule(s, opt_order); % Estimate AR coefficients for optimal order
a_estim = a_estim(2:end); % Exclude the first coefficient (constant term)

% --- Compute Spectral Density and Periodogram ---
disp('Calculating spectral density and periodogram.');
[pd, freq] = pyulear(s, opt_order, T, fs); % Spectral density (Yule-Walker)
[spectral, fre] = periodogram(s, hamming(T), T, fs); % Periodogram

% --- Combined Plot ---
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % Fullscreen figure

% 1. Plot EEG Signal
subplot(2, 2, 1);
plot(s, 'b', 'LineWidth', 1.5); % Plot EEG signal
title('EEG Signal Output'); % Title
legend('s(t)', 'Location', 'best'); % Legend
xlabel('Time (samples)'); % x-axis label
ylabel('Signal Amplitude'); % y-axis label
grid on;

% 2. Plot AIC vs. Model Order
subplot(2, 2, 2);
plot(1:50, AIC, 'b', 'LineWidth', 1.5); % Plot AIC curve
hold on;
plot(opt_order, min_val, 'r*', 'MarkerSize', 10); % Highlight minimum
title('AIC vs. Model Order'); % Title
legend('AIC', 'Minimum AIC', 'Location', 'best'); % Legend
xlabel('Model Order (p)'); % x-axis label
ylabel('AIC'); % y-axis label
grid on;
hold off;

% 3. Plot AR Coefficients
subplot(2, 2, 3);
scatter(1:opt_order, a_estim, 'b*'); % Plot AR coefficients
title(['AR Coefficient Estimates (p = ', num2str(opt_order), ')']); % Title
legend('Estimated Coefficients', 'Location', 'best'); % Legend
xlabel('Coefficient Index'); % x-axis label
ylabel('Coefficient Value'); % y-axis label
grid on;

% 4. Superposition of Spectral Density and Periodogram
subplot(2, 2, 4);
plot(freq, pd, 'r'); % Plot spectral density (red)
hold on;
plot(fre, spectral, 'b'); % Plot periodogram (blue)
title('Spectral Density and Periodogram'); % Title
legend('Spectral Density', 'Periodogram', 'Location', 'best'); % Legend
xlabel('Frequency (Hz)'); % x-axis label
ylabel('Amplitude'); % y-axis label
grid on;
hold off;
