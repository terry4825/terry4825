# 🛸 UAM Optimal Route Generation Simulation & GUI Development

## 📌 Project Overview
* **Period:** Jul 2023 - Dec 2023 (Internship Project)
* **Objective:** Developing an optimal UAM flight path generation system using Reinforcement Learning (Q-Learning) and real-time visualization.
* **Key Role:** Implemented Q-Learning algorithms based on C++ and designed the simulator GUI using the Qt framework.

## 🛠 Tech Stack
* **Language:** C++
* **Framework:** Qt (GUI Development)
* **Algorithm:** Reinforcement Learning (Q-Learning)
* **Tools:** Visual Studio

## 🚀 Key Achievements & Features
* **Optimal Routing:** Designed a logic to derive the shortest distance while avoiding dynamic obstacles using Q-Learning.
* **User Interface (GUI):** Implemented a real-time monitoring dashboard for flight paths, obstacles, and environmental factors using Qt.
* **Efficiency Optimization:** Reduced computation time to **3.87 seconds** by introducing a Local Optimization technique.
* **Reliability Verification (KTL Certified):**
    * Officially verified by the **Korea Testing Laboratory (KTL)** for algorithm consistency and operational stability.
    * Achieved a **96% success rate** (48/50 trials) in rigorous simulation tests, proving feasibility for real-world application.

## 🧠 Technical Challenge: Local Optimization
* **Problem:** Global exploration of a $100\text{km} \times 100\text{km}$ ($100 \times 100$ grid) environment caused high computational complexity, making real-time generation impossible.
* **Solution:** Applied **Local Optimization**, focusing on a $20 \times 20$ area ($10\text{km}$ radius) centered on the aircraft's current position.
* **Result:** Reduced the search space by **96%** compared to the full map, successfully enabling a real-time simulation environment.

### 📂 Project Files
* 📄 [UAM Optimal Path Generation: Technical Design Specification (PDF)](./UAM/UAM_Project_PPT.pdf)
* 🎬 [UAM Simulation & GUI Demonstration Video (MP4)](./UAM/UAM_Project_GUI_Demonstration.mp4)
