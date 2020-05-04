# ludum
1) To run go to Godot executable
2) Choose import on right side
3) import project.godot

### TODO April 20-27
* Refine Proc Gen to best probabilities for most fun map
* When player hits spacebar, fireball shoots out:
*     Try to utilize the particle 2D node and lights for cool affects
*     Scene should be saved with the player class
* Global scoreboard
* Add Enemy Tracking and Enemy damage (will it be simple collision == damage? Or will we figure out fireballs well and implement a wizard character that spawns ball of fire?)
* Add interaction with chests and other animations
*     Chest should open when interacted first, then loose coins, then toggleable between empty and open
* Death state ( it will require reloading the scene but it will act different with multiplayer)
* Add sound affects
* Add GUI
*     Whether to play infinite singleplayer or multiplayer (more modes can come if we have time)
*     Interface to mess with probabilities of items spawning
* Add more items and enemies



#### TODO, LATER
* Networking a second player ( Might be easier than expected )
* Cool splash screen


### 
* To create a new enemy or item
* Go to the item folder
* Create a new scene with an appropriate name
* click the chain-link in the scene tab. Then select the scene (.tscn) from /enemies or /items, depending on what to be created
* Add sprites from the spritesheet folder (first one is the one with all the enemy sprites)
* If you add a script to the "enemies.tscn" or to "item.tscn" it should apply to all child instances of that class
* If an enemy needs something specific, edit their script within their scene
