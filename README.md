# ⚔️ Re-summoned

> **A dark fantasy action RPG about death, reincarnation, and the price of freedom.**

You died.

But death was not the end.

Reborn into a mysterious realm, you are given one simple purpose: **fight, survive, and earn your freedom**. What begins as a journey through a strange dungeon soon becomes something much darker.

Fight powerful enemies, explore the Demon King's domain, unlock new abilities, and uncover the truth behind the cycle that keeps bringing you back.

But there is a question you cannot escape:

**Is freedom really being offered to you... or are you simply being entertained?**

---

## 🎮 About the Game

**Re-summoned** is a 2D top-down dark fantasy action RPG developed in **GameMaker**.

The game combines:

* ⚔️ Real-time melee combat
* 🔥 Ranged magic attacks
* 💨 Dash-based movement
* 👹 Boss battles
* 🌳 Ability progression
* 💬 Story-driven dialogue
* 🎬 Cutscenes and video sequences
* 🎵 Dynamic music and sound effects
* 🏰 Dungeon and boss-room exploration
* 🌓 Multiple ending sequences

The player progresses through a series of rooms and encounters while gradually uncovering the story behind their resurrection and the mysterious beings controlling their fate.

---

## 📖 Story

The protagonist begins the game after dying.

Instead of remaining dead, they are given another chance by a mysterious higher power. They are told to defeat the enemies of this realm and earn their freedom.

> *"For my amusement."*

As the journey continues, the protagonist enters the Demon King's domain and encounters increasingly powerful enemies.

After defeating the **Demon King**, the player is led to believe that their journey has finally ended.

However, the supposed ending reveals that something much larger is happening.

The player is confronted by **God**, who reveals that the protagonist's struggle has been part of something far more deliberate.

The journey continues.

And eventually, the player must face the being responsible for the cycle itself.

---

# ⚔️ Gameplay

## Movement

The player can move freely around the game's top-down environments.

Movement supports both:

* **WASD**
* **Arrow Keys**

The character automatically changes their walking animation based on their movement direction.

### Movement Speed

The player has two movement speeds implemented in the project:

* **Walking:** 3
* **Running:** 6

---

## 🗡️ Sword Combat

The player can attack with a sword using:

**Space**

Melee attacks are currently directional and use dedicated left/right attack animations.

A sword swing can damage bosses when the boss is within the attack's effective range.

The combat system prevents a single sword swing from repeatedly damaging the same boss.

---

## 🔥 Magic

The player can cast a ranged fireball using:

**F**

Magic attacks consume **40 Magic** per cast.

Magic regenerates automatically over time.

The player can cast horizontally using dedicated left/right magic animations and fireball sprites.

### Magic Stats

| Attribute     |      Value |
| ------------- | ---------: |
| Maximum Magic |        100 |
| Magic Cost    |         40 |
| Recharge Rate | 0.15/frame |

Maximum Magic can be increased through the ability system.

---

## 💨 Dash

The player can perform a directional dash using:

**Shift**

Dashes travel in the direction the player is currently facing.

The player starts with:

**3 Dashes**

Each dash covers approximately:

**250 pixels**

Dashes are consumed individually and automatically recharge over time.

The number of available dashes can also be increased through the ability system.

---

# 🌳 Ability System

The game features an **Empower** ability tree that allows the player to improve their character.

The ability menu can be opened with:

**Tab**

The system contains three main upgrade branches.

### ❤️ Vitality

Increases maximum health.

| Ability          |   Increase | Cost |
| ---------------- | ---------: | ---: |
| Vitality         | +10 Health |    1 |
| Greater Vitality | +20 Health |    2 |

### ✨ Arcane

Increases maximum magic.

| Ability        |  Increase | Cost |
| -------------- | --------: | ---: |
| Arcane         | +20 Magic |    1 |
| Greater Arcana | +30 Magic |    2 |

### 💨 Momentum

Increases the player's maximum number of dashes.

| Ability    | Increase | Cost |
| ---------- | -------: | ---: |
| Momentum   |  +1 Dash |    1 |
| Swift Dash |  +1 Dash |    2 |

