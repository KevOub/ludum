# ludum
1) To run go to Godot executable
2) Choose import on right side
3) import project.godot

#### TODO
* Fix escape glitch
* When player hits spacebar, fireball shoots out: (https://docs.godotengine.org/en/latest/tutorials/physics/using_kinematic_body_2d.html#bouncing-reflecting)
*     Try to utilize the particle 2D node and lights for cool affects
*     Scene should be saved with the player class
* Global scoreboard
* Add interaction with chests and other animations
* Chest should open when interacted first, then loose coins, then toggleable between empty and open
* Death state ( it will require reloading the scene but it will act different with multiplayer)
* Networking a second player ( Might be easier than expected )
* Health system



### 
* To create a new enemy or item
* Go to the item folder
* Create a new scene with an appropriate name
* click the chain-link in the scene tab. Then select the scene (.tscn) from /enemies or /items, depending on what to be created
* Add sprites from the spritesheet folder (first one is the one with all the enemy sprites)
* If you add a script to the "enemies.tscn" or to "item.tscn" it should apply to all child instances of that class
* If an enemy needs something specific, edit their script within their scene
