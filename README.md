# Risc-V GNU Toolchain Docker Image


### Описание
Репозиторий содержит описание docker контейнера на основе Ubuntu 20.04 с RISC-V GNU (Linux-ELF/glibc) тулчейном, собираемым из актуальных исходников на этапе сборки. Поддерживаемые ISA архитектуры rv32i или rv64i плюс стандартные расширения
- (a)tomics
- (m)ultiplication and division
- (f)loat
- (d)ouble
- (g)eneral 

Строка RISC-V ISA определяются путем добавления поддерживаемых расширений к базовому ISA в порядке, указанном выше.

Поддерживаются следующие ABI: ilp32 (32-bit soft-float), ilp32d (32-bit hard-float), ilp32f (32-bit with single-precision in registers and double in memory, niche use only), lp64 lp64f lp64d (то же самое, но с 64-битным типом long и указателями).
