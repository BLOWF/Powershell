for ($i=0 ; $i -ne 30; $i++)
{
    start cmd
    start-sleep -Milliseconds 200
}
start-sleep -Seconds 1
stop-process -name cmd