# Wrapping Minimalus With uMod Reforged

uMod Reforged is the maintained Guild Wars-focused continuation of the uMod/TexMod texture workflow.

Repository: https://github.com/gkoogz/uMod-Reforged

## Package Workflow

1. Build or download uMod Reforged.
2. Open uMod Reforged.
3. Go to the **Mod Maker** workflow.
4. Set the package source folder to the PC altered texture folder:

   ```text
   assets/Altered
   ```

5. Confirm that the edited `.dds` textures are listed.
6. Use **Build TPF** / **Save Package**.
7. Name the package something like:

   ```text
   Minimalus UI v3.0.tpf
   ```

8. Test the package by launching Guild Wars through uMod Reforged and enabling the generated TPF.

## Important Filename Rule

Do not rename texture files casually.

The wrapper expects texture hashes to be recoverable from filenames. Typical names look like:

```text
GW.EXE_0x030E740B.dds
Gw_T_0XF643F278.dds
AndroidMobile_256x64_<hash>_tex<id>.dds
```

The exact hash-bearing filename is how the loader knows which original in-game texture should be replaced.

Android/Reforged mobile captures use the `AndroidMobile_...` naming pattern and are kept in `assets/AlteredMobile/` and `assets/UnalteredMobile/`. Keep them out of the standard PC package source unless you are deliberately building a mobile/remapped variant.

## Editing Workflow

1. Use `assets/Unaltered/` as your original PC reference dump.
2. Edit the corresponding texture.
3. Save the edited DDS into `assets/Altered/`.
4. Preserve the original dimensions and format unless you know the target loader/game path supports the change.
5. Rebuild the TPF.
6. Test in game.

## Compatibility

The v2.1 TPF is compatible with the classic TexMod/uMod workflow. uMod Reforged is preferred because it has a modernized Guild Wars workflow, supports packaging from a directory of DDS files, and keeps the mod-maker loop much smoother.
