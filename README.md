# Курсовая работа по АВС. 5 семестр
### Описание
Репозиторий содержит описание docker контейнера на основе Ubuntu 20.04 с RISC-V GNU (Linux-ELF/glibc) тулчейном, собираемым из актуальных исходников на этапе сборки. Поддерживаемые ISA архитектуры rv32i или rv64i плюс стандартные расширения
- (a)tomics
- (m)ultiplication and division
- (f)loat
- (d)ouble
- (g)eneral 

Строка RISC-V ISA определяются путем добавления поддерживаемых расширений к базовому ISA в порядке, указанном выше.

Поддерживаются следующие ABI: ilp32 (32-bit soft-float), ilp32d (32-bit hard-float), ilp32f (32-bit with single-precision in registers and double in memory, niche use only), lp64 lp64f lp64d (то же самое, но с 64-битным типом long и указателями). 

### Сборка
Для сборки образа необходимо передать 2(два) обязательных аргумента: ARCH для архитектуры(ISA) и ABI для ABI.

Для построения 32-битного тулчейна RV32GC используйте

```sh
$ docker build . --build-arg ARCH=rv32gc --build-arg ABI=ilp32d
```

### Запуск

Контейнер будем запускать с входом в bash и удалением контейнера после выхода для экономии места

```sh
$ docker run -it --rm [tag или id образа] /bin/bash
```

Для удобства можем прикрепить volume к папке /riscv-projects
```sh
$ docker run -it -v [например, ~/Documents]:/riscv-projects --rm [tag или id образа] /bin/bash
```