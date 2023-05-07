from typing import Union

from fastapi import FastAPI

app = FastAPI()


@app.get("/api/hello")
async def hello() -> dict:
    return {"message": "Hello World"}


@app.get("/health")
async def health() -> dict:
    return {"health": "OK"}
