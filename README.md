# BrainyPi

## Steps to start using ROS on BrainyPi

1. Flash the ubuntu image on a SD-Card and insert it into the BrainyPi
2. Once flashed connect your Pi to a monitor via the HDMI cable, and a keyboard.
3. Turn on the Pi.
> Since its is booting for the first time it will take some time to build the kernels and dependencies.
4. Once the Pi has successfully started login into the Pi.
> ID: 'pi'  Password: 'brainy'
5. Now you need to connect the Pi to your desire wifi and since it does not have any gui you need to connect it using the terminal.
  
  There are many ways to do so, but I personally used the **nmcli** commands.
  
  ### Connecting wifi to your pi using **nmcli**
a. Check if the radio wifi service is on:
  ```
  nmcli radio wifi
  ```
  If it is disabled, enable it using:
  ```
  nmcli radio wifi on
  ```
 b. Identify the wifi access point:
  ```
  nmcli dev wifi list
  ```
  This will show you the list of wifi's you can connect to.
  
 c. Connect to the wifi:
  ```
  sudo nmcli dev wifi connect 'network-ssid' password 'network-pssword'
  ```
 d. You can check if your device is successfully connected to the wifi by testing it using **ping**:
  ```
  ping google.com
  ```
  
6. Once successfully connected now you can ssh into the pi using its ip.
> If you face any error to do so it may be bea=cause of the sshd_config file.
open up the said config file (location `/etc/ssh/sshd_config`) and comment out thr 13th line.
Now you can ssh into the Pi.

7. Now you can Follow the steps given on the official [ROS WIki](http://wiki.ros.org/melodic/Installation/Ubuntu) to install ROS on BrainyPi.

## Using the GPIO and PWM pins in BrainyPi.

You can access the GPIO pins of BrainyPi in the same way you do for RaspberryPi but it is only supported in the official rbian image of BrainyPi.

So if you want to use the GPIO pins in BrainyPi you would have to use the **sysfs** method to do so.

Additionally you can create bash scripts for the same.

Resources I used to do so: 

For GPIO- https://www.ics.com/blog/gpio-programming-using-sysfs-interface

For PWM- https://github.com/mohdismailj/fancontrol/blob/main/fancontrol.sh
        
I also created a bash script to control the access the PWM pins in BrainyPi and control them using frequency and duty cycle.
