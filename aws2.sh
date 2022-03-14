echo "Waiting for instance $1 to Stop"
OUT=$(aws ec2 stop-instances --instance-ids "$1")
while STATE=$(aws ec2 describe-instances --instance-ids $1 --output text --query 'Reservations[*].Instances[*].State.Name'); test "$STATE" != "stopped"; do
    sleep 1;
done;

echo "Changing attribute from $1 to $2"
aws ec2 modify-instance-attribute --instance-id "$1" --instance-type "$2"

OUT=$(aws ec2 start-instances --instance-ids "$1")
echo "Waiting for instance $1 to Start"
while STATE=$(aws ec2 describe-instances --instance-ids $1 --output text --query 'Reservations[*].Instances[*].State.Name'); test "$STATE" != "running"; do
    sleep 1;
done;
echo "$1  instance is alive"
