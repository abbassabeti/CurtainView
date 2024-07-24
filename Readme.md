# MeshGradient Animation in SwiftUI

https://github.com/user-attachments/assets/ec008993-9120-4cbf-9679-4af5dbf41d4b


This project demonstrates how to create and animate a `MeshGradient` in SwiftUI. The gradient animates between a straightened state and a creased state every 5 seconds.

## How It Works

The animation is achieved using a `Timer` that toggles the state of the gradient points every 5 seconds. The points array defines the positions of control points in a 3x3 grid, which are animated to create the effect of a curtain being pulled and released.

### Key Components

- **MeshGradient**: A custom gradient view that uses a 3x3 grid of control points.
- **Timer**: A SwiftUI `Timer` that triggers the animation every 5 seconds.
- **Animation**: The `withAnimation` function is used to animate the transition between states.
