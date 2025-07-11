.syntax unified
.cpu cortex-m4
.fpu fpv4-sp-d16
.thumb

.global g_pfnVectors
.global Reset_Handler
.global Default_Handler

.section .isr_vector,"a",%progbits
.type g_pfnVectors, %object

g_pfnVectors:
    .word   _estack
    .word   Reset_Handler
    .word   NMI_Handler
    .word   HardFault_Handler
    .word   MemManage_Handler
    .word   BusFault_Handler
    .word   UsageFault_Handler
    .word   0
    .word   0
    .word   0
    .word   0
    .word   SVC_Handler
    .word   DebugMon_Handler
    .word   0
    .word   PendSV_Handler
    .word   SysTick_Handler

    /* IRQ handlers - you can fill for G431 as needed */
    .word   Default_Handler /* WWDG_IRQHandler */
    .word   Default_Handler /* PVD_PVM_IRQHandler */
    .word   Default_Handler /* RTC_TAMP_LSECSS_IRQHandler */
    .word   Default_Handler /* RTC_WKUP_IRQHandler */
    .word   Default_Handler /* FLASH_IRQHandler */
    .word   Default_Handler /* RCC_IRQHandler */
    /* ... add remaining IRQs for your MCU ... */

.size g_pfnVectors, .-g_pfnVectors

.section .text.Reset_Handler
.type Reset_Handler, %function

Reset_Handler:
    ldr r0, =_estack
    mov sp, r0

    bl SystemInit

    /* Copy .data section */
    ldr r0, =_sdata
    ldr r1, =_edata
    ldr r2, =_sidata

1:
    cmp r0, r1
    ittt lt
    ldrlt r3, [r2], #4
    strlt r3, [r0], #4
    blt 1b

    /* Zero .bss section */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0

2:
    cmp r0, r1
    it lt
    strlt r2, [r0], #4
    blt 2b

    bl main

3:
    b 3b

.size Reset_Handler, .-Reset_Handler

/* Default handler */
.section .text.Default_Handler,"ax",%progbits
Default_Handler:
    b .

.size Default_Handler, .-Default_Handler

/* Weak handlers */
.weak NMI_Handler
.thumb_set NMI_Handler, Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler, Default_Handler

.weak MemManage_Handler
.thumb_set MemManage_Handler, Default_Handler

.weak BusFault_Handler
.thumb_set BusFault_Handler, Default_Handler

.weak UsageFault_Handler
.thumb_set UsageFault_Handler, Default_Handler

.weak SVC_Handler
.thumb_set SVC_Handler, Default_Handler

.weak DebugMon_Handler
.thumb_set DebugMon_Handler, Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler, Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler, Default_Handler
