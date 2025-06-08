#ifndef DATATYPE_H
#define DATATYPE_H

#include <stdint.h>  // for uint8_t, uint16_t, etc.

// MAC address type
typedef uint8_t mac_address_t[6];

// NIC status enum
typedef enum {
    NIC_DOWN = 0,
    NIC_UP = 1
} nic_status_t;

// Ethernet packet structure
typedef struct {
    uint8_t* data;    // pointer to frame data
    uint16_t length;  // length of frame
} nic_packet_t;

// Example global structure
typedef struct {
    mac_address_t mac_address;
    uint32_t ip_address;
    uint32_t subnet_mask;
    uint32_t gateway;

    nic_status_t nic_status;

    // Add more global settings here
    uint8_t some_setting;
    uint16_t another_setting;

} global_config_t;
#endif // DATATYPE_H