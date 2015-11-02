#!/bin/sh

# Set walltime according to request; the batch system
# may reject this, of course!
if [ -n "$Walltime" ]; then
  let Walltime=Walltime/60
  echo "#PBS -l walltime=$Walltime"
else
  echo "#PBS -l walltime=24:00:00"
fi

# Set the number of requested GPUs
if [ -n "$RequestGpus" ]; then
  echo "#SBATCH --gres=gpu:$RequestGpus"
  echo "for file in \`ls /etc/profile.d/*.sh\`; do"
  echo ". \$file"
  echo "done"
  echo "module load cuda/6.0"
fi

# Set the correct QoS
if [ -n "$TestJob" ]; then
  echo "#SBATCH --qos=grid_test"
fi
