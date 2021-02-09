# ChartsDemo

# Implementation details

	  1. Created a separate library for UI component. The component consists of two reusable UI 
        1.	Pie Chart
        2.	RangeListUI
  	2. Library is managed using cocoapods.
 	  3. The data is fetched from sample json to populate both the layout. Range.json has data related to range list. UserScore.json has data related to user’s current score
  	4. Created mock service classes to use the sample json file. Separate test json files are used for this.
    5. The mock classes are used to test parsing logic as well.
    6. The demo app consumes the data from respective json files and constructs the required view model to pass it to the library

# Design Consideration
  	1. MVVM design pattern used to keep the code modular and testable
  	2. Created a separate class called “Binding” to support one way data binding.
   	3. Used Dependency Injection principle to pass the service dependency.
    4. Used Generics, enums , struct and protocols wherever needed.
   	5. Created separate class for drawing PieChart.
	
# Usage	
	1. To integrate the library to your project, just import
 	import IntuitCharts
	
	2. To create and add the ScoreView to your view, call the following class method
		ScoreAnalysisView.scoreView(with: scoreViewModel, parentView: yourView, delegate: self)
		
	3. To create and add the RangeListView to your view, call the following class method
		RangeListView.rangeListView(with: rangeListViewModel, parentView: yourView, delegate: self)
		
	4. Implement the respective view's delegate to handle the action events
		extension ChartsViewController : RangeListViewProtocol {
    		  	func didSelectInfo() {
        			print("did select info")
    			}	    
		}

		extension ChartsViewController: ScoreAnalysisViewProtocol{
    			func didSelectScoreAnalysis() {
        			print("did select score anaysis")
    			}
		}

# Limitation
  	1. Currently the demo app supports only landscape mode

# Improvements
  	1. The podscpec need can be moved to other repository
  	2. UI test is not present currently
