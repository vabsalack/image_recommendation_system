# Dataset

1. I'm choosing [Amazon Product's Image dataset](https://www.kaggle.com/datasets/ahmedelsayedrashad/amazon-products-image/data) over [Standard Online Products](https://www.kaggle.com/datasets/liucong12601/stanford-online-products-dataset) because:

   1. The data in it is unprocessed, like straightly from web scarping. It will be a good exercise for me to do the preprocessing.

      1. The size of Amazon dataset is 6.75 GB and SOP is 3.1 GB.
      2. I have to split the dataset into train and test.

   2. It includes wide varities of categories than SOP, mainly *electornics and appliances*, **fahsion, sport wears**, and wide & deep *household essentials.*

      1. The diveristy of SOP is narrow and deep (mostly explicating comprising sub categories only) whereas in Amazon dataset it is wide and deep.

      1) This diversity of categoires improves the result when a common user comes with a common product images they need.
2. Since the size is huge, I must do sampling across the categories first see how the system works. then I must rerun the pipeline to include all the images.

   1. Total number of images is 2,95,000.
   2. Cateogries: 7 (implicitly comprising subcategories)

# Learnings

1. The project folder "app_name/" as the editable package, the '\__init_\_.py' in it imports the config python file which causes the config file to run and the environment variable values stays available for the rest of the same python process.

   1. So the function definition and the calls, that auto-looks for environment variables of defined names, in other modules of "app_name/" folder can work without error.  I think this is reason why the ccds template has import the config file inside '\__init_\_.py' file.

   2. In short, you do not need to import config inside dataset directly because the package initialization already did it for you.

   3. One caveat: this only works when the code is executed as part of the package import path, such as:
      1. 'python -m image_recommendation_system.dataset'
      2. 'from image_recommendation_system import dataset'

   5. If you run the file as a plain script directly, that package-init behavior may not happen the same way.

2. 'make -i target':the -i option silents the error made by an command in the recipe, allows executing other commands in the sequence in the target.


# Workflow tasks

- [ ] add functionality for data download
- [ ] mege data download branch to main
- [ ] 