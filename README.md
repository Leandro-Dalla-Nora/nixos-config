# NixOs config

## Motivação 
Decidi fazer trocar de sistema operacional, pois a minha experiência com o linux mint, que anteriormente usava, não estava de acordo com meus aprendizados sobre novas tecnologias, além de eu estar encomodado com a sua usabilidade. Ao pesquisar sobre sistemas GNU Linux, me deparei com o Arch Linux. Gostei da proposta dele. Porém, quando eu conheci o NixOs e a forma que foi projetado, foi algo que realmente me impressionou. 

Gostei bastante do sistema anti falhas, que permite voltar a gerações anteriores, caso algo desse errado com o sistema. Há casos que você precisa usar o computador e se o sistema cracha, o que fazer? Bem, com o Nixos, você tem uma solução rápida e fácil.

## O que eu aprendi com este projeto
Não aprendi muito sobre a linguagem nix em si, pois a todos os arquivos que compõem o sistema são apenas algumas linhas que definem seus softwares e protocolos, por exemplo. Entretanto, saber que existe o flake para criar novos projetos com ambientes isolados, com suas bibliotecas específicas, desta forma, garante a consistência dos demais projetos e softwares presentes em meu dispositivo.

Algo que acho fundamental é que pude aprimorar a minha disciplina de ficar no computador focado em programar este projeto. É claro, eu me dispercei muitas vezes, muitas mesmo, felizmente me ajudaram a reerguer e seguir em frente.

## Fontes que eu utilizei para o meu aprendizado sobre NixOs config e hyprland

### Sobre o NixOs

[Nix flakes](https://www.youtube.com/watch?v=S3VBi6kHw5c&list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE&index=2)

[Modularidade do NixOs](https://www.youtube.com/watch?v=bV3hfalcSKs)

[Deletar versões antigas do nixos](https://medium.com/thelinux/how-to-remove-old-generations-of-nixos-b072db4ad01e)

### Configuração do NixOs e Hyprland

[Organização do diretório](https://github.com/Frost-Phoenix/nixos-config)

[Configuration collection](https://nixos.wiki/wiki/Configuration_Collection)

[Configuração do Hyprland](https://github.com/justinlime/dotfiles/tree/main/nix/users/brimstone)

[Configuração dos modules/nixos](https://github.com/XNM1/linux-nixos-hyprland-config-dotfiles/tree/main)

### Outros 

[Gtk e Qt](https://www.youtube.com/watch?v=O-VGFH3eMhY)

[Programas para wayland](https://github.com/natpen/awesome-wayland?tab=readme-ov-file)

### Comando para autualizar o nixos
`sudo nixos-rebuild switch --flake .#leandro`
