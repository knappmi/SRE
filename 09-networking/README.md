# 09 - Networking

## 🎯 Importance

Networking knowledge is essential for SREs because:

- **Troubleshooting**: Debug connectivity and latency issues
- **Architecture**: Design scalable, reliable network topologies
- **Security**: Implement firewalls, VPNs, and secure communications
- **Performance**: Optimize network throughput and latency
- **Monitoring**: Track network metrics and health
- **Disaster Recovery**: Plan for network failures

## 🌐 Concepts Covered

### Fundamentals
- OSI Model and TCP/IP Stack
- IP Addressing (IPv4, IPv6, CIDR)
- DNS and name resolution
- Ports and protocols
- Routing and subnets

### Protocols
- HTTP/HTTPS
- TCP vs UDP
- SSH, FTP, SFTP
- ICMP (ping, traceroute)
- Load balancing protocols

### Tools & Troubleshooting
- ping, traceroute, mtr
- netstat, ss, lsof
- tcpdump, wireshark
- nslookup, dig, host
- curl, wget
- iperf (bandwidth testing)

## 🚀 Getting Started

### Essential Commands

```bash
# Check connectivity
ping google.com
ping6 google.com  # IPv6

# Trace route to destination
traceroute google.com
mtr google.com  # Interactive traceroute

# DNS lookups
nslookup google.com
dig google.com
host google.com

# Network statistics
netstat -tuln  # Listening ports
ss -tuln       # Modern alternative to netstat
lsof -i :80    # What's using port 80

# HTTP debugging
curl -v https://example.com
wget --spider https://example.com

# Capture packets
tcpdump -i eth0 port 80
tcpdump -w capture.pcap

# Network interfaces
ip addr show
ip route show
ifconfig  # Older command
```

## 📖 What You'll Learn

1. **Network Fundamentals**: IP, subnets, routing
2. **DNS**: Resolution, records, troubleshooting
3. **HTTP/HTTPS**: Request/response cycle, headers, status codes
4. **Load Balancing**: Types, algorithms, health checks
5. **Firewalls**: iptables, security groups
6. **Troubleshooting**: Systematic approach to network issues
7. **Performance**: Latency, throughput, packet loss
8. **Security**: TLS/SSL, certificates, encryption

## 💡 Best Practices

### Troubleshooting
- Start at the lowest layer (physical/link)
- Use ping to check basic connectivity
- Check DNS resolution separately
- Verify firewalls and security groups
- Check application logs
- Use packet capture as last resort

### Performance
- Monitor latency and packet loss
- Use CDNs for static content
- Implement connection pooling
- Enable HTTP/2 or HTTP/3
- Compress responses
- Use appropriate timeout values

### Security
- Use TLS/SSL for sensitive data
- Implement network segmentation
- Use private subnets for databases
- Restrict ports and protocols
- Monitor for unusual traffic patterns
- Keep security groups minimal

### Reliability
- Use multiple availability zones
- Implement redundant network paths
- Configure health checks
- Use DNS failover
- Monitor network metrics
- Have runbooks for common issues

## 🎓 Exercise Progression

1. Basic connectivity tests (ping, traceroute)
2. DNS troubleshooting exercises
3. HTTP request/response analysis
4. Packet capture and analysis
5. Load balancer configuration
6. Firewall rule creation
7. Network performance testing
8. Simulate and debug network failures

## 📚 Additional Resources

- [TCP/IP Illustrated](https://www.oreilly.com/library/view/tcpip-illustrated-volume/9780133808865/)
- [High Performance Browser Networking](https://hpbn.co/)
- [Wireshark Documentation](https://www.wireshark.org/docs/)
- [DNS RFC 1035](https://www.ietf.org/rfc/rfc1035.txt)

## ⚠️ Important Notes

- Be careful with packet captures (privacy/security)
- Some commands require root/sudo
- Cloud environments have virtual networking
- Always check security group/firewall rules
- Network issues can manifest as application issues
- Document your network topology
