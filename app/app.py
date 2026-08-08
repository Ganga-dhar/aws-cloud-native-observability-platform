from flask import Flask, jsonify
from prometheus_flask_exporter import PrometheusMetrics
import logging
import time

app = Flask(__name__)

# --------------------------------------------------
# Logging
# --------------------------------------------------

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(name)s %(message)s"
)

logger = logging.getLogger(__name__)


# --------------------------------------------------
# Prometheus Metrics
# --------------------------------------------------

metrics = PrometheusMetrics(app)

metrics.info(
    "application_info",
    "Application information",
    version="1.0.0"
)


# --------------------------------------------------
# Health Check
# --------------------------------------------------

@app.route("/health")
def health():

    return jsonify({
        "status": "healthy"
    })


# --------------------------------------------------
# Root Endpoint
# --------------------------------------------------

@app.route("/")
def home():

    logger.info("Home endpoint called")

    return jsonify({
        "application": "cloud-native-observability-platform",
        "version": "1.0.0",
        "status": "running"
    })


# --------------------------------------------------
# Orders API
# --------------------------------------------------

@app.route("/api/orders")
def orders():

    logger.info("Fetching orders")

    # Simulate application processing
    time.sleep(0.1)

    return jsonify({
        "orders": [
            {
                "id": 1001,
                "product": "Laptop",
                "status": "completed"
            },
            {
                "id": 1002,
                "product": "Monitor",
                "status": "processing"
            },
            {
                "id": 1003,
                "product": "Keyboard",
                "status": "completed"
            }
        ]
    })


# --------------------------------------------------
# Simulated Error Endpoint
# --------------------------------------------------

@app.route("/api/error")
def error():

    logger.error("Simulated application error")

    return jsonify({
        "error": "Simulated application error"
    }), 500


# --------------------------------------------------
# Application Startup
# --------------------------------------------------

if __name__ == "__main__":

    app.run(
        host="0.0.0.0",
        port=5000
    )