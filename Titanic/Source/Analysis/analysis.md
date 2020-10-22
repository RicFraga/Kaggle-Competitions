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

Let’s start simple, how many rows and columns we have and how many NAs
are there?

``` r
head(train_data)
```

    ##   PassengerId Survived Pclass
    ## 1           1        0      3
    ## 2           2        1      1
    ## 3           3        1      3
    ## 4           4        1      1
    ## 5           5        0      3
    ## 6           6        0      3
    ##                                                  Name    Sex Age SibSp Parch
    ## 1                             Braund, Mr. Owen Harris   male  22     1     0
    ## 2 Cumings, Mrs. John Bradley (Florence Briggs Thayer) female  38     1     0
    ## 3                              Heikkinen, Miss. Laina female  26     0     0
    ## 4        Futrelle, Mrs. Jacques Heath (Lily May Peel) female  35     1     0
    ## 5                            Allen, Mr. William Henry   male  35     0     0
    ## 6                                    Moran, Mr. James   male  NA     0     0
    ##             Ticket    Fare Cabin Embarked
    ## 1        A/5 21171  7.2500              S
    ## 2         PC 17599 71.2833   C85        C
    ## 3 STON/O2. 3101282  7.9250              S
    ## 4           113803 53.1000  C123        S
    ## 5           373450  8.0500              S
    ## 6           330877  8.4583              Q

``` r
names(train_data)
```

    ##  [1] "PassengerId" "Survived"    "Pclass"      "Name"        "Sex"        
    ##  [6] "Age"         "SibSp"       "Parch"       "Ticket"      "Fare"       
    ## [11] "Cabin"       "Embarked"

``` r
dim(train_data)
```

    ## [1] 891  12

``` r
colSums(is.na.data.frame(train_data[, ]))
```

    ## PassengerId    Survived      Pclass        Name         Sex         Age 
    ##           0           0           0           0           0         177 
    ##       SibSp       Parch      Ticket        Fare       Cabin    Embarked 
    ##           0           0           0           0           0           0

We can see that we have 177 missing values in the column Age, this means
that from the total rows, 19.8% are incomplete. We can also see that we
have 12 columns and that some of them have a not numerical value, like
the name column. Let’s start modifying the data, we’ll convert age into
a numerical value.

  - Female = 1  
  - Male = 0

<!-- end list -->

    ##                                                   Name Sex
    ## 1                              Braund, Mr. Owen Harris   0
    ## 2  Cumings, Mrs. John Bradley (Florence Briggs Thayer)   1
    ## 3                               Heikkinen, Miss. Laina   1
    ## 4         Futrelle, Mrs. Jacques Heath (Lily May Peel)   1
    ## 5                             Allen, Mr. William Henry   0
    ## 6                                     Moran, Mr. James   0
    ## 7                              McCarthy, Mr. Timothy J   0
    ## 8                       Palsson, Master. Gosta Leonard   0
    ## 9    Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)   1
    ## 10                 Nasser, Mrs. Nicholas (Adele Achem)   1

Now that we fixed that, let’s compare how many women survived vs how
many people survived.

    ## [1] "Total survivors: "

    ## [1] 342

    ## [1] "Percentage of women who survived: "

    ## [1] 68.12865

    ## [1] "Percentage of men who survived: "

    ## [1] 31.87135
