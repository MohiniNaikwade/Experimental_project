#include "nic.h"

int main(void)
{
    // Initialize NIC
    nic_initialize();

    // RX buffer
    uint8_t rx_buffer[RX_BUFFER_SIZE];
    uint16_t rx_length = 0;

    while (1)
    {
        // Receive packet (non-blocking or blocking — implementation will decide)
        nic_receive_packet(rx_buffer, &rx_length);

        if (rx_length > 0)
        {
            // Echo the packet back
            nic_send_packet(rx_buffer, rx_length);

            // Clear rx_length after processing
            rx_length = 0;
        }

        // You can add 1ms task or other housekeeping here
    }
}