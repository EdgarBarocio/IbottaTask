#The Project
--
Your goal is to build an iOS mobile application using the provided JSON data for Offers. 

Your work should reflect your experience with iOS. Your app should contain 2 screens. Use a UINavigationController to structure the app. 

Note: Please do not use Storyboards or Nib files. This will help us better evaluate your abilities.

The details for each screen are as follows:

### Screen 1 (Offers)
* A collection of items displaying offers in a grid built to look like the Offers Mock contained in the project. This view should display all offers contained in the Offers.json data.
	* Fonts & Colors:
		* *Amount*
          		* iOS: AvenirNext-DemiBold, 12 pt, #4A4A4A
		* *Name*
	      		* iOS: AvenirNext-Regular, 11 pt, #4A4A4A
      * *Additional Notes*
	      * Margins are noted in the mock. There are a couple items that are not listed.
		      * Corner radius for the gray background: 5 pt
		      * The width of the gray background should be dictated by the width of the device minus the noted margins. The height of the gray background should be based on its ratio to the width to match the mock.
		      * The leading/trailing edges for the labels should line up with the gray background.
* In addition to the mock, please build a state for offer cells to indicate that an offer is favorited. This can be toggled in Screen 2 (Offer Detail). How this state of an offer is displayed is completely up to you.

![Offers Mock](https://github.com/EdgarBarocio/IbottaTask/assets/4490760/67d08885-23bc-4682-ac46-44bffb11a63e)


### Screen 2 (Offer Detail)
* A detail screen to display when an offer is tapped. 
* A button to favorite/unfavorite an offer or otherwise mark it as something you would like to buy. **This state should also be reflected on the Offers screen as noted in the Offers screen requirements.**
* A mock has not been included for this screen, so please build whatever you would like utilizing the provided offers data.

### General Notes
* You can target the latest, or a very recent, version of the operating system. 
* You should assume the app will run on varying screen sizes, excluding tablets. 
* Feel free to pull in any libraries you'd like to assist in the development of your project.
* Loading images can be slow and memory intensive. We will be looking for an efficient and performant solution to this.
* Code should be legible, well formatted and commented.
* The UI/layouts should be as clean as possible.
* We would like to see at least one automated test written.
* Please keep in mind that this your opportunity to make a good first impression with the team. While the project does not need to be production ready, it should be ready for you to present to the team when you submit.

Deliverable
---
Please provide the code for the assignment either in a private repository (GitHub or Bitbucket) or as a zip file.


#The implementation
--

Project demo:

![Simulator Screen Recording - Clone 1 of iPhone 14 Pro - 2023-07-02 at 17 42 46](https://github.com/EdgarBarocio/IbottaTask/assets/4490760/ac2089e5-225c-4099-9f15-5d74acf80bd3)

Project was implemented using MVVM, Local assets were downloaded from a free icons library.

### Implementation Details:
A codable OffersModel is used and created by using JSONDecoder and decode all data into objects. 

### The Views used for this project are:
* OffersViewController to hold all the offers
* OffersCollectionViewCell to hold the details on the main offers page
* OffersDetailsView to display all the information for each offer

### The View Models used for this project are:
* OffersViewModel to fetch all offers and build the collection view
* OffersCollectionViewCellViewModel to only display a subset of info for all the offers on each Cell
* OfferDetailsViewModel to display all offer information on the Detail Page and communicate to the OffersView an update in favorites

### The helper classes used are:
* DataParsingWorker to read from the local bundle and serialize the Offers.json file into data
* FavoriteUpdateProtocol to comunicate an update on favorite, so the OffersViewController can update the cell.

### Third Party libraries:
Used SDWebImage to download and cache the images of each cell and the details page. Inclused using Swift Package Manager
A local implementation using local cache and URLSession was atempted, but was not completed to the projects desired standard, hence, it was scraped and SDWebImage was used instead

### Future enhancements
Data persistency. All favorites will be lost once the application is closed. An attempt at persistency was done by writing the updated objects back to an Offers.json file, but was not able to guarantee a successful write on app termination. 

A better approach would have been using a local database, like Realm


