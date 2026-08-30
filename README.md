# RE-SUMMONED

A dark fantasy action RPG made in GameMaker.

You play as a high school student trapped in an endless cycle of
death and reincarnation. A fallen god has given you another chance,
but freedom must be earned.

Fight through the dungeon, defeat powerful bosses, unlock abilities,
and uncover the truth behind your resurrection.

---

## GAME FEATURES

- Dark fantasy dungeon exploration
- Real-time sword combat
- Magic abilities
- Ability upgrade tree
- Boss battles
- Boss dialogue and voice lines
- Intro and ending cutscenes
- Demon King final battle
- Atmospheric dungeon environments

---

## STORY

After dying, the protagonist awakens to a mysterious voice.

The voice tells him that death is not the end.

He has been given another chance.

But there is a condition:

He must fight his way through the realm, defeat its strongest
enemies, and earn his freedom.

As the journey continues, the truth behind the endless cycle
begins to reveal itself.

---

## CONTROLS

### MOVEMENT

W / A / S / D
Move the player.

### ATTACK

Use the configured attack key to perform sword attacks.

### ABILITY TREE

TAB
Open / close the ability tree.

W / A / S / D
Navigate the ability tree.

ENTER
Unlock an ability.

### DIALOGUE

ENTER / SPACE
Advance dialogue.

---

## MAIN GAME FLOW

The game starts at the title screen.

1. Start Game
2. Intro dialogue
3. Spawn area
4. Main Room
5. Second Room
6. Fire Boss
7. Demon King
8. Ending Room

---

## BOSS FIGHTS

### IFRIT / FIRE BOSS

The Fire Boss has:

- Health system
- Attacks
- Fireballs
- Taunts
- Defeat sequence

### DEMON KING

The Demon King is the final major boss.

He has:

- Boss health bar
- Sword attacks
- Movement AI
- Fireball attacks
- Taunts during combat
- Intro dialogue
- Defeat dialogue
- Death voice line
- White flash death effect
- Transition to the Ending Room

---

## DEMON KING VOICE LINES

The Demon King uses the following audio:

sndDemonKingMemo1
First entrance dialogue.

sndDemonKingMemo2
Second entrance dialogue.

sndDemonKingTaunt1
Combat taunt.

sndDemonKingTaunt2
Combat taunt.

sndDemonKingDefeat
Final defeat dialogue.

---

## PROJECT STRUCTURE

objects/
Contains gameplay objects and controllers.

rooms/
Contains all game rooms.

sprites/
Contains player, enemy, boss and environment sprites.

sounds/
Contains music, dialogue, voice lines and sound effects.

scripts/
Contains reusable gameplay scripts.

fonts/
Contains game fonts.

---

## IMPORTANT ROOMS

Menu
Main title screen and menu.

intro
Opening story sequence.

SpawnPoint
Beginning gameplay area.

MainRoom
Main dungeon area.

rSecondRoom
Second dungeon area.

FireBossRoom
Fire Boss battle.

DemonLordBossRoom
Demon King battle.

rEndingRoom
Ending sequence after defeating the Demon King.

---

## TITLE SCREEN

The title screen / main menu is located in:

rooms/Menu/

The main menu object is:

oMenu

The menu background/title artwork is:

sMenu

The Menu room already contains the sMenu artwork.

To change the title screen artwork:

1. Open the Sprites folder.
2. Open sMenu.
3. Replace the sprite with your new title-screen artwork.
4. Keep the sprite name as sMenu.

The menu buttons are controlled by:

objects/oMenu/

Create_0.gml
Contains menu settings and options.

Step_0.gml
Handles menu input and room selection.

Draw_64.gml
Draws the menu and options screen.

---

## OPTIONS

The Options menu currently contains:

- Music volume
- SFX volume
- Master volume
- Fullscreen
- Back

Music can be disabled or adjusted through the Music option.

---

## DIALOGUE

Dialogue systems use:

- Typewriter text
- Voice lines
- Dialogue boxes
- ENTER / SPACE to advance
- Voice playback synchronization

Important dialogue objects include:

oIntroDialogue
oDemonKingCutscene
oEndingCutscene
odialogue

---

## DEVELOPMENT

Engine:
GameMaker

Project:
Re-Summoned

Genre:
Action RPG / Dark Fantasy


