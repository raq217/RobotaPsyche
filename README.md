# RobotaPsyche

Flow fields:


![flowfield](https://user-images.githubusercontent.com/66205383/107911789-a7626680-6f76-11eb-8bf4-79c8d6683453.gif)


For this project I was quite new to ArrayLists so I just wanted to achieve a simple understanding of it. My main aim was to take an artistic approach to the assignment, allowing the user to be the vehicle with their mouse and draw something simple but satisfying at the same time. 

Main difficulties:

- I faced some difficulty in setting up the flow field to work through the center which is why it remains to flow outside of the screen. This didn't turn out too bad at the end as a center flow field would just leave an end result of a blob. 

- Another difficulty I faced was having the generated flows of the mouse flow out of the canvas rather than flowing back into it. This was solved by using this:
    catch (ArrayIndexOutOfBoundsException e) {
      return null;

One question I would have is how to allow the the flow field to change at the same direction of the user's mouse along with the path of the drawings. It would've been interesting to see the line direction change as well as the ArrayLists.
