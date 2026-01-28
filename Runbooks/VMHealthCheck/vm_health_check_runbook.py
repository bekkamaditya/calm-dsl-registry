"""
Runbook: VM Health Check – Windows VM disk, RAM and CPU.
- Task 1 (PowerShell): Check and print disk usage on the Windows VM.
- Task 2 (PowerShell): Check and print RAM and CPU utilisation on the Windows VM.
"""

from calm.dsl.runbooks import runbook
from calm.dsl.runbooks import RunbookTask as Task
from calm.dsl.runbooks import CalmEndpoint as Endpoint
from calm.dsl.runbooks import ref


@runbook
def VMHealthCheckRunbook():
    """Check disk stats and RAM/CPU utilisation on VMs."""
    # Task 1: Windows VM – disk usage
    Task.Exec.powershell(
        name="WindowsDiskStats",
        filename="scripts/windows_disk_check.ps1",
        target=ref(Endpoint.use_existing("WindowsEndpoint")),
    )
    # Task 2: Windows VM – RAM and CPU utilisation
    Task.Exec.powershell(
        name="WindowsRAMCPUStats",
        filename="scripts/windows_ram_cpu_check.ps1",
        target=ref(Endpoint.use_existing("WindowsEndpoint")),
    )
