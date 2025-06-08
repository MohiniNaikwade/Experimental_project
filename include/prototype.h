#ifndef PROTOTYPE_H
#define PROTOTYPE_H

#include "datatype.h"

// Initialize the NIC hardware
void nic_initialize(void);

// Send packet (raw frame)
void nic_send_packet(const uint8_t* data, uint16_t length);

// Receive packet (raw frame)
void nic_receive_packet(uint8_t* buffer, uint16_t* length);

#endif // PROTOTYPE_H