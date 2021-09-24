import docker

client = docker.from_env()

docker_image = client.images.get("qisblue/pittcyber")

docker_hist = docker_image.history()

def rev_docker_history(hist):
    rev_hist = hist[::-1]
    for line in rev_hist:
        print(line['CreatedBy'])

rev_docker_history(docker_hist)
