# ludum
1) To run go to Godot executable
2) Choose import on right side
3) import project.godot

### TODO April 17-19
* When player hits spacebar, fireball shoots out:
*     Try to utilize the particle 2D node and lights for cool affects
* Begin looking into global scoreboard


### 
* To create a new enemy or item
* Go to the item folder
* Create a new scene with an appropriate name
* click the chain-link in the scene tab. Then select the scene (.tscn) from /enemies or /items, depending on what to be created
* Add sprites from the spritesheet folder (first one is the one with all the enemy sprites)
* If you add a script to the "enemies.tscn" or to "item.tscn" it should apply to all child instances of that class
* If an enemy needs something specific, edit their script within their scene
