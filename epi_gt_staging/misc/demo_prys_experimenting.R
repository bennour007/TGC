# Demographic pyramids exploration
## Joy Vaz
## 2023-09-11

#' Description: Trying out different methods of creating
#' demographic pyramids in R, using fake data.
#' 
#' ggplot2 code taken from Steve’s Data Tips and Tricks tutorial: 
#' https://www.spsanderson.com/steveondata/posts/2023-09-08/index.html
#' 
#' apyramid code inspired by: 
#' https://cran.r-project.org/web/packages/apyramid/vignettes/intro.html


##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Load packages ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pacman::p_load(tidyverse, apyramid)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Simulate data ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Creating a sample dataset (pre-aggregated)
data <- data.frame(
  Age = as_factor(c(0:9, 0:9)),
  Gender = c(rep("Male", 10), rep("Female", 10)),
  Population = c(200, 250, 300, 350, 400, 450, 500, 550, 600, 650,
    190, 240, 290, 330, 380, 430, 480, 530, 580, 630)
)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Plotting with ggplot2 ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Create a basic bar chart for one gender
basic_plot <-  ggplot(
  data, 
  aes(
    x = Age, 
    fill = Gender, 
    y = ifelse(
      test = Gender == "Male", 
      yes = -Population, 
      no = Population
    )
  )
) + 
  geom_bar(stat = "identity") 

basic_plot


# Create population pyramids for both genders and combine them
population_pyramid <- basic_plot +
  scale_y_continuous(
    labels = abs, 
    limits = max(data$Population) * c(-1,1)
  ) + 
  coord_flip() + 
  theme_minimal() +
  labs(
    x = "Age", 
    y = "Population", 
    fill = "Age", 
    title = "Population Pyramid"
  )

population_pyramid

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Plotting with apyramid ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# Trying out apyramid

apyramid::age_pyramid(data, 
  age_group = Age, 
  split_by = Gender,
  count = Population)
