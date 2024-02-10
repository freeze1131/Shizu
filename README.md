# Chinese number learning game 
A basic chinese number guessing game that focuses on different topics.

## Covered topics 
 - Unit testing
 - Async await
 - HTTP requests
 - JSON decoding
 - Text to Speech
 - Splash screen



### Splash Screen 
This screen uses animation on appear. Bottom button allows user to skip and let them start the game.

The quote, pinyin and translation comes from the https://github.com/praxeds/chinese-proverbs-api api and generates a random object from it.

Used default request method with task to get data.

![image](https://github.com/freeze1131/Shizu/assets/84195122/603277cb-404b-4e51-9ec3-411b7bddaf42)

### Settings Screen 
Allows user to change the volume of the game. 

AVFoundation is used to control the level of the volume.

![image](https://github.com/freeze1131/Shizu/assets/84195122/c1bdd7b2-7577-4815-ae0d-813a8c57005b)


### Main Game Screen 

User should choose the cirrent option on the screen according to the chinese symbol of the number.       

According to their choises, the game will speak the correct number or will play a random failure sound.

They can toggle the pinyin if they want. 

![image](https://github.com/freeze1131/Shizu/assets/84195122/1e70d7fb-456b-42d3-b856-3af728a05206)      ![image](https://github.com/freeze1131/Shizu/assets/84195122/49383dc5-fba7-49cc-9cb8-13454639f6d1)


## Game Over Screen

Shows a text and a random image from assets to inform the user's score. 

Game will restart if you press anywhere on the screen.

![image](https://github.com/freeze1131/Shizu/assets/84195122/fa727a7a-d7d5-4b0a-8b68-4b3984d890f5)












