SECTIONS
{
    __romPos = 0;
    _gp = 0x8007B5AC;
    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    .header : AT(header_ROM_START) SUBALIGN(4)
    {
        FILL(0x00000000);
        header_DATA_START = .;
        header_s = .;
        BUILD_PATH/asm/header.s.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    .main 0x80010000 : AT(main_ROM_START) SUBALIGN(4)
    {
        FILL(0x00000000);
        main_RODATA_START = .;
        BUILD_PATH/asm/data/800.rodata.s.o(.rodata);
        BUILD_PATH/asm/main.s.o(.rodata);
        BUILD_PATH/asm/10C64.s.o(.rodata);
        BUILD_PATH/src/cache_file_pos.c.o(.rodata);
        BUILD_PATH/asm/11B60.s.o(.rodata);
        BUILD_PATH/asm/decode_data.s.o(.rodata);
        BUILD_PATH/asm/14CB0.s.o(.rodata);
        BUILD_PATH/src/movie.c.o(.rodata);
        BUILD_PATH/asm/156C8.s.o(.rodata);
        . = ALIGN(., 4);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);
        main_TEXT_START = .;
        BUILD_PATH/asm/main.s.o(.text);
        BUILD_PATH/asm/10C64.s.o(.text);
        BUILD_PATH/src/cache_file_pos.c.o(.text);
        BUILD_PATH/asm/11B60.s.o(.text);
        BUILD_PATH/asm/decode_data.s.o(.text);
        BUILD_PATH/asm/14CB0.s.o(.text);
        BUILD_PATH/src/movie.c.o(.text);
        BUILD_PATH/asm/156C8.s.o(.text);
        . = ALIGN(., 4);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);
        main_DATA_START = .;
        _800_rodata__s = .;
        BUILD_PATH/asm/data/800.rodata.s.o(.data);
        main_s = .;
        BUILD_PATH/asm/main.s.o(.data);
        _10C64_s = .;
        BUILD_PATH/asm/10C64.s.o(.data);
        cache_file_pos_c = .;
        BUILD_PATH/src/cache_file_pos.c.o(.data);
        _11B60_s = .;
        BUILD_PATH/asm/11B60.s.o(.data);
        decode_data_s = .;
        BUILD_PATH/asm/decode_data.s.o(.data);
        _14CB0_s = .;
        BUILD_PATH/asm/14CB0.s.o(.data);
        movie_c = .;
        BUILD_PATH/src/movie.c.o(.data);
        _156C8_s = .;
        BUILD_PATH/asm/156C8.s.o(.data);
        _3A3F4_data__s = .;
        BUILD_PATH/asm/data/3A3F4.data.s.o(.data);
        . = ALIGN(., 4);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);
        main_BSS_START = .;
        BUILD_PATH/asm/data/800.rodata.s.o(.bss);
        BUILD_PATH/asm/main.s.o(.bss);
        BUILD_PATH/asm/10C64.s.o(.bss);
        BUILD_PATH/src/cache_file_pos.c.o(.bss);
        BUILD_PATH/asm/11B60.s.o(.bss);
        BUILD_PATH/asm/decode_data.s.o(.bss);
        BUILD_PATH/asm/14CB0.s.o(.bss);
        BUILD_PATH/src/movie.c.o(.bss);
        BUILD_PATH/asm/156C8.s.o(.bss);
        . = ALIGN(., 4);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);
    }
    __romPos += SIZEOF(.main);
    __romPos = ALIGN(__romPos, 4);
    . = ALIGN(., 4);
    main_ROM_END = __romPos;
    main_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
