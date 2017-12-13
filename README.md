# P2P-Networking-Example
Peer 2 Peer Networking Example In Gamemaker Studio 2

This is an example project of a simple Peer To Peer networked game. Check out my live streams to see most of its development here.
(Skip through the hours that I get stuck on a couple things xD)

https://www.youtube.com/watch?v=7YVaY_cBvIM

https://www.youtube.com/watch?v=eVIT1v1PfDE

## How to play
You can open multiple instance of GM and run the game or compile into .zip and open as many as you want. The first instance needs to HOST
and the rest of the instances will need to join with Unique ports set. (Cant be the same as host, and cant be the same as any of the
Clients). 

You can press CONTROL at the main menu to insert a name if you would like. Once in game. On the host, press "R", to start the countdown
timer. Once the timer is up, the clients will spawn. No friendly fire available, so you must spawn more than 3 players in to get someone
on the other team.

In order to get other team to spawn, you need to spawn more than 3 players in. And in order to do this you will need to connect multiple instances. For each instance you will need to set the port to an unused one.

On my computer for example:

I hosted on 3224.

First Join on  127.0.0.1 : 3223

Second Join on 127.0.0.1 : 3225

Third Join on  127.0.0.1 : 3226

Fourth Join on 127.0.0.1 : 3227

Basically for each connection you need to find a free port on your computer that is not in use!!


## To start learning the project
Start in the NetworkSpawner object, and the main menu buttons. You can follow them through. I give a quick walkthrough at the end of 
my second Youtube stream. The code and structure could be MUCHHH better but I was in a little rush to get this one complete!
Will add more detail here soon.....


