from fastapi import FastAPI
from mangum import Mangum

app = FastAPI()

@app.get("/hello")
async def hello(name: str = "mundo"):
    return {"message": f"Olá, {name} — vindo do AWS Lambda em Docker!"}

# Handler Lambda
handler = Mangum(app, lifespan="off")
