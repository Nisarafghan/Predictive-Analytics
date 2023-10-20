library(tidyverse)
titanic_data <- read_csv("titanic.csv")
# Viewing and Understading Data
view(titanic_data)
glimpse(titanic_data)
class(titanic_data)
class(titanic_data$sex)

# Cleaning and Manipulating Data.
# subsetting to remove coloums we might not be needing for our analysis
titanic <- titanic_data %>% 
  select(survived, pclass, sex, age, who, embark_town, adult_male, class, fare) %>% 
  view()
titanic %>% 
  select(embark_town) %>% 
  filter(complete.cases(.))

# changing data type
titanic$sex <- as.factor(titanic_data$sex)
class(titanic_data$sex)
titanic$who <- as.factor(titanic_data$who)
class(titanic_data$who)
titanic$class <- as.factor(titanic_data$class)
class(titanic_data$class)

# Histograms
view(titanic)
titanic %>% 
  drop_na(age) %>% 
  ggplot(aes(age)) + 
  geom_histogram(bins=20)+
  labs(title = "Count of Passengers based on Age") +
  theme_classic()
#Bar Charts
titanic %>% 
  filter(class %in% c("First","Third")) %>% 
  ggplot(aes(class,fill = sex)) +
  geom_bar(alpha=0.2)+
  labs(title = "Classification of First and Third Class pesengers based on Age",
       x = "Class and Sex",
       y = " class count") +
  theme_dark()
  
#Scatter Plot
titanic %>% 
  drop_na(age, fare) %>% 
  filter(fare<100) %>% 
  ggplot(aes(age,fare)) +
  geom_point(aes(age = fare, alpha=0.8)) +
  geom_smooth(method="lm") +
  labs(title="Class and fare of the Passenger")+
  theme_light()

# Box plot

titanic %>% 
  drop_na(age, who,sex) %>% 
  #filter(who %in% 
           #c("black", "brown")) %>% 
  ggplot(aes(who, age, fill=sex))+
  geom_boxplot() + 
  labs(title = "Age and Category of Passengers",
       x = "Category of Passengers",
       y = "Age of Passengers")+
  theme_classic()
