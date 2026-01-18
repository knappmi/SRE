# 07 - Monitoring & Observability

## 🎯 Importance

Monitoring and Observability are core SRE responsibilities:

- **Visibility**: Understand system behavior and health
- **Alerting**: Detect issues before users do
- **Debugging**: Troubleshoot problems quickly
- **Capacity Planning**: Predict resource needs
- **SLO Tracking**: Measure reliability objectives
- **Performance**: Identify bottlenecks and optimize

The three pillars of observability are: **Metrics**, **Logs**, and **Traces**.

## 📊 Tools Covered

### Prometheus
- Time-series metrics database
- Pull-based metric collection
- Powerful query language (PromQL)
- Built-in alerting

### Grafana
- Visualization and dashboards
- Supports multiple data sources
- Alerting and notifications
- Template variables

### Additional Concepts
- Log aggregation (ELK, Loki)
- Distributed tracing (Jaeger, Zipkin)
- Application Performance Monitoring (APM)

## 🚀 Getting Started

### Using Docker Compose

```bash
cd 07-monitoring

# Start monitoring stack
docker-compose up -d

# Access services
# Prometheus: http://localhost:9090
# Grafana: http://localhost:3000 (admin/admin)
# Node Exporter: http://localhost:9100/metrics

# Stop stack
docker-compose down
```

### Prometheus Queries (PromQL)

```promql
# CPU usage
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory usage
(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / node_memory_MemTotal_bytes * 100

# Disk usage
(node_filesystem_size_bytes{mountpoint="/"} - node_filesystem_avail_bytes{mountpoint="/"}) / node_filesystem_size_bytes{mountpoint="/"} * 100

# HTTP request rate
rate(http_requests_total[5m])

# 95th percentile latency
histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))
```

## 📖 What You'll Learn

1. **Metrics Collection**: Instrument applications and infrastructure
2. **Metric Types**: Counters, gauges, histograms, summaries
3. **Alerting**: Define alert rules and notification channels
4. **Dashboarding**: Create visual representations of data
5. **SLIs/SLOs**: Define and measure reliability
6. **Log Analysis**: Aggregate and search logs
7. **Distributed Tracing**: Follow requests across services

## 💡 Best Practices

### Metrics
- Use meaningful metric names
- Include relevant labels (dimensions)
- Don't overuse labels (cardinality explosion)
- Set appropriate scrape intervals
- Monitor the monitoring system itself

### Alerts
- Alert on symptoms, not causes
- Avoid alert fatigue
- Use severity levels appropriately
- Include runbook links in alerts
- Test alert rules regularly
- Implement proper escalation

### Dashboards
- One dashboard per service/component
- Include only actionable metrics
- Use consistent time ranges
- Add annotations for deploys/incidents
- Share dashboards across teams

### SLOs
- Define based on user experience
- Start with simple SLIs
- Set realistic SLO targets (not 100%)
- Track error budgets
- Review and adjust regularly

## 🎓 Exercise Progression

1. Start Prometheus and Grafana
2. Explore metrics with PromQL
3. Create custom dashboards
4. Set up alert rules
5. Configure notification channels
6. Instrument a sample application
7. Build an SLO dashboard
8. Simulate and respond to incidents

## 📚 Additional Resources

- [Prometheus Documentation](https://prometheus.io/docs/)
- [Grafana Documentation](https://grafana.com/docs/)
- [Google SRE Books](https://sre.google/books/) - Monitoring chapters
- [Observability Engineering](https://www.oreilly.com/library/view/observability-engineering/9781492076438/)
- [Prometheus Best Practices](https://prometheus.io/docs/practices/)

## ⚠️ Important Notes

- Metrics storage grows over time - monitor disk usage
- High cardinality can impact Prometheus performance
- Retention defaults to 15 days in this setup
- Grafana dashboards persist in Docker volume
- Alert rules are evaluated at regular intervals
- Always test alerts before deploying to production
