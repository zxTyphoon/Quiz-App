sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'admindashboardapp/test/integration/FirstJourney',
		'admindashboardapp/test/integration/pages/QuizzesList',
		'admindashboardapp/test/integration/pages/QuizzesObjectPage'
    ],
    function(JourneyRunner, opaJourney, QuizzesList, QuizzesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('admindashboardapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheQuizzesList: QuizzesList,
					onTheQuizzesObjectPage: QuizzesObjectPage
                }
            },
            opaJourney.run
        );
    }
);