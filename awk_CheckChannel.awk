BEGIN {} /.?Address:.?/{
for (j=1; j<=NF; j++)
{
	if ($j == MACAP)
	{
		for (i=0; i<MaxNrProcessLines; i++)
		{	
			record = getline;
			for (g=1; g<=NF; g++)
			{	
				if ($g ~ /.?Channel:?.?.?/)
				{
					if (NF > g)
						if ($(g+1) ~ /)/)
						{
							res = substr($(g+1),1,length($(g+1))-1)
						}
						else
							res = $(g+1)
					else
					{
						ind = index($g, ":");
						res = substr($g,ind+1,length($g));
					}
					break;
				}
				else
					continue;
			}
			if (res != 0)
				break;
			else
				continue;
		}
		break;
	}
	else
		continue;
}
}
END { print res}
