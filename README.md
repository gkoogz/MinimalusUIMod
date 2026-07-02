# Minimalus UI Mod

Minimalus is a slim, modernized UI texture mod for Guild Wars 1.

This repository publishes the working texture sources for Minimalus so players and modders can inspect, rebuild, remix, and extend the project. The current public release is **Minimalus UI v2.1**, included as a GitHub release asset and mirrored in `release/`.

## Repository Layout

- `assets/Altered/` - edited DDS textures intended to be packaged into Minimalus.
- `assets/Unaltered/` - original dumped DDS textures used as references and remapping inputs.
- `release/Minimalus UI v2.1.tpf` - current stable PC release package.
- `docs/WRAPPING.md` - notes for building a TPF package with uMod Reforged.

## Using Minimalus on PC

1. Download `Minimalus UI v2.1.tpf` from the GitHub release.
2. Open [uMod Reforged](https://github.com/gkoogz/uMod-Reforged) or a TexMod-compatible loader.
3. Launch Guild Wars through the loader.
4. Add the `.tpf` package and enable it.

## Building or Modifying

Edit textures in `assets/Altered/`. Keep filenames intact: uMod/TexMod-style packages infer the target texture hash from names such as `GW.EXE_0xHASH.dds` or equivalent dump names.

To rebuild a package, use [uMod Reforged](https://github.com/gkoogz/uMod-Reforged) and set the package source to `assets/Altered/`. See `docs/WRAPPING.md` for the practical workflow.

## Notes

These files are distributed for Guild Wars UI modding and preservation of Minimalus. The DDS files are derived from Guild Wars texture dumps and edited by the Minimalus project. This repository does not grant rights to the underlying Guild Wars game assets.

Minimalus is non-malicious and purely cosmetic.

See `LICENSE.md` for the community modding permission terms.
