from fastapi import FastAPI
from datetime import datetime, timezone

app = FastAPI(
    title="FinServ Account Service",
    description="Account microservice for FinServ Digital",
    version="1.0.0"
)

@app.get("/")
def root():
    return {
        "service": "account-service",
        "message": "FinServ Account Service is running"
    }

@app.get("/health")
def health():
    return {
        "status": "healthy",
        "service": "account-service",
        "timestamp": datetime.now(timezone.utc).isoformat()
    }