# ghactions
Github Actions playground
Test git

To use **act** make sure --container-daemon-socket - is added to ~/.actrc (create the file if absent) or append it to command as follows: `act --container-architecture linux/amd64 --container-daemon-socket="unix:///var/run/docker.sock"`

## Act to trigger workflow with event inputs
``` bash
$ cat sample.event
{
  "action": "workflow_dispatch",
  "inputs": {
      "name": "Mr. Bill"
  }
}
$ act --job show_inputs --eventpath sample.event
[test/show_inputs] 🚀  Start image=node:12.6-buster-slim
[test/show_inputs]   🐳  docker run image=node:12.6-buster-slim entrypoint=["/usr/bin/tail" "-f" "/dev/null"] cmd=[]
[test/show_inputs] ⭐  Run echo "Hello ${{ github.event.inputs.name }}!"
| Hello Mr. Bill!
[test/show_inputs]   ✅  Success - echo "Hello ${{ github.event.inputs.name }}!"
```
### Practical:
``` bash
act --workflows '.github/workflows/simple-workflow.yml' --eventpath simple-workflow.event.json
``` 