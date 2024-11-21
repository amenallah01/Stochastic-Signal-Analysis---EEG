# **Stochastic Signal Analysis with AR Models---EEG**

## **Overview**
This project explores the analysis and modeling of stochastic processes using Auto-Regressive (AR) models. Implemented in MATLAB, the project covers:
- Simulating and analyzing synthetic signals.
- Estimating AR model parameters using various techniques.
- Computing Power Spectral Density (PSD) and analyzing its properties.
- Applying AR modeling to real-world signals, such as EEG data, for brain rhythm analysis.

This project bridges theoretical concepts like stochastic processes, prediction, and spectral analysis with real-world applications in signal processing and neuroscience.

---

## **Key Objectives**
1. To implement theoretical concepts of random processes, such as white noise, prediction, correlation, and PSD, using MATLAB.
2. To validate theoretical relationships through experimental simulations.
3. To apply AR modeling to EEG signals for detecting brain rhythms and understanding neural activities.

---

## **Key Features**
### **1. AR Model Simulation**
- Generate synthetic signals using user-defined AR coefficients.
- Explore the impact of white noise and AR parameters on signal properties.

### **2. Parameter Estimation Methods**
- Implement and compare methods for AR parameter estimation:
  - Yule-Walker Method.
  - Burg Method.
  - Covariance Method.
  - Modified Covariance Method.

### **3. Model Order Selection**
- Use the Akaike Information Criterion (AIC) to determine the optimal AR order.
- Achieve a balance between model complexity and data fitting.

### **4. Spectral Analysis**
- Compute and compare PSD using AR modeling and the periodogram method.
- Analyze signal frequency components for applications in signal processing.

### **5. EEG Signal Analysis**
- Process EEG signals to identify brain rhythms (Alpha, Beta, Theta, Delta, Gamma).
- Characterize mental states and diagnose neurological conditions.

---

## **Technologies**
- **MATLAB**: Used for signal simulation, AR modeling, PSD computation, and EEG analysis.

---

## **Theoretical Background**

### **1. Auto-Regressive Models**
An AR(\(p\)) model represents a time series \( x_t \) as:
\[
x_t = -\sum_{i=1}^p a_i x_{t-i} + \epsilon_t
\]
Where:
- \( a_i \): AR coefficients.
- \( \epsilon_t \): White noise with mean \(0\) and variance \(\sigma^2\).

### **2. Akaike Information Criterion (AIC)**
The AIC is used to determine the optimal AR order. The formula is:
\[
AIC(p) = \frac{2p}{T} + \log(\sigma^2)
\]
Where:
- \( p \): AR order.
- \( T \): Length of the time series.
- \( \sigma^2 \): Variance of the white noise.

### **3. Power Spectral Density**
The PSD represents the distribution of signal power over frequency components. AR models provide a parametric method for PSD estimation, contrasting with non-parametric methods like the periodogram.

### **4. EEG Signal Rhythms**
- **Delta (0.5–4 Hz)**: Dominant in deep sleep.
- **Theta (4–8 Hz)**: Observed in light sleep or relaxation.
- **Alpha (8–13 Hz)**: Linked to calm and relaxation.
- **Beta (13–30 Hz)**: Associated with active thinking.
- **Gamma (30+ Hz)**: Reflects high-level cognitive functioning.

---

## **Project Structure**
```
Stochastic-Signal-Analysis/
├── README.md                 # Project description and instructions
├── LICENSE                   # Licensing information
├── data/                     # Input data (e.g., EEG signals)
│   └── eeg1.mat              # Example EEG dataset
├── src/                      # MATLAB scripts
│  ├── Order_Estimation_AIC.m # AR model simulation
└─ └── EEG_Analysis.m        # EEG signal analysis
```

---

## **Setup and Installation**

### **Prerequisites**
- MATLAB (R2021a or newer) with the Signal Processing Toolbox.

### **Setup**
1. Clone the repository:
   ```bash
   git clone https://github.com/amenallah01/Stochastic-Signal-Analysis---EEG.git
   cd Stochastic-Signal-Analysis
   ```
2. Place the EEG data file (`eeg1.mat`) in the `data/` folder.

### **Running Scripts**
Navigate to the `src/` folder in MATLAB and run the desired scripts:
1. **Simulate AR Model**:  
   Run `ar_model_simulation.m` to generate and visualize synthetic AR signals.
2. **Analyze EEG Signals**:  
   Use `eeg_analysis.m` to process EEG data and identify brain rhythms.

---

## **Applications**
1. **Time-Series Analysis**: Forecast future values and understand signal dynamics.
2. **Signal Processing**: Analyze frequency components for communication systems.
3. **Neuroscience**: Detect brain rhythms and diagnose neurological conditions using EEG signals.
4. **Engineering**: Apply spectral analysis techniques to mechanical or electrical systems.
