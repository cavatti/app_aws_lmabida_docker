from fastapi import FastAPI
from mangum import Mangum  # adapta FastAPI para Lambda

app = FastAPI()

@app.get("/hello")
async def hello(name: str = "mundo"):
    return {"message": f"Olá, {name} — vindo do AWS Lambda em Docker!"}

# Lambda handler with explicit configuration
handler = Mangum(app, lifespan="off", api_gateway_base_path="/")
