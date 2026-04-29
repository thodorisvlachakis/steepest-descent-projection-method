# Steepest Descent Projection Method

This repository contains a MATLAB-based study of the **Steepest Descent Projection Method**, focusing on solving constrained optimization problems by **incorporating projection** techniques into classical gradient-based algorithms.

The project builds upon the standard **Steepest Descent Method**, with constant descent step, and extends it incorporating **Projection Method (Technique)** in order to **handle constraints**, analyzing how step size parameters and feasibility conditions affect convergence behavior.

It represents the third assignment of an *Optimization Techniques* course in Electrical and Computer Engineering at AUTh and serves as a continuation of the study on unconstrained multivariable optimization.
See also: [Unconstrained Multivariable Optimization](https://github.com/thodorisvlachakis/unconstrained-multivariable-optimization)

## 📌 Overview

This project investigates how a classical unconstrained optimization method can be adapted to solve **constrained minimization problems**.

The main idea is to integrate a **projection mechanism** into the Steepest Descent algorithm so that all iterates remain within a feasible region defined by constraints.

The objective of this project is to investigate the performance and convergence of these optimization algorithms when applied to a nonlinear two-variable function, both in unconstrained and constrained settings.

The study includes:

* Analysis of the **Steepest Descent Method with constant step size**
* The role of **step size selection** in convergence behavior is being examined
* Extension to the **Steepest Descent Projection Method**
* Investigation of the role of **step size parameters (γₖ, sₖ) selection** to enforce feasibility
* Examination of the impact of **initial conditions**, especially when starting outside the feasible set

All methods are evaluated through numerical simulations and visualizations, providing insight into both theoretical expectations and practical behavior.

---

## 🧠 Problem Description

We consider the minimization of the function:

f(x₁, x₂) = (1/3)x₁² + 3x₂²

The global minimizer is computed analytically by solving:

∇f(x₁, x₂) = 0 ⇒ (x₁*, x₂*) = (0, 0)

and is used as a reference point for evaluating the numerical methods.

---

## 🔒 Constraints

The constrained problem is defined over the set:

-10 ≤ x₁ ≤ 5
-8 ≤ x₂ ≤ 12

This defines a rectangular feasible region in ℝ².

---

## ⚙️ Methods

### 🔹 Steepest Descent Method (Unconstrained Optimization Case)

The classical gradient-based optimization method, using a constant step size γₖ = γ, is first applied to minimize the objective function without constraints. Different constant step sizes are tested to analyze:

* Convergence speed  
* Stability  
* Sensitivity to parameter selection

### 🔹 Steepest Descent Projection Method (Constrained Optimization Case)

To handle constraints the Steepest Descent Method is extended using a **projection technique**.

The algorithm incorporates the logic of projection into the classical Steepest Descent Method in order to ensure that the **searcing point remains within the constraint set at every iteration**.

At each iteration:
1. A candidate point is computed using the gradient
2. The point is **projected onto the feasible set**
3. A **feasible search direction** is constructed
4. The next point is updated using step size γₖ

This guarantees that all iterates remain inside the constraint set (assuming a feasible starting point).

### 🔸 Projection as a Technique

Projection is not a standalone optimization method, but a **geometric operation** used to enforce feasibility.

Given a point outside the constraint set, it is mapped to the closest feasible point by applying coordinate-wise bounds.

In this project, projection is implemented for a general set in ℝⁿ defined by box constraints.  
This makes the implementation reusable beyond the specific 2D case studied in this assignment.

---

## 🧪 Experimental Setup

The implementation follows the structure of the assignment and evaluates the algorithms under different configurations.

### 🔹 Unconstrained Case (Steepest Descent)

The Steepest Descent Method is applied with:

* **Accuracy**: ε = 0.001  
* **Initial point**: x₀ ≠ (0, 0)  
* **Constant step sizes**:

  * γ = 0.1  
  * γ = 0.3  
  * γ = 3  
  * γ = 5  

The goal is to study how the choice of γ affects:

* Convergence  
* Convergence speed  
* Stability of the algorithm  

### 🔹 Constrained Case (Steepest Descent using Projection)

The Steepest Descent Projection Method is applied under different parameter configurations:

#### ✔ Case 1

* Initial point: x₀ = (5, -5) *(feasible)*  
* Parameters: γ = 0.5, s = 5  
* Accuracy: ε = 0.01  

#### ✔ Case 2

* Initial point: x₀ = (-5, 10) *(feasible)*  
* Parameters: γ = 0.1, s = 15  
* Accuracy: ε = 0.01  

#### ✔ Case 3 (Improved parameter selection)

* Initial point: x₀ = (-5, 10) *(feasible)*  
* Parameters: γ = 2/3, s = 1/4  
* Accuracy: ε = 0.01  

#### ✔ Case 4 (Non-feasible starting point)

* Initial point: x₀ = (8, -10) *(non-feasible)*  
* Parameters: γ = 0.2, s = 0.1  
* Accuracy: ε = 0.01

In all cases, the following are evaluated:

* Convergence of the algorithm  
* Number of iterations  
* Behavior of the objective function f(xₖ) meaning the convergence to the real minimum of the function
* Trajectory of searching points in the x₁–x₂ plane  

---

## 🎯 Key Observations

### 🔸 Effect of Step Size (Unconstrained Case)

* Convergence strongly depends on the choice of γ
* For small values, convergence is slow but stable
* Values close to the theoretical limit lead to faster convergence
* Large values result in divergence
* In some cases, individual variables may exhibit oscillatory or non-convergent behavior

### 🔸 Projection and Feasibility

* Projection ensures feasibility (searching point remains within the constraint set) at every iteration
* When the initial point is feasible, the method behaves as expected and converges under suitable parameter choices

## 🔸 Role of Parameters (γₖ, sₖ)

* The interaction between γ and s is critical for convergence
* Poor choices may lead to slow convergence or instability
* Proper tuning significantly improves performance

## 🔸 Non-Feasible Initial Points

* If the starting point lies outside the constraint set (**non-feasible**), convergence is **not guaranteed**
* However, in practice:
    * The algorithm may still converge
    * This depends on whether the iterates eventually enter the feasible region
* The behavior is problem-dependent and cannot be predicted in general

As we see in this project:

* The algorithm eventually enters the feasible region  
* Once inside, it behaves like a standard projected method  
* Convergence is observed, but significantly slower

## 🔸 Practical Insight

A key observation is that convergence may depend on whether the algorithm **enters the feasible set during iterations**.

Once inside, the method behaves as a standard projection method and convergence can be ensured under appropriate parameter choices.

---

## 📁 Project Structure

```
steepest-descent-projection-method/
│
├── src/
│   ├── ThirdLaboratoryExerciseCode.m               # Main script
│   │
│   ├── methods/                                    # Optimization algorithms
│   │   ├── SteepestDescentMethodWithConstantDescentStep.m
│   │   └── SteepestDescentProjectionMethodWithConstantDescentStep.m
│   │
│   ├── projection/                                 # Projection Technique
│   │   ├── ProjectionOnSpecificSet.m
│   │   └── PointBelongsToSpecificSet.m
│   │
│   └── utils/                                      # Helper functions
│       ├── ConvergenceOfObjectiveFunction.m
│       ├── SequenceOfSearchingPointsInThePlane.m
│       ├── ShadedSetOfConstraintsOnThePlaneOfx1x2.m
│       └── PresentationOfSteepestDescentMethodExecutionResults.m
│
├── docs/                                           # Statement & Report
│   ├── lab02.pdf
│   └── report_lab02.pdf
│
├── README.md
└── .gitignore
```

---

## ▶️ How to Run

### 🔧 Requirements

* MATLAB (any recent version)

### 🚀 Execution

1. Open MATLAB
2. Navigate to the `src/` directory
3. Run the main script:

```matlab
ThirdLaboratoryExerciseCode.m
```

The script will:

* Execute all experiments from the assignment for all implemented methods
* Generate convergence plots
* Visualize search trajectories on a common plane with the constraint regions
* Display useful results in the console, used in analysis in the report

---

## 📝 Notes

* The projection step enforces feasibility but does not guarantee convergence by itself
* Starting outside the feasible set leads to unpredictable behavior
* Parameter tuning (γ, s) plays a crucial role in both convergence and efficiency
* Figures are generated dynamically by running the code.
* A detailed analysis, with plots, interpretations, mathematical analysis (when needed) and final conclusions regarding the convergence, precision and efficiency of the algorithms studied, is provided in report_lab03.pdf file