# MatLab-Anti-Reflective-Coating

🎓 **ELG3506 – Wideband Anti-Reflective Coating Design**
Impact of Multi-Layer Anti-Reflective (AR) Coatings on Solar Energy Production

By Rayane Oubarka & Othmane Daali
Dec 5, 2023


📄 **Overview**

This project studies how wideband anti-reflective coatings improve the transmission of electromagnetic waves through photovoltaic (PV) cells. Using the Transfer Matrix Method (TMM), the report analyzes:

  - Baseline reflectivity (no AR coating)
  - A 2-layer AR coating
  - A 3-layer AR coating
  - Power transmission comparisons
  - Optimization of refractive indices and layer thicknesses

All simulations are performed using MATLAB, and the project includes analytical derivations, numerical modelling, and visualization of reflectivity spectra.

--

🧠 **Theoretical Background**

We model the multi-layer dielectric stack using the Transfer Matrix Method (TMM):

Each interface is represented by a dynamic matrix describing reflection & transmission coefficients.

Each layer is represented by a propagation matrix based on its thickness and refractive index.

The overall system response is obtained from the product of all matrices from the total transfer matrixes.
Which allows us to compute the full spectral response from 400–1400 nm.

--
  
✅ **Results Summary**

1️⃣ Two-Layer AR Coating

The study first evaluates the reflectivity with no coating, then investigates a two-layer coating.

Key finding:
For a fixed first layer refractive index n₁ = 1.5, the optimal second layer index is:

- n₂ ≈ 2.43

This minimizes reflectivity at the central wavelength (650 nm) and maximizes power transmission.

Spectral Reflectivity Plots

The following graphs (from the original report) show how reflectivity changes with different n₂ values:

Reflectivity spectrum for n₂ = 2.43

Additional tests for n₂ = 2.13, 1.83, 2.73, 3.03

These confirm the analytical optimum.

--

2️⃣ Three-Layer AR Coating

The analysis is extended to a 3-layer structure, again deriving the optimal refractive index relationships analytically.

Key finding:

- The optimal second layer index becomes n₂ ≈ 2.22

A MATLAB sweep shows where power transmission peaks.

Power vs. Refractive Index Plot

A parametric sweep from n₂ = 0.01 → 4 shows maximum transmitted power near 2.22, confirming the analytical result.

--

💬 **Discussion**

Adding AR layers significantly reduces reflectivity across the solar spectrum.

The 2-layer coating provides substantial improvement over the uncoated interface.

The 3-layer coating provides finer spectral tuning and further increases total solar power transmission.

Both analytical and numerical results match closely, validating the TMM approach.

Performance strongly depends on choosing the correct refractive index ratios.

--

🔚 **Conclusion**

This study shows that:

Multi-layer anti-reflective coatings greatly improve solar cell efficiency.

The Transfer Matrix Method is a powerful tool for modeling multi-dielectric stacks.

Careful selection of refractive indices and thicknesses is essential for wideband AR design.

Three-layer coatings offer additional flexibility but with increased complexity.

The provided MATLAB code can be easily adapted for more layers, different materials, or alternative optimization goals.