Abilities have prerequisite relationships, meaning the second-tier upgrade must be unlocked after its corresponding first-tier ability.

---

## 💠 Empower Points

Abilities are purchased using **Empower Points**.

The player starts with:

**10 Empower Points**

Unlocked abilities remain effective when moving between rooms.

---

# 👹 Boss Battles

The game contains several major boss encounters.

## 🔥 Ifrit / Fire Boss

The Fire Boss is an early major encounter.

The boss features:

* Health system
* Boss health bar
* Directional animations
* Fireball attacks
* Dash attacks
* Pathfinding around obstacles
* Teleportation behavior
* Boss-specific music
* Taunts
* Defeat sequence

The Fire Boss uses an `mp_grid` navigation system to navigate around collision tiles in the boss arena.

---

## 👑 Demon Lord / Demon King

The **Demon Lord** is the game's central Demon King encounter.

The boss has:

**1000 HP**

The Demon Lord can:

* Move toward the player
* Face the player
* Perform directional sword attacks
* Perform magic attacks
* Launch fireballs
* Perform an area-of-effect attack
* Deal contact/attack damage
* Play boss-specific music
* Trigger a defeat sequence
* Display a dedicated boss health bar

The Demon Lord's sword damage is:

**25**

The boss's regular attack damage is:

**20**

The area attack deals:

**35 damage**

The Demon Lord fight concludes with a dedicated defeat sequence before transitioning into the ending sequence.

---

## 🌑 God

God is the final major boss encounter.

God has:

**1500 HP**

The encounter features multiple attacks based on the player's distance from the boss.

### Close-range attack

Used when the player is within approximately:

**110 pixels**

### Mid-range attack

Used when the player is between:

**111–300 pixels**

### Spread attack

Used when the player is:

**301+ pixels**

The spread attack launches multiple waves of projectiles around the boss, creating a large-area projectile pattern.

God also has:

* Directional attacks
* Contact damage
* Attack cooldowns
* Invincibility/hurt-state checks
* Multiple attack phases
* Void projectiles
* A dedicated boss health bar

---

# 🏰 Game Structure

The project is organized into multiple rooms representing different parts of the story and gameplay.

Current room resources include:

| Room                | Purpose                       |
| ------------------- | ----------------------------- |
| `Menu`              | Main menu                     |
| `intro`             | Opening sequence              |
| `rCutScene`         | Story cutscene                |
| `MainRoom`          | Main exploration area         |
| `rSecondRoom`       | Second story/exploration area |
| `FireBossRoom`      | Fire Boss encounter           |
| `DemonLordBossRoom` | Demon Lord encounter          |
| `rEndingRoom`       | Initial/fake ending sequence  |
| `rTrueBossRoom`     | Final God encounter           |
| `rTrueEnding`       | True ending sequence          |
| `SpawnPoint`        | Player respawn point          |

---

# 🎬 Story & Cutscenes

The game uses several dedicated objects for dialogue and cinematic sequences.

Story systems include:

* Intro dialogue
* Environmental dialogue
* Demon King dialogue
* Ending dialogue
* True ending sequence
* Video-based cinematic sequences
* Dialogue boxes with speaker identification
* Typewriter-style text presentation
* Skip functionality for certain sequences

The project includes several video assets:

```text
datafiles/
├── timelapse.mp4
├── TrueEnding.mp4
└── void_god_intro.mp4
```

---

# 🖥️ Main Menu

The game includes a main menu with:

* **START GAME**
* **OPTIONS**
* **EXIT**

The Options menu provides:

* Music volume
* SFX volume
* Master volume
* Fullscreen toggle
* Back

The menu supports both keyboard navigation and mouse selection.

---

# 🎛️ Controls

