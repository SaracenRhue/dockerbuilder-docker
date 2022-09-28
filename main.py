import yaml
from os import system as cmd

def setup(user, password):
    cmd('sudo systemctl start docker')
    cmd(f'docker login -u {user} -p {password}')
    cmd('docker buildx create --name mybuilder')
    cmd('docker run -it --rm --privileged tonistiigi/binfmt --install all')

def clone(user, repo):
    cmd(f'mkdir tmp && git clone https://github.com/{user}/{repo}.git ./tmp') 

def build(user, repo, aarch):
    cmd(f'cd ./tmp && docker buildx build --platform {aarch} -t {user}/{repo}:latest . --push')

def clear_tmp():
    cmd('rm -rf ./tmp')


with open('config/config.yml', 'r') as file:
    config = yaml.safe_load(file)
    github_user = config['github_user']
    docker_user = config['docker_user']
    docker_password = config['docker_password']
    watched_repos = config['watched_repos']


setup(docker_user, docker_password)
for repo in watched_repos:
    github_repo = watched_repos[repo]['github_name']
    docker_repo = watched_repos[repo]['docker_name']
    aarch = watched_repos[repo]['architecture']
    clone(github_user, github_repo)
    build(docker_user, docker_repo, aarch)
    clear_tmp()
print('Done!')

