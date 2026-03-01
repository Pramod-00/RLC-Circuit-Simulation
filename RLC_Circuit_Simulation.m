%% -------------------------------------------------
% STEP 1: Define Circuit Parameters
% -------------------------------------------------
R = 10;           % Resistance in Ohms
L = 0.5;          % Inductance in Henries
C = 100e-6;       % Capacitance in Farads

%% -------------------------------------------------
% STEP 2: Create Transfer Function (Current / Voltage)
% I(s)/V(s) = 1 / (L*s^2 + R*s + 1/C)
% -------------------------------------------------
num = 1;                  % Numerator
den = [L R 1/C];          % Denominator
sys = tf(num, den);       % Transfer function model

%% -------------------------------------------------
% STEP 3: Step Response (Current vs Time)
% -------------------------------------------------
figure;
step(sys);
grid on;
title('RLC Circuit Step Response (Current)');
xlabel('Time (seconds)');
ylabel('Current (Amps)');

%% -------------------------------------------------
% STEP 4: Voltage Analysis Across R, L, and C
% -------------------------------------------------

% Get current response data
[t, i] = step(sys);

% Calculate voltages using basic circuit equations
v_R = R * i;                      % Voltage across resistor
v_L = L * gradient(i, t);         % Voltage across inductor
v_C = (1/C) * cumtrapz(t, i);     % Voltage across capacitor

% Plot voltages
figure;
plot(t, v_R, 'LineWidth', 1.5); hold on;
plot(t, v_L, 'LineWidth', 1.5);
plot(t, v_C, 'LineWidth', 1.5);
grid on;

title('Voltage Response Across R, L, and C');
xlabel('Time (seconds)');
ylabel('Voltage (Volts)');
legend('V_R', 'V_L', 'V_C');

%% -------------------------------------------------
% STEP 5: Stability Analysis by Varying Resistance
% -------------------------------------------------
R_values = [2 10 50];     % Different resistance values

figure;
hold on;

for R = R_values
    den = [L R 1/C];      % Update denominator with new R
    sys = tf(1, den);    % New system
    step(sys);            % Plot step response
end

grid on;
title('Effect of Resistance on Stability');
xlabel('Time (seconds)');
ylabel('Current (Amps)');
legend('R = 2 \Omega', 'R = 10 \Omega', 'R = 50 \Omega');