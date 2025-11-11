# Lab 3 - Flag Memory Game
This is a memory game that contains flags from all over the world. The player has to find all the matching pairs.

## Description
The game starts with all the cards face-down. Once the player selects a card, it will flip over, showing the flag that was hidden. When the player flips another card, two possibilities follow. If the cards match, they will stay face-up for the rest of the game. If the cards do not match, when the next card is selected, the two unmatched cards will flip back face-down. In this way, there will never more than two unmatched cards facing up at any point in the game. The game is over once all pairs have been found.

## Implementation
The app uses the MVVM architecture, such that the game logic is handled by the Models, the UI is handled by the Views, and the ViewModel interfaces between the two. The Views will automatically update as the data in the Models change, since the ViewModel, which acts as a bridge, is constantly observed by the Views. Conversely, whenever user input is detected, the Views call functions in the ViewModel, which in turn call functions in the Models that will update the Models' data. In this way, the View and Model can independently operate without needing direct knowledge of each other.

Accordingly, the actual cards and the selection function that determines if the cards are face-up or face-down or matching is contained in the MemoryGame (Model). The MemoryGameStore (ViewModel) creates an instance of the MemoryGame, and feeds it the content that is desired - in this case, flag emojis. The Views observe an instance of the MemoryGameStore, and handle animations, display flags and overlays, and receive user input.

## Authors
jotakik

https://youtu.be/j4T6ZrAVrD0
