# Monitoring & Observability Exercises

## 📁 Structure

- **prometheus/** - Prometheus configuration, alerts, alertmanager
- **grafana/** - Grafana datasources and dashboards
- **docker-compose.yml** - Complete monitoring stack

## 🎯 Exercise Approach

### 1. Study the Existing Configuration

```bash
# Review Prometheus config
cat prometheus/prometheus.yml
cat prometheus/alerts.yml
cat prometheus/alertmanager.yml

# Start the stack
docker-compose up -d
```

Access:
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000 (admin/admin)
- Alertmanager: http://localhost:9093

### 2. Practice Exercises

**Beginner:**
- Explore Prometheus UI and run basic PromQL queries
- View existing alerts in Prometheus
- Import dashboards in Grafana
- Modify scrape intervals

**Intermediate:**
- Add new scrape targets
- Create custom alerts
- Build Grafana dashboards
- Configure alert notifications (email, Slack)
- Create recording rules

**Advanced:**
- Set up service discovery
- Implement federation
- Create complex PromQL queries
- Design comprehensive dashboards
- Set up long-term storage

## 💡 Practice Ideas

### Prometheus Exercises

1. **PromQL Queries**
   ```promql
   # CPU usage
   100 - (avg by(instance)(irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
   
   # Memory usage
   (node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / node_memory_MemTotal_bytes * 100
   
   # Request rate
   rate(http_requests_total[5m])
   ```

2. **Custom Alerts**
   - High CPU usage (>80% for 5 minutes)
   - High memory usage (>90%)
   - Disk space low (<10% free)
   - Service down (up == 0)

3. **Recording Rules**
   - Pre-calculate expensive queries
   - Create aggregated metrics
   - Improve dashboard performance

### Grafana Exercises

1. **Dashboard Creation**
   - System metrics (CPU, memory, disk)
   - Application metrics (requests, errors, latency)
   - Business metrics
   - Use variables for dynamic dashboards

2. **Visualization Types**
   - Time series graphs
   - Gauge panels
   - Stat panels
   - Table panels
   - Heatmaps

3. **Advanced Features**
   - Template variables
   - Annotations
   - Alerts
   - Snapshot sharing

## 🔧 Useful Commands

```bash
# Start stack
docker-compose up -d

# View logs
docker-compose logs -f prometheus
docker-compose logs -f grafana

# Validate Prometheus config
docker exec <prometheus-container> promtool check config /etc/prometheus/prometheus.yml

# Validate alert rules
docker exec <prometheus-container> promtool check rules /etc/prometheus/alerts.yml

# Reload configuration
curl -X POST http://localhost:9090/-/reload
```

## 📚 Key Concepts

- Metrics collection and scraping
- PromQL query language
- Alert rules and alertmanager
- Grafana dashboards
- Service discovery
- Recording rules
- Federation
- Long-term storage
- High availability
- Four golden signals (latency, traffic, errors, saturation)

## 🎓 Monitoring Best Practices

1. Monitor the four golden signals
2. Use RED method (Rate, Errors, Duration)
3. Create actionable alerts (avoid alert fatigue)
4. Design meaningful dashboards
5. Document runbooks for alerts
6. Monitor from user perspective
7. Set appropriate thresholds
8. Use labels effectively
