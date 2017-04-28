interface {
        minor = 0                   /* board index, minor = 0 uses /dev/gpib0, minor = 1 uses /dev/gpib1, etc. */
        board_type = "raspi_gpio"   /* type of interface board being used */
        name = "gpio_interface"     /* optional name, allows you to get a board descriptor using ibfind() */
        pad = 0                     /* primary address of interface             */
        sad = 0                     /* secondary address of interface           */
        timeout = T3s               /* timeout for commands */

        eos = 0x0d      /* EOS Byte, 0xa is newline and 0xd is carriage return */
        set-reos = yes  /* Terminate read if EOS */
        set-bin = no    /* Compare EOS 8-bit */
        set-xeos = no   /* Assert EOI whenever EOS byte is sent */
        set-eot = yes   /* Assert EOI with last byte on writes */

        base = 0        /* Base io ADDRESS                  */
        irq  = 0        /* Interrupt request level */
        dma  = 0        /* DMA channel (zero disables)      */

        master = yes    /* interface board is system controller */
}


device {
        minor = 0
        name = "DMM 196"
        pad = 9
        sad = 96

        eos = 0x0a
        set-reos = yes
        set-bin = no
}

device {
        minor = 1
        name = "Keysight AWG"
        pad = 7
        sad = 97

        eos = 0x0a
        set-reos = yes
        set-bin = no
}
