# Jump and Cut the Rope, Doodle!
Christina Ye, Jia xin "Angel" Xie  APCS   Period 3, Final Project

### Prototype:

* First Draft: https://docs.google.com/document/d/1Tf1jd-cnZ22wW72HbPox8vCpN2YebZQI8Kpt9DfUtTo/edit?usp=sharing
* Final Draft: https://docs.google.com/document/d/1NNeYsmN87iQ-JXJeBQwNwS3cWRRKu-ZWF6JkeaXHaKc/edit?usp=sharing

### Project Description:
Our project is a combination of the games Doodle Jump and Cut the Rope. The player will control the doodle character using jump, left, and right keys. The player must also cut the rope and use different elements of the game to feed the character with candy in order to win. The game will have multiple levels each with different features including monsters and spikes that the player has to avoid. If the character or the candy drops to the ground, the player loses and the game restarts.

##### Game Directions:

* To move the character - Jump is the 'e' key, left is the 's' key, and right is the 'f' key
* To cut the rope, the player must click and drag across the rope.
* Spikes will break the candy.
* Monsters will kill the Doodle character by touching it or hitting it with a bullet.
* The player should try to get all three stars and obtain the candy.

Run Instructions: This is a processing based program, you may have to download the sound library.

### Development Log

Christina Ye | JiaXin (Angel) Xie
--- | ---
5/14/2022 | 5/14/2022
We brainstormed for our projects by examining our favorite games and processing  projects. We decided to create a game that combines Doodle and Cut the Rope | We brainstormed for our projects by examining our favorite games and processing projects. We decided to create a game that combines Doodle and Cut the Rope
5/21/2022 | 5/21/2022
We discussed our plan for the project in detail and completed our outline for the prototype. | We discussed our plan for the project in detail and completed our outline for the prototype
5/24/2022 | 5/23/2022
I created the steps class to display green steps and worked on displaying the candy and rope in candy class. Then merged to the main branch. | Worked on main and doodle. Ensured that everything is displayed properly  and that doodle is functioning as intended
5/25/2022 | 5/24/2022
I tried making the candy attached to rope and a fixed point follow orb physics and worked displaying the star in addStar. | Debugged the doodle class
5/26/2022 | 5/25/2022
Continued working on debugging the physics of the candy. Modified original design by deleting unnecessary methods and fixed attract method issues. | Deal with merging issues because my partner and I had different names for our sketch tab
5/27/2022 | 5/26/2022
Tried figuring out why the attract method did not work at all. | Ensures that the game restarts when doodle falls off the screen
5/29/2022 | 5/27/2022
Imported images for the candy and stars. Stars can now be displayed and achieved. Then, I worked on the cut method to delete fixedPoints and “cut” the rope when mousePresses on it. | Worked on the monster class and ensure that the monster can attack doodle
5/30/2022 | 5/28/2022
Merged main branch onto my branch. Fixed attract method so candy has physics when attached to the rope. | Debugged the current code and ensure that restart and pause buttons are working
5/31/2022 | 5/29/2022
Made the restart and pause icons then, merged into the main branch and created the demo branch. Created spike class to display spikes which is a line of triangles that can break the candy. | Met with Partner to resolve issues related to the physics in the candy class. Resolved merge conflicts.
6/1/2022 | 5/30/2022
Tried working on the cut method to actually cut the rope by finding the intersection between the mouseDragged line and the rope. Program freezes when I try to test it. | Created the image for when the doodle wins. Worked on the animation when doodle successfully received his candy
6/2/2022 | 5/31/2022
Fixed the freeze but tried to figure out why the cut method cuts the opposite rope. Also, created the win class to display a tab after the player wins. | Successfully implemented the celebration animation, where doodle jumps and creates sprinkles after it receives the candy. Fixed the problem so that the doodle always lands on the top of the step. Made the game restart everytime doodle dies or candy drops
6/3/2022 | 6/1/2022
Cutting rope in mouseDragged now works after I deleted the boolean for the y value. | Discussed with Christina about how to ensure that we can cut the rope directly instead of cutting the fixpoint of the string
6/4/2022 | 6/2/2022
Used the button class to create buttons for the winning tab. | Helped Christina with debugging the cut method.
6/6/2022 | 6/4/2022
Worked on the spikes breaking the candy feature. Candy bounces weirdly on them upon contact. | Worked on the bullet feature for monsters. Added background music for the game. Discovered and resolved bugs in the celebration animation. Merged with the main branch and resolved merge conflicts.
6/7/2022 | 6/6/2022
Created animation of candy shattering when it hits the spikes. | Presented a Demo in class. Brainstormed how to create the rope simulation with Christina.
6/8/2022 | 6/7/2022
Modified the candy so the doodle won’t eat it if broken.  | Created a new drawline method based on yesterday’s brainstorming. that would break the strings into equal segments.
6/9/2022 | 6/8/2022
Made a timer to display the win tab five seconds after winning animation and made the corner buttons stop working when the win tab appears. Met with Angel to debug the problems in our code. | Modifying the original attract methods in candy to work on rope. Studying different parts of the code to figure out what’s wrong with the rope codes.
6/10/2022 | 6/9/2022
Created a new mode system to make a menu page and now the menu button works. | Continued to try fixing the rope simulation. Created a Node class. Tried creating an array to store the nodes. Implemented all the methods, but still need to figure out why the ropes are not displaying. Met with Christina and debugged issues associated with the victory celebration and tab. Added three buttons and created a timer variable.
6/11/2022 | 6/10/2022
All button functions for the win tab function correctly. Then reorganized main.pde to group into levels. Had to debug with Angel after moving around the code. | Trying to debug rope-related methods. It seems to be displaying rope multiple times. Modify different methods to figure out what’s wrong.
6/12/2022 | 6/11/2022
Made three distinct levels and added star features. Created buttons for each level. Fixed the bug that allowed the doodle to move after victory. Met with Angel to debug any remaining problems in the code. Worked on the README file. | Continue to try to figure out how to create the rope-like effect for the string. Referenced OrbChain Lab.It’s finally working! Met with Christina to fix the bugs that are created after implementing the level system. Debugged rope by changing the List array to ArrayList. Resolved merge conflicts together
N/A | 6/12/2022
N/A | Resolved some errors that resulted from merging. Fixed the prototype and the UML. Met with Christina to resolve issues associated with the level system.
