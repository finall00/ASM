# Estudos de Assembly

Repositório para armazenar os códigos dos meus estudos de Assembly.

## Por que estudar Assembly?

Simples: Assembly é legal... Brincadeira (ou não).

Estudar uma linguagem de baixo nível  (C, C++, Rust ou Assembly) proporciona uma compreensão muito mais profunda de como o computador realmente funciona por trás dos panos.

Linguagens de alto (Java, JavaScript, Python ou Go) abstraem muitos detalhes importantes. E isso é ótimo na maioria dos casos, pois não precisamos nos preocupar com coisas como alocação de memória toda vez que criamos uma variável — ou com a responsabilidade de desalocar tudo depois.

Porém, para quem está aprendendo ou quer ir além do básico, entender o que está acontecendo lá embaixo (registradores, stack, heap, chamadas de sistema) é essencial para evoluir como desenvolvedor.


## Run

Para facilitar minha vida criei alguns scripts. vamos rodar os codiguinhos agora:

Clone o projeto

```bash
  git clone https://github.com/finall00/ASM.git
```

vá para o diretorio principal e use os scripts `.sh` 

```bash
  ./run.sh hello
```

script de build

```bash
  ./build.sh hello
```

Para poder debugar podemos usar o `build.sh` com a flag `-d` ou 

```bash
  ./gdb.sh hello
```

para abrir o [gdb](https://sourceware.org/gdb) no projeto

ou podemo rodar os comandos direto né. primeiro vamos criar nosso `.o`

```bash
  nasm -g -f elf64 -g src/hello.asm -o target/hell.o 
```

> [!info] nota
>  a flag `-g` indica que nosso projeto sera buildado com as info de debug

com o `.o` vamos linka-lo e tranformar "magicamente" em um executavel

```bash
  ld target/$1.o -o target/$1
```


