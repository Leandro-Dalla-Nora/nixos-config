import os

for _, _, arquivos in os.walk('./'):
    for arquivo in arquivos:
        if not arquivo == "default.nix":
            print(f"./modules/nixos/{arquivo}")