| Action                  | Key                 |
| ----------------------- | ------------------- |
| Move Up                 | `W` / `↑`           |
| Move Down               | `S` / `↓`           |
| Move Left               | `A` / `←`           |
| Move Right              | `D` / `→`           |
| Sword Attack            | `Space`             |
| Magic                   | `F`                 |
| Dash                    | `Shift`             |
| Ability Tree            | `Tab`               |
| Ability Tree Navigation | `WASD` / Arrow Keys |
| Unlock Ability          | `Enter`             |
| Close Ability Tree      | `Esc`               |
| Menu Navigation         | `WASD` / Arrow Keys |
| Menu Select             | `Enter` / `Space`   |

### Cutscene / Dialogue

Story sequences also provide on-screen controls for progressing or skipping where supported.

---

# ❤️ Player Stats

The player's base stats are currently:

| Stat           | Starting Value |
| -------------- | -------------: |
| Health         |            100 |
| Maximum Health |            100 |
| Magic          |            100 |
| Maximum Magic  |            100 |
| Walking Speed  |              3 |
| Running Speed  |              6 |
| Maximum Dashes |              3 |
| Dash Distance  |            250 |
| Dash Speed     |             16 |

Health and maximum stats can be modified through the Empower ability tree.

The player also has a temporary **hurt state** and **invincibility period** after taking damage.

If the player's health reaches zero, the game returns the player to the `SpawnPoint` room.

---

# 🧩 Technical Details

## Engine

**GameMaker**

The project was created using:

**GameMaker IDE 2026.0.0.16**

The project runs at:

**60 game updates per second**

---

## Project Structure

The project follows GameMaker's resource-based organization.

```text
Re-summoned/
│
├── datafiles/          # Video and other included files
├── fonts/              # Game fonts
├── objects/            # Game objects and event logic
├── options/            # Platform-specific settings
├── rooms/              # Game rooms
├── scripts/             # Reusable gameplay systems
├── sounds/             # Music and sound effects
├── sprites/             # Character, enemy and environment graphics
├── tilesets/            # Environment tiles
│
├── ReSummoned.yyp       # GameMaker project file
├── ReSummoned.resource_order
├── LICENSE
└── README.md
```

The project currently contains approximately:

* **30 objects**
* **11 scripts**
* **87 sprite resources**
* **38 sound resources**
* **12 rooms**

---

# 🧠 Core Systems

Several reusable GameMaker scripts handle the game's gameplay systems.

### Player Systems

```text
PlayerStateFree
PlayerStateAttack
PlayerStateDash
PlayerStateMagic
PlayerStateRun
PlayerAnimateSprite
PlayerCollision
```

These scripts form the player's state-based movement and combat system.

### Ability Systems

```text
AbilityNode
CreateAbilityTree
UnlockAbility
```

These manage the Empower upgrade system and its prerequisites.

### Global Systems

```text
Global
```

The global system handles shared game information such as ability progression and directional helpers.

---

# 🎵 Audio

The project includes separate music and sound assets for different parts of the game.

Audio is used for:

* Main gameplay
* Boss encounters
* Sword attacks
* Fireballs
* Dashing
* Dialogue
* Ability navigation
* Ability unlocking
* Ability failures
* Boss taunts
* Boss defeats
* Cutscene events

The Options menu allows the player to independently adjust:

* Music
* SFX
* Master volume

---

# 📸 Screenshots

> Screenshots can be added to this section as the project receives more presentation material.

### Main Menu

<img width="1353" height="791" alt="image" src="https://github.com/user-attachments/assets/af4c9ba8-2af9-45f3-8d1c-dfaa5bb0058b" />

<!-- Add screenshot here:
![Main Menu](screenshots/main-menu.png)
-->

### Gameplay

<img width="1355" height="790" alt="image" src="https://github.com/user-attachments/assets/3fd567bb-fe4b-4022-b7c2-6bae8a616ad9" />

<img width="1352" height="787" alt="image" src="https://github.com/user-attachments/assets/70d35f43-dab2-4dee-9e88-37e12df1f8f3" />

<!-- Add screenshot here:
![Gameplay](screenshots/gameplay.png)
-->


### Ability Tree

<img width="1351" height="792" alt="image" src="https://github.com/user-attachments/assets/24575c6a-0e89-48ef-a20a-bd18df207656" />

<!-- Add screenshot here:
![Ability Tree](screenshots/ability-tree.png)
-->

