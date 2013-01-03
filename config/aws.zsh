# setup shorts
export vzaar_elb=vz-app-elb-20120620
export vd20_elb=vd-lb
export vd30_elb=vd-30-lb

export vd_as=vd-as-group-201208271005
export vzaar_as=vz-app-as-group-20120704



function aws_elb(){
  if [[ -n $1 ]]; then
    elb-describe-instance-health $1
  else
    elb-describe-lbs
  fi
}

function aws_as(){
  if [[ -n $1 ]]; then
    as-describe-auto-scaling-groups $1
  else
    as-describe-auto-scaling-groups
  fi
}
