# Traffic_Signal_Controller
## 1.Intro:
The Verilog HDL project for a Traffic Signal Controller aims to simulate the behavior of a traffic light intersection. The controller is responsible for managing the timing and sequencing of the traffic lights to ensure smooth and efficient traffic flow.
## 2.specifications:
-	The traffic signal for the main highway gets highest priority because cars are continuously present on the main highway. Thus, the main highway signal remains green by default.
- Occasionally, cars from the country road arrive at the traffic signal. The traffic signal for the country road must turn green only long enough to let the cars on the country road go.
- As soon as there are no cars on the country road, the country road traffic signal turns yellow and then red and the traffic signal on the main highway turns green again.
- There is a sensor to detect cars waiting on the country road. The sensor sends a signal X as input to the controller. X = 1 if there are cars on the country road; otherwise, X= 0 . There are delays on transitions from S1 to 52, from S2 to S3, and from S4 to SO. The delays must be controllable
  
   ![road](https://github.com/AbdullahMahmoudGhazal/Traffic_Signal_Controller/assets/113705881/47c6d358-878d-43a5-876f-f944b165af8b)
## 3. Inputs:
- Clock: The clock signal provides the timing reference for the controller.
- Clear: The reset clear initializes the controller to the first state.
- X : These signals represent the input from various sensors, which identify the cars on country Road.
## 4. outputs:
- Hwy:  These signals control the state of the traffic lights, including                                                                                   the red, yellow, and green lights for Highway Road.
- Cntry :  These signals control the state of the traffic lights, including                                                                                   the red, yellow, and green lights for country Road.

![Block](https://github.com/AbdullahMahmoudGhazal/Traffic_Signal_Controller/assets/113705881/6b71f54d-ef7e-4e63-8fc7-8bdda37887ad)
## 5. State Machine: 
The project typically employs a finite state machine (FSM) design to manage the traffic light sequencing. The FSM transitions between different states based on the inputs and a predefined timing sequence.
## 6.Testbench: 
To verify the functionality of the Traffic Signal Controller, a testbench is implemented. The testbench generates input stimuli to simulate various traffic scenarios and checks the output signals for correctness.
