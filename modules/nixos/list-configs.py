# Este script lista os arquivos deste diretório. é só copiar e colar o resultado no deaful.nix. fica mais fácil =)

import os

for _, _, arquivos in os.walk('./'):
    for arquivo in arquivos:
        if not arquivo == "default.nix":
            print(f"++ [ (import ./{arquivo}) ]")
