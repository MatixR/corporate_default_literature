    ## Loading required package: stringr

    ## Loading required package: rvest

    ## Loading required package: xml2

<table style="width:94%;">
<caption>Table continues below</caption>
<colgroup>
<col width="41%" />
<col width="37%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Article name</th>
<th align="right">My rating (1 = best, 5 = worst)</th>
<th align="right">Citations</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Ensemble boosted trees with synthetic features generation in application to bankruptcy prediction</td>
<td align="right">2</td>
<td align="right">3</td>
</tr>
<tr class="even">
<td align="left">Bankruptcy forecasting: An empirical comparison of AdaBoost and neural networks</td>
<td align="right">3</td>
<td align="right">160</td>
</tr>
<tr class="odd">
<td align="left">Data mining method for listed companies financial distress prediction</td>
<td align="right">5</td>
<td align="right">123</td>
</tr>
</tbody>
</table>

<table style="width:86%;">
<caption>Table continues below</caption>
<colgroup>
<col width="43%" />
<col width="43%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">My review</th>
<th align="left">Outcome</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Credit for: Large data set Interesting idea of synthetic features and Extreme Gradient Boosting Making the data set avilable (see <a href="http://bit.ly/2id2zk8" class="uri">http://bit.ly/2id2zk8</a>) I am not sure how exactly the sampling is done Sad that the longitudinal aspect is ignored Little emphasis have been put on the other models they compare with. I have gotten +80% cross validation AUC with both Logit models and SVM with one days work</td>
<td align="left">Up to 95.9% AUC with cross validation</td>
</tr>
<tr class="even">
<td align="left">Overall decent article. Drawbacks are: Missing details about sampling The 0-1 classifier may fail on real data set where failures are rare when trained on this data</td>
<td align="left">8.9% accurarcy on hold-out for class assigment with AdaBoost</td>
</tr>
<tr class="odd">
<td align="left">A lot of details are missing. It is not clear to me what the different tree/forest models are Very small sample with 35 covaraites Hard to say anything good about their sampling</td>
<td align="left">95% accurarcy with cross validation with what they coin 'Resubstitution'</td>
</tr>
</tbody>
</table>

<table style="width:81%;">
<caption>Table continues below</caption>
<colgroup>
<col width="40%" />
<col width="40%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Sample size (failure / non-failure)</th>
<th align="left">Models</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Up to 515 / 10173 (financial statements)</td>
<td align="left">Decision Tree, Boosting, AdaBoost</td>
</tr>
<tr class="even">
<td align="left">590 / 590 (firms)</td>
<td align="left">Linear Discriminant Analysis, Neural Network, AdaBoost</td>
</tr>
<tr class="odd">
<td align="left">92 / 106 (firms)</td>
<td align="left">Decision Tree</td>
</tr>
</tbody>
</table>

<table style="width:82%;">
<caption>Table continues below</caption>
<colgroup>
<col width="40%" />
<col width="41%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Data source</th>
<th align="left">Sampling</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Polish manufacturing sector with data from the Emerging Markets Information Service</td>
<td align="left">Failing firms are drawn from 20072013 Non-failing firms are taken where 'the availability of a minimum of three consecutive financial statements in the period 20002012' Firms do have multiple entries Unclear if failing firms also appear with financial statements for the year where they do not default Mix years / ignores longitudinal aspect Unclear what is meant by the different xthYear data sets</td>
</tr>
<tr class="even">
<td align="left">Spanish firms from the SABI database of Bureau Van Dijk</td>
<td align="left">Random sampling with some sort of prior weight depending on covaraites. Details are not clear Select data from 2001-2005 Mix years / ignores longitudinal aspect</td>
</tr>
<tr class="odd">
<td align="left">Chinece firms from China Stock Market and Accounting Research Database Default indicator is 'specially treated (ST) by China Securities Supervision and Management Committee'</td>
<td align="left">Paired firms between 2000 and 2005 Mix years / ignores longitudinal aspect Details about parring is not clear 'In order to eliminate outliers, companies with financial ratios deviating from the mean value as much as three times of standard deviation are excluded'</td>
</tr>
</tbody>
</table>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="91%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">link</th>
<th align="right">year</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="http://www.sciencedirect.com/science/article/pii/S0957417416301592" class="uri">http://www.sciencedirect.com/science/article/pii/S0957417416301592</a></td>
<td align="right">2016</td>
</tr>
<tr class="even">
<td align="left"><a href="http://www.sciencedirect.com/science/article/pii/S016792360700214X" class="uri">http://www.sciencedirect.com/science/article/pii/S016792360700214X</a></td>
<td align="right">2008</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.sciencedirect.com/science/article/pii/S0950705106001936" class="uri">http://www.sciencedirect.com/science/article/pii/S0950705106001936</a></td>
<td align="right">2008</td>
</tr>
</tbody>
</table>

<table style="width:33%;">
<colgroup>
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Publisher</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Expert Systems With Applications</td>
</tr>
<tr class="even">
<td align="left">Decision Support Systems</td>
</tr>
<tr class="odd">
<td align="left">Knowledge-Based Systems</td>
</tr>
</tbody>
</table>