### Fire Boss

<img width="1347" height="795" alt="image" src="https://github.com/user-attachments/assets/1b1b2aab-112d-4790-a2b1-970e3f1397d1" />

<!-- Add screenshot here:
![Fire Boss](screenshots/fire-boss.png)
-->

### Demon Lord

<img width="1342" height="776" alt="image" src="https://github.com/user-attachments/assets/7f77c40c-26b3-4e57-9637-b7e68766d877" />

<!-- Add screenshot here:
![Demon Lord](screenshots/demon-lord.png)
-->

### God Boss

<img width="1351" height="792" alt="image" src="https://github.com/user-attachments/assets/502ea87f-8740-445a-b0ca-b6ceb645e8dc" />

<!-- Add screenshot here:
![God Boss](screenshots/god-boss.png)
-->

### Ending / Story

<img width="1351" height="787" alt="image" src="https://github.com/user-attachments/assets/94cbf785-8be4-40cd-aa3d-d7eb2bf3884f" />

<img width="1342" height="790" alt="image" src="https://github.com/user-attachments/assets/8acd80bd-acf2-4eb3-9a2a-19bc104c9310" />

<!-- Add screenshot here:
![Ending](screenshots/ending.png)
-->

---

# 🛠️ Running the Project

## Requirements

To open and edit the source project, you will need:

* **GameMaker**
* A Windows development environment if targeting the included Windows configuration

The project file is:

```text
ReSummoned.yyp
```

### Opening the Project

1. Install GameMaker.
2. Open GameMaker.
3. Select **Open**.
4. Navigate to the project directory.
5. Open:

```text
ReSummoned.yyp
```

6. Allow GameMaker to finish importing/loading the project resources.
7. Run the project using GameMaker's **Run** command.

---

# 🏗️ Building

The project includes a Windows target configuration.

Current Windows project information includes:

```text
Display Name: ReSummoned
Version: 1.0.0.0
Target: Windows
Game Speed: 60 FPS
VSync: Enabled
```

The Windows executable name configured in the project is currently:

```text
new_blank.exe
```

This can be changed from the Windows platform settings inside GameMaker before creating a final release build.

---

# 🗺️ Game Progression

The game's overall progression follows the story-driven structure below:

```text
                    ┌──────────────┐
                    │   Main Menu  │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │     Intro    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │ Exploration  │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │  Fire Boss   │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │ Demon Lord   │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   Ending     │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │  True Boss   │
                    │     God      │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │ True Ending  │
                    └──────────────┘
```

---

# ✨ Features at a Glance

* [x] Top-down RPG gameplay
* [x] WASD movement
* [x] Arrow-key movement
* [x] Sword combat
* [x] Directional attacks
* [x] Fireball magic
* [x] Dash system
* [x] Dash regeneration
* [x] Health system
* [x] Magic regeneration
* [x] Hurt and invincibility states
* [x] Empower ability tree
* [x] Upgrade prerequisites
* [x] Multiple boss encounters
* [x] Boss health bars
* [x] Boss-specific attack AI
* [x] Boss music
* [x] Dialogue system
* [x] Cutscenes
* [x] Video sequences
* [x] Main menu
* [x] Options menu
* [x] Volume controls
* [x] Fullscreen option
* [x] Ending sequence
* [x] True ending sequence

---

# 📌 Development Notes

This repository contains the **GameMaker source project**, including its gameplay logic, rooms, sprites, sounds, scripts, and included cinematic assets.

Some internal resources are development-oriented, and certain debugging/test functionality remains present in the source code.

For example, the ability system currently contains a development/debug input that can grant an additional Empower Point. This is intended for testing during development and should be removed or disabled before a final release.

---

# 📜 License

This project is released under the **MIT License**.

Copyright © 2026 **Aditya Pudasaini**

See [`LICENSE`](LICENSE) for the complete license text.

---

# 👤 Author

**Aditya Pudasaini**

**Arjan Regmi**

---

<p align="center">

### ⚔️ Re-summoned

*You were given another chance.*

*But freedom always has a price.*

</p>
