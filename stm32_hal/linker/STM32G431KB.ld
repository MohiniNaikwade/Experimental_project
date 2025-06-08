/* STM32G431KB - 128K Flash, 32K RAM, 10K CCMRAM */
ENTRY(Reset_Handler)

/* Define memory regions */
MEMORY
{
    CCMSRAM (xrw) : ORIGIN = 0x10000000, LENGTH = 10K
    RAM     (xrw) : ORIGIN = 0x20000000, LENGTH = 32K
    FLASH   (rx)  : ORIGIN = 0x08000000, LENGTH = 128K
}

/* Sections */
SECTIONS
{
    .isr_vector :
    {
        . = ALIGN(4);
        KEEP(*(.isr_vector))
        . = ALIGN(4);
    } >FLASH

    .text :
    {
        . = ALIGN(4);
        *(.text) *(.text*)
        *(.glue_7) *(.glue_7t)
        KEEP(*(.init))
        KEEP(*(.fini))
        . = ALIGN(4);
        _etext = .;
    } >FLASH

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata) *(.rodata*)
        . = ALIGN(4);
    } >FLASH

    _sidata = LOADADDR(.data);

    .data : 
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data) *(.data*)
        . = ALIGN(4);
        _edata = .;
    } >RAM AT > FLASH

    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss) *(.bss*) *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } >RAM

    ._user_heap_stack :
    {
        . = ALIGN(8);
        . = . + 0x400; /* Stack = 1KB */
        . = . + 0x200; /* Heap = 512B */
        . = ALIGN(8);
        _estack = .;   /* Define estack here */
    } >RAM

    .ARM.attributes 0 : { *(.ARM.attributes) }
}
