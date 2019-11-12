+++
# Homepage
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 50  # Order that this section will appear in.

title = "Project"
subtitle = "Showcase your inner data scientist"
+++

## TL;DR

Pick a dataset, any dataset...

...and do something with it. That is your final project in a nutshell. More details below.

## May be too long, but please do read

The final project for this class will consist of analysis on a dataset of your own 
choosing. The dataset may already exist, or you may collect your own data using a 
survey or by conducting an experiment. You can choose the data based on your interests 
or based on work in other courses or research projects. The goal of this project 
is for you to demonstrate proficiency in the techniques we have covered in this 
class (and beyond, if you like) and apply them to a novel dataset in a meaningful way.

The goal is not to do an exhaustive data analysis i.e., do not calculate every 
statistic and procedure you have learned for every variable, but rather let me 
know that you are proficient at asking meaningful questions and answering them 
with results of data analysis, that you are proficient in using R, and that you 
are proficient at interpreting and presenting the results. Focus on methods that 
help you begin to answer your research questions. You do not have to apply every 
statistical procedure we learned. Also, critique your own methods and provide 
suggestions for improving your analysis. Issues pertaining to the reliability 
and validity of your data, and appropriateness of the statistical analysis 
should be discussed here.

The project is very open ended. You should create some kind of compelling visualization(s) of this data in R. There is no limit on what tools or packages you may use, but 
sticking to packages we learned in class (`tidyverse`) is required. You do not 
need to visualize all of the data at once. A single high quality visualization 
will receive a much higher grade than a large number of poor quality visualizations. 
Also pay attention to your presentation. Neatness, coherency, and clarity will 
count. All analyses must be done in RStudio, using R. 

### Data

In order for you to have the greatest chance of success with this project it is 
important that you choose a manageable dataset. This means that the data should 
be readily accessible and large enough that multiple relationships can be explored. 
As such, your dataset must have at least 50 observations and between 10 to 20 
variables (exceptions can be made but you must speak with me first). The 
dataset’s variables should include categorical variables, discrete numerical 
variables, and continuous numerical variables.

If you are using a dataset that comes in a format that we haven't encountered in 
class, make sure that you are able to load it into R as this can be tricky 
depending on the source. If you are having trouble ask for help before it is too late.

**Note on reusing datasets from class:** Do not reuse datasets used in examples,  
homework assignments, or labs in the class.

Below are a list of data repositories that might be of interest to browse. You're 
not limited to these resources, and in fact you're encouraged to venture beyond 
them. But you might find something interesting there:

