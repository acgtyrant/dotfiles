dos2unix $1
gawk -i inplace 'BEGIN { RS=ORS=""; FS=OFS="\n" }
{
    print $1,$2,$3
    for (i=4;i<=NF;i++)
        printf " %s", $i
    print "\n\n"
}
' $1
