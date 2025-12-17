/*
 * GENERATED FILE - DO NOT EDIT
 * Copyright 2008-2013 Code Red Technologies Ltd,
 * Copyright 2013-2025 NXP
 * SPDX-License-Identifier: BSD-3-Clause
 * Generated linker script file for MCXN947
 * Created from linkscript.ldt by FMCreateLinkLibraries
 * Using Freemarker v2.3.30
 * MCUXpresso IDE v24.12 [Build 148] [2025-01-10] on 15. des. 2025, 20:03:08
 */


/*GROUP (*/
/*  "libcr_nohost_nf.a"*/
/*  "libcr_c.a"*/
/*  "libcr_eabihelpers.a"*/
/*  "libgcc.a"*/
/*)*/

MEMORY
{
  /* Define each memory region */
  Ram1 (rwx) : ORIGIN = 0x2004e000, LENGTH = 0x1a000 /* 104K bytes (alias RAM) */
  rpmsg_sh_mem (rwx) : ORIGIN = 0x2004c000, LENGTH = 0x2000 /* 8K bytes (alias RAM2) */
}

  /* Define a symbol for the top of each memory region */
  __base_Ram1 = 0x2004e000  ; /* Ram1 */
  __base_RAM = 0x2004e000 ; /* RAM */
  __top_Ram1 = 0x2004e000 + 0x1a000 ; /* 104K bytes */
  __top_RAM = 0x2004e000 + 0x1a000 ; /* 104K bytes */
  __base_rpmsg_sh_mem = 0x2004c000  ; /* rpmsg_sh_mem */
  __base_RAM2 = 0x2004c000 ; /* RAM2 */
  __top_rpmsg_sh_mem = 0x2004c000 + 0x2000 ; /* 8K bytes */
  __top_RAM2 = 0x2004c000 + 0x2000 ; /* 8K bytes */

ENTRY(ResetISR)

