#include "nic.h"

// Define global instance + pointer
global_config_t global_config_instance;
global_config_t* g_config = &global_config_instance;

int main(void)
{
    // Initialize NIC
    nic_initialize();

    // Example — set IP
    g_config->ip_address = 0xC0A80164; // 192.168.1.100
    
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

        // Example — use global config
        if (g_config->nic_status == NIC_UP)
        {
            // Do something
        }        

        // You can add 1ms task or other housekeeping here
    }
}