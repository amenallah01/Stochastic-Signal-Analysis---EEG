% Clear workspace and close all figures
clear all;
close all;

% --- Parameters Definition for AR(5) ---
T = 200; % Length of the time series
x = zeros(T, 1); % Initialize a vector x of length T
a = [0.02, -0.05, -0.3, 0.1, 0.2]; % Coefficients of the AR(5) model
sig = 100; % Standard deviation of white noise
p = 5; % Order of the AR model

% --- Time Series Generation for AR(5) ---
for t = 6:T % Generate the time series
    x(t) = -a * x(t-1:-1:t-p) + 10 * randn(1);
end

% --- AIC Calculation ---
AIC = zeros(1, 50); % Initialize the AIC vector
for t = 1:50
    [a_est, noise_var] = aryule(x, t); % Estimate AR coefficients
    AIC(t) = ((2 * t) / T) + log(sqrt(noise_var)); % Compute AIC
end

% --- Parameters Definition for AR(3) ---
A = [0.2, 0.5, 0.1]; % Coefficients of the AR(3) model
x_AR3 = zeros(T, 1); % Initialize a vector x for AR(3)
p_AR3 = 3; % Order of the AR model

% --- Time Series Generation for AR(3) ---
for t = 4:T
    x_AR3(t) = -A * x_AR3(t-1:-1:t-p_AR3) + 10 * randn(1); % Generate signal
end

% --- Spectral Density Estimation for AR(3) ---
[pd, freq] = pyulear(x_AR3, p_AR3, 200, 1); % Estimate spectral density

% --- Plot Results ---
figure(1);

% 1. Plot Time Series for AR(5)
subplot(2, 2, 1);
plot(x, 'b'); % Plot x(t) in blue
title('Time Series Representation (AR(5))'); % Title of the figure
legend('x(t)'); % Legend for the plot
xlabel('Time (t)'); % Label for the x-axis
ylabel('Signal Amplitude'); % Label for the y-axis
grid on; % Display grid

% 2. Plot AIC vs. Model Order
subplot(2, 2, 2);
hold on;
plot(1:50, AIC, 'r', 'LineWidth', 1.5); % Plot AIC in red
[min_val, min_idx] = min(AIC); % Find the minimum AIC value and index
plot(min_idx, min_val, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g'); % Highlight the minimum AIC
title('AIC vs. Model Order'); % Title of the figure
xlabel('Model Order (p)'); % Label for the x-axis
ylabel('AIC'); % Label for the y-axis
legend('AIC', 'Minimum AIC', 'Location', 'best'); % Legend including the minimum point
grid on; % Display grid

% 3. Plot Spectral Density for AR(3)
subplot(2, 1, 2);
plot(freq, pd, 'k', 'LineWidth', 1.5); % Plot spectral density
title('Spectral Density (AR(3))'); % Title of the figure
xlabel('Frequency (Hz)'); % Label for the x-axis
ylabel('Amplitude'); % Label for the y-axis
grid on; % Display grid