- [NHS Scotland Open Data](https://www.opendata.nhs.scot/)
- [Bikeshare data portal](https://www.bikeshare.com/data/)
- [UK Gov Data](https://data.gov.uk/)
- [TidyTuesday](https://github.com/rfordatascience/tidytuesday)
- [Kaggle datasets](https://www.kaggle.com/datasets)
- [OpenIntro datasets](http://openintrostat.github.io/openintro-r-package/)
- [Awesome public datasets](https://github.com/awesomedata/awesome-public-datasets)
- [Youth Risk Behavior Surveillance System (YRBSS)](https://chronicdata.cdc.gov/Youth-Risk-Behaviors/DASH-Youth-Risk-Behavior-Surveillance-System-YRBSS/q6p7-56au)
- [PRISM Data Archive Project](https://www.icpsr.umich.edu/icpsrweb/content/ICPSR/fenway.html)
- [Harvard Dataverse](https://dataverse.harvard.edu/)
- If you know of others, let me know, and we'll add here...

### Deliverables

1. Proposal     - due Wednesday, 23 Oct, at 17:00
1. Presentation - due Tuesday, 27 Nov, at 12:00
1. Summary      - due Tuesday, 27 Nov, at 12:00

#### Proposal - due Wednesday, 23 Oct, at 17:00

- Section 1 - Introduction: The introduction should introduce your general 
research question and your data (where it came from, how it was collected, 
what are the cases, what are the  variables, etc.).

- Section 2 - Data: Place your data in the `/data` folder, and add dimensions 
and codebook to the README in that folder. Then print out the output of 
`glimpse()` or `skim()` of your data frame.

- Section 3 - Data analysis plan:
  - The outcome (response, Y) and predictor (explanatory, X) 
variables you will use to answer your question.
  - The comparison groups you will use, if applicable.
  - Very preliminary exploratory data analysis, including some summary statistics 
and visualizations, along with some explanation on how they help you learn more 
about your data. (You can add to these later as you work on your project.)
  - The statistical method(s) that you believe will be useful in answering your 
question(s). (You can update these later as you work on your project.)
  -  What results from these specific statistical methods are needed to support 
your hypothesized answer?

Each section should be no more than 1 page (excluding figures). You can check a 
print preview to confirm length. You will turn in your proposal as your HW 05 
in the course.

#### Presentation - due Tuesday, 27 Nov, at 12:00

5 minutes maximum, and each team member should say something substantial.

Prepare a slide deck using the template in your repo. This template uses a 
package called `xaringan`, and allows you to make presentation slides using 
R Markdown syntax. There isn't a limit to how many slides you can use, just a  
time limit (5 minutes total). Each team member should get a chance to speak 
during the presentation. Your presentation should not just be an account of 
everything you tried ("then we did this, then we did this, etc."), instead it 
should convey what choices you made, and why, and what you found.

Before you finalize your presentation, make sure your chunks are turned off 
with `echo = FALSE`. 

- Presentation schedule: Presentations will take place in two shifts during the 
workshop on Tuesday, 27 Nov (last workshop of the semester). Teams will be 
assigned to shifts randomly, and within each shift order of presentations will 
be determined randomly as well. You only need to be there for your shift, and 
during that hour you get to watch 10 other presentations and provide feedback 
in the form of peer evaluations. While the schedule will be created randomly, 
we will make allowances for teams with students who have class in George Square 
and can't always make it to workshop on time. If your team meets these criteria 
let me know asap!

- Presentation location: Presentations will be held in JCMB 5327.

#### Summary - due Tuesday, 27 Nov, at 12:00

Along with your presentation slides, we want you to provide a brief summary of 
your project in the README of your repository.

This summary should provide information on the dataset you're using, your 
research question(s), your methodology, and your findings. 

#### Repo organization

The following folders and files in your project repository:

* `presentation.Rmd` + `presentation.html`: Your presentation slides
* `README.md`: Your summary
* `/data/*`: Your dataset in csv or RDS format, in the `/data` folder.
* `/proposal`: Your proposal from earlier in the semester

Style and format does count for this assignment, so please take the time to make 
sure everything looks good and your data and code are properly formated.

## Tips

- You're working in the same repo as your teammates now, so merge conflics will 
happen, issues will arise, and that’s fine! Commit and push often, and ask 
questions when stuck.
- Review the marking guidelines below and ask questions if any of the expectations 
are unclear.
- Make sure each team member is contributing, both in terms of quality and 
quantity of contribution (we will be reviewing commits from different team members).
- Set aside time to work together and apart (physically).
- When you're done, review the documents on GitHub to make sure you're happy with 
the final state of your work. Then go get some rest!
- Code: In your presentation your code should be hidden (`echo = FALSE`) so that your 
document is neat and easy to read. However your document should include 
all your code such that if I re-knit your R Markdown file I should be 
able to obtain the results you presented. **Exception:** If you want to 
highlight something specific about a piece of code, you're welcomed to show 
that portion. 
- Teamwork: You are to complete the assignment as a team. All team members are 
expected to contribute equally to the completion of this assignment and team 
evaluations will be given at its completion - anyone judged to not have sufficient 
contributed to the final product will have their grade penalized. While different 
teams members may have different backgrounds and abilities, it is the responsibility 
of every team member to understand how and why all code and approaches in 
the assignment works.

## Marking

Total                          | 100 pts
-------------------------------|--------
Presentation                   | 50 pts
Summary                        | 25 pts
Reproducibility and organization | 10 pts
Team peer evaluation           | 10 pts
Classmates' evaluation         | 5 pts

### Criteria

- Content - What is the quality of research and/or policy question and relevancy 
of data to thosequestions?
- Correctness - Are statistical procedures carried out and explained correctly?
- Writing and Presentation - What is the quality of the statistical presentation, 
writing, and explanations?
- Creativity and Critical Thought - Is the project carefully thought out? Are the 
limitations carefully considered? Does it appear that time and effort went into 
the planning and implementation of the project?

### Team peer evaluation

You will be asked to fill out a survey where you 
rate the contribution and teamwork of each team member out of 10 points. You will 
additionally report a contribution percentage for each team member. Filling out the 
survey is a prerequisite for getting credit on the team member evaluation.
If you are suggesting that an individual did less than 20% of the work, please
provide some explanation. If any individual gets an average peer score 
indicating that they did less than 10% of the work, this person will receive 
half the grade of the rest of the group.

### Late work policy

- There is no late submission / make up for the presentation. You must be in 
class on the day of the presentation to get credit for it.

- The late work policy for the summary is 5% of the maximum obtainable mark per 
calendar day up to seven calendar days after the deadline. If you intend to 
submit work late for the project, you must notify the course organizer before 
the original deadline as well as as soon as the completed work is submitted 
on GitHub.
