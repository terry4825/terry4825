# 🛸 UAM Route Optimization Simulation & GUI Development

## 📌 Project Overview
* **Period:** July 2023 - Dec 2023 (Internship Project)
* **Objective:** Developing optimized flight paths for UAM using Reinforcement Learning and a real-time visualization system.
* **Role:** Implemented C++ Reinforcement Learning algorithms and designed the simulator GUI using the Qt framework.

## 🛠 Tech Stack
* **Language:** C++
* **Framework:** Qt (for GUI Development)
* **Algorithm:** Reinforcement Learning (Q-Learning)
* **Tool:** Visual Studio

## 🚀 Key Achievements & Features
* **Optimal Routing:** Designed logic to avoid dynamic obstacles and find the shortest path using Q-Learning.
* **User Interface (GUI):** Built a real-time dashboard using the Qt framework to visualize flight paths, obstacles, and environmental factors.
* **Computational Efficiency:** Reduced processing time to **3.87 seconds** by implementing local optimization techniques.
* **Reliability:** Achieved a **96% success rate** (48/50 trials), demonstrating high algorithm stability.

## 🧠 Technical Challenges & Solutions: Local Optimization
* **Challenge:** Global searching in a $100\text{km} \times 100\text{km}$ ($100 \times 100$ grid) environment caused excessive computational overhead, making real-time path generation impossible.
* **Solution:** Implemented **Local Optimization** by limiting the search radius to a $20 \times 20$ grid around the aircraft's current position.
* **Impact:** Reduced search space complexity by **96%**, maximizing data processing efficiency and slashing computation time to **3.87s** for real-time simulation.