SECTIONS
{
     /* MAIN TEXT SECTION */
    .text : ALIGN(4)
    {
        FILL(0xff)
        __vectors_start__ = ABSOLUTE(.) ;
        KEEP(*(.isr_vector))
        /* Global Section Table */
        . = ALIGN(4) ;
        __section_table_start = .;
        __data_section_table = .;
        LONG(LOADADDR(.data));
        LONG(    ADDR(.data));
        LONG(  SIZEOF(.data));
        LONG(LOADADDR(.data_RAM2));
        LONG(    ADDR(.data_RAM2));
        LONG(  SIZEOF(.data_RAM2));
        __data_section_table_end = .;
        __bss_section_table = .;
        LONG(    ADDR(.bss));
        LONG(  SIZEOF(.bss));
        LONG(    ADDR(.bss_RAM2));
        LONG(  SIZEOF(.bss_RAM2));
        __bss_section_table_end = .;
        __section_table_end = . ;
        /* End of Global Section Table */

        *(.after_vectors*)

       *(.text*)
       KEEP(*freertos*/tasks.o(.rodata*)) /* FreeRTOS Debug Config */
       *(.rodata .rodata.* .constdata .constdata.*)
       . = ALIGN(4);
    } > Ram1
    /*
     * for exception handling/unwind - some Newlib functions (in common
     * with C++ and STDC++) use this.
     */
    .ARM.extab : ALIGN(4)
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > Ram1

    .ARM.exidx : ALIGN(4)
    {
        __exidx_start = .;
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
        __exidx_end = .;
    } > Ram1
 
    _etext = .;
        
    /* DATA section for rpmsg_sh_mem */

    .data_RAM2 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM2 = .) ;
        PROVIDE(__start_data_rpmsg_sh_mem = .) ;
        *(.ramfunc.$RAM2)
        *(.ramfunc.$rpmsg_sh_mem)
        *(.data.$RAM2)
        *(.data.$rpmsg_sh_mem)
        *(.data.$RAM2.*)
        *(.data.$rpmsg_sh_mem.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM2 = .) ;
        PROVIDE(__end_data_rpmsg_sh_mem = .) ;
     } > rpmsg_sh_mem AT>Ram1

    /* MAIN DATA SECTION */
    .uninit_RESERVED (NOLOAD) : ALIGN(4)
    {
        _start_uninit_RESERVED = .;
        KEEP(*(.bss.$RESERVED*))
       . = ALIGN(4) ;
        _end_uninit_RESERVED = .;
    } > Ram1 AT> Ram1

    /* Main DATA section (Ram1) */
    .data : ALIGN(4)
    {
       FILL(0xff)
       _data = . ;
       PROVIDE(__start_data_RAM = .) ;
       PROVIDE(__start_data_Ram1 = .) ;
       *(vtable)
       *(.ramfunc*)
       KEEP(*(CodeQuickAccess))
       KEEP(*(DataQuickAccess))
       *(RamFunction)
       *(.data*)
       . = ALIGN(4) ;
       _edata = . ;
       PROVIDE(__end_data_RAM = .) ;
       PROVIDE(__end_data_Ram1 = .) ;
    } > Ram1 AT>Ram1

    /* BSS section for rpmsg_sh_mem */
    .bss_RAM2 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM2 = .) ;
       PROVIDE(__start_bss_rpmsg_sh_mem = .) ;
       *(.bss.$RAM2)
       *(.bss.$rpmsg_sh_mem)
       *(.bss.$RAM2.*)
       *(.bss.$rpmsg_sh_mem.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM2 = .) ;
       PROVIDE(__end_bss_rpmsg_sh_mem = .) ;
    } > rpmsg_sh_mem AT> rpmsg_sh_mem

    /* MAIN BSS SECTION */
    .bss (NOLOAD) : ALIGN(4)
    {
        _bss = .;
        PROVIDE(__start_bss_RAM = .) ;
        PROVIDE(__start_bss_Ram1 = .) ;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4) ;
        _ebss = .;
        PROVIDE(__end_bss_RAM = .) ;
        PROVIDE(__end_bss_Ram1 = .) ;
        PROVIDE(end = .);
    } > Ram1 AT> Ram1

    /* NOINIT section for rpmsg_sh_mem */
    .noinit_RAM2 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM2 = .) ;
       PROVIDE(__start_noinit_rpmsg_sh_mem = .) ;
       *(.noinit.$RAM2)
       *(.noinit.$rpmsg_sh_mem)
       *(.noinit.$RAM2.*)
       *(.noinit.$rpmsg_sh_mem.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM2 = .) ;
       PROVIDE(__end_noinit_rpmsg_sh_mem = .) ;
    } > rpmsg_sh_mem AT> rpmsg_sh_mem

    /* DEFAULT NOINIT SECTION */
    .noinit (NOLOAD): ALIGN(4)
    {
        _noinit = .;
        PROVIDE(__start_noinit_RAM = .) ;
        PROVIDE(__start_noinit_Ram1 = .) ;
        *(.noinit*)
         . = ALIGN(4) ;
        _end_noinit = .;
       PROVIDE(__end_noinit_RAM = .) ;
       PROVIDE(__end_noinit_Ram1 = .) ;        
    } > Ram1 AT> Ram1

    /* Reserve and place Heap within memory map */
    _HeapSize = 0x1000;
    .heap (NOLOAD) :  ALIGN(4)
    {
        _pvHeapStart = .;
        . += _HeapSize;
        . = ALIGN(4);
        _pvHeapLimit = .;
    } > Ram1

     _StackSize = 0x1000;
     /* Reserve space in memory for Stack */
    .heap2stackfill (NOLOAD) :
    {
        . += _StackSize;
    } > Ram1
    /* Locate actual Stack in memory map */
    .stack ORIGIN(Ram1) + LENGTH(Ram1) - _StackSize - 0 (NOLOAD) :  ALIGN(4)
    {
        _vStackBase = .;
        . = ALIGN(4);
        _vStackTop = . + _StackSize;
    } > Ram1

    /* Provide basic symbols giving location and size of main text
     * block, including initial values of RW data sections. Note that
     * these will need extending to give a complete picture with
     * complex images (e.g multiple Flash banks).
     */
    _image_start = LOADADDR(.text);
    _image_end = LOADADDR(.data) + SIZEOF(.data);
    _image_size = _image_end - _image_start;
}
