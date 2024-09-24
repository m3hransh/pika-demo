import asyncio
from typing import List


async def task(name: str) -> None:
    print(f"Task {name} started")
    await asyncio.sleep(1)
    print(f"Task {name} finished")


async def run_asyncio_example() -> None:
    tasks: List[asyncio.Task] = [
        asyncio.create_task(task(f"Async-{i}")) for i in range(4)
    ]
    await asyncio.gather(*tasks)


if __name__ == "__main__":
    asyncio.run(run_asyncio_example())

