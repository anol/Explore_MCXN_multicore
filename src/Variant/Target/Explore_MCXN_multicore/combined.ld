MEMORY
{
  /* Define each memory region */
  PROGRAM_FLASH (rx) : ORIGIN = 0x0, LENGTH = 0xc0000 /* 768K bytes (alias Flash) */
  Ram0 (rwx) : ORIGIN = 0x20000000, LENGTH = 0x4c000 /* 304K bytes (alias RAM) */
  Ram1 (rwx) : ORIGIN = 0x2004e000, LENGTH = 0x1a000 /* 104K bytes (alias RAM2) */
  rpmsg_sh_mem (rwx) : ORIGIN = 0x2004c000, LENGTH = 0x2000 /* 8K bytes (alias RAM3) */
}

SECTIONS {
  .text : { *(.text) } > PROGRAM_FLASH
  .ARM.extab : { *(.ARM.extab) } > PROGRAM_FLASH
  .ARM.exidx : { *(.ARM.exidx) } > PROGRAM_FLASH
  .data_RAM2_core_m33slave_text : { *(.data_RAM2_core_m33slave_text) } > PROGRAM_FLASH
  .data_RAM2_core_m33slave_ARM_extab : { *(.data_RAM2_core_m33slave_ARM_extab) } > PROGRAM_FLASH
  .data_RAM2_core_m33slave_ARM_exidx : { *(.data_RAM2_core_m33slave_ARM_exidx) } > PROGRAM_FLASH
  .data_RAM2_core_m33slave_data : { *(.data_RAM2_core_m33slave_data) } > PROGRAM_FLASH
  .data_RAM2 : { *(.data_RAM2) } > PROGRAM_FLASH
  .data_RAM3 : { *(.data_RAM3) } > PROGRAM_FLASH

  .uninit_RESERVED : { *(.uninit_RESERVED) } > Ram0
  .data : { *(.data) } > Ram0
  .bss_RAM2 : { *(.bss_RAM2) } > Ram1
  .bss_RAM3 : { *(.bss_RAM3) } > rpmsg_sh_mem
  .bss : { *(.bss) } > Ram0
  .noinit_RAM2 : { *(.noinit_RAM2) } > Ram1
  .noinit_RAM3 : { *(.noinit_RAM3) } > rpmsg_sh_mem
  .noinit : { *(.noinit) } > Ram0
  .heap : { *(.heap) } > Ram0
  .heap2stackfill : { *(.heap2stackfill) } > Ram0
  .stack : { *(.stack) } > Ram0
 }
