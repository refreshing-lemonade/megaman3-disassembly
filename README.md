# Mega Man 3 (NES) Disassembly

### by Raidenthequick

Disassembly is 100% finished, including code and data. Assembles to 100% clean ROM under [this version of xkas-plus](https://github.com/Raidenthequick/xkas-plus). I modified it a bit for performance and I prefer ; comments. A Windows build is included in this repository for convenience.

Version:
NTSC-U (United States)

Assembling instructions:
`./xkas -o mm3.nes assemble.asm`

This game uses the MMC3 mapper chip, and contains 32 PRG banks and 16 CHR banks of $2000 bytes each.

The disassembly is complete and assembles to clean but not all code is documented yet. Feel free to contribute documentation via pull request or just message and ask me to add you as a contributor if you want to help out more seriously.
