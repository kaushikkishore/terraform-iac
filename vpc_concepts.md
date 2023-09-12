## Explaining the VPC and Subnet concepts in terms of AWS

1. VPC (Virtual Private Cloud):

Imagine AWS as a massive data center with thousands of servers and resources spread across different physical locations. AWS VPC is like your very own private section within this data center. It's a virtual network environment that you create and control.

Analogous to a Private Office: Think of a VPC as your own private office space within a large office building. It's your exclusive area, and you can configure it the way you want.

Isolation: VPCs provide isolation from other AWS customers. It means your resources in your VPC are not shared with others, just like your private office is not shared with other companies.

Control: You have full control over the network settings, IP address ranges, and how resources communicate within your VPC. It's like you decide how the rooms in your office are arranged.

2. Subnet:

Inside your VPC, you can create subnets. Subnets are like different rooms or sections within your private office. Each subnet has its own purpose and configuration.

Rooms in Your Office: Imagine your VPC as your office building, and each subnet as a different room or section within your office.

IP Address Range: Each subnet has its own range of IP addresses. This is similar to how rooms in your office have different addresses.

Purpose: Subnets are often used to group similar resources together. For example, you might have one subnet for web servers and another for database servers. It's like having a meeting room and a storage room in your office.

Isolation: Subnets can provide further isolation within your VPC. Resources in one subnet might not directly communicate with resources in another subnet unless you set up rules to allow it. This is similar to how access to different rooms in your office might be restricted.

### Lets understand through and example of CIDR block

If you have a VPC with a CIDR block of 10.0.0.0/24 and you want to divide it into three subnets, you can do so by splitting the available IP address space evenly among the subnets. Here's how you can divide it into three subnets:

Determine the Subnet CIDR Blocks:

Given the 10.0.0.0/24 CIDR block, which provides 256 IP addresses, you can divide it into three subnets with 85 IP addresses each.

Here's a possible breakdown:

Subnet 1: 10.0.0.0/26 (64 IP addresses)
Subnet 2: 10.0.0.64/26 (64 IP addresses)
Subnet 3: 10.0.0.128/26 (64 IP addresses)
Each subnet has 64 usable IP addresses, and you can adjust the sizes or configurations based on your specific needs.

### How to calculate CIDR block ranges

To determine the number of IP addresses that can come under the CIDR block 10.0.0.0/24, you can use the following logic:

A CIDR notation like 10.0.0.0/24 specifies that the first 24 bits of the IP address are used for the network portion, leaving 8 bits for host addresses. In IPv4, there are 32 bits in total.

Here's how you calculate the number of IP addresses:

Calculate the number of bits available for host addresses:

Total bits in an IPv4 address: 32 bits
Bits used for the network portion (specified in the CIDR notation): 24 bits
Bits available for host addresses: 32 - 24 = 8 bits

Calculate the number of host addresses:

To calculate the number of host addresses, raise 2 to the power of the number of available bits for host addresses (8 bits in this case):

Number of host addresses = 2^8 = 256

So, under the CIDR block 10.0.0.0/24, there are 256 available IP addresses (from 10.0.0.0 to 10.0.0.255). However, the first and last IP addresses in the block (10.0.0.0 and 10.0.0.255) are typically reserved for network identification and broadcast, respectively, leaving 254 usable IP addresses for devices or resources in this subnet.
