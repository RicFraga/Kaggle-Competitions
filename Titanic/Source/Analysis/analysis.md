Titanic Passengers’ Data Pre-Processing
================
Ricardo Alcaraz Fraga
10/20/2020

## Getting to Know the Situation

The RMS Titanic was a British passenger liner operated by the White Star
Line and known by a lot of people, mainly because the 1997 movie starred
by Kate Winslet and Leonardo DiCaprio and for being one of the worst
naval disasters.

Titanic was the largest ship afloat at the time she entered service and
was the second of three Olympic-class ocean liners operated by the White
Star Line. She was built in by the Harland and Wolf shipyard in Belfast.
Thomas Andrews, chief naval architect of the shipyard at the time, died
in the disaster.

The ocean liner carried some of the wealthiest people in the world, as
well as hundreds of emigrants from Great Britain and Ireland and
Scandinavia, who were seeking a new life in the United States of
America.

Titanic left Southampton on 10 April 1921, she called at Cherbourg in
France and Queenstown in Ireland, before heading west to New York and
finally sinking in the early morning hours of 15 April 1912 after
striking an iceberg.

## How Bad was It?

We all agree that the sinking of Titanic was a great tragedy, but, how
does it compare to other ship sinkings? I gathered some data about other
famous ships, the amount of passengers and the amount of deceased
people, take a look at it.

    ##                      name year aboard deceased
    ## 1 HMS Erebus & HMS Terror 1846    128      128
    ## 2             RMS Titanic 1912   2208     1503
    ## 3            RMS Lusitana 1915   1959     1198
    ## 4         HMHMS Brittanic 1926   1125       29
    ## 5                Bismarck 1941   2200     2086
    ## 6        Wilhelm Gustloff 1945  10600     9343

So, from this data let’s create a new data frame containing the ship
name and percentage of deceased people.

![](analysis_files/figure-gfm/Percentage%20of%20Deceased-1.png)<!-- -->

We can see that there are “worst” outcomes when it comes to sink
history, but the comparison has one fatal flaw, the top 3 ships were
from military use, so it is not a fair comparison. Nevertheless, all of
them are tragic as it were human lives that were lost.

## Taking a Look at the Data Set
