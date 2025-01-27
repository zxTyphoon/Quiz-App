using {adminDashboardSrv} from '../../srv/service.cds';

annotate adminDashboardSrv.Quizzes with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};

annotate adminDashboardSrv.Quizzes with @UI.HeaderFacets: [{
  $Type : 'UI.ReferenceFacet',
  Target: '@UI.DataPoint#title',
  ID    : 'Title'
}];

annotate adminDashboardSrv.Quizzes with @UI.HeaderInfo: {
  TypeName      : 'Quiz',
  TypeNamePlural: 'Quizzes',
  Title         : {Value: quizId}
};

annotate adminDashboardSrv.Quizzes with {
  ID @UI.Hidden
};

annotate adminDashboardSrv.Quizzes with @UI.Identification: [{Value: quizId}];

annotate adminDashboardSrv.Quizzes with {
  quizId    @Common.Label: 'Quiz Id';
  title     @Common.Label: 'Title';
  questions @Common.Label: 'Questions'
};

annotate adminDashboardSrv.Quizzes with {
  ID @Common.Text: {
    $value                : quizId,
    ![@UI.TextArrangement]: #TextOnly
  };
};

annotate adminDashboardSrv.Quizzes with @UI.SelectionFields: [
  quizId,
  title
];

annotate adminDashboardSrv.Quizzes with @UI.LineItem #quizzesTable: [
  {
    $Type: 'UI.DataField',
    Value: quizId
  },
  {
    $Type: 'UI.DataField',
    Value: title
  }
];

annotate adminDashboardSrv.Quizzes with @UI.SelectionPresentationVariant #quizzesTable: {
  Text               : 'Quizzes Overview',
  SelectionVariant   : {SelectOptions: []},
  PresentationVariant: {Visualizations: ['@UI.LineItem#quizzesTable']}
};

annotate adminDashboardSrv.Quizzes with @UI.LineItem #questionsTable: [
  {
    $Type: 'UI.DataField',
    Value: questions.questionId
  },
  {
    $Type: 'UI.DataField',
    Value: questions.text
  },
  {
    $Type: 'UI.DataField',
    Value: questions.quizzes.title
  }
];

annotate adminDashboardSrv.Quizzes with @UI.SelectionPresentationVariant #questionsTable: {
  Text               : 'Questions Overview',
  SelectionVariant   : {SelectOptions: []},
  PresentationVariant: {Visualizations: ['@UI.LineItem#questionsTable']}
};

annotate adminDashboardSrv.Quizzes with @UI.FieldGroup #quizDetails: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: quizId
    },
    {
      $Type: 'UI.DataField',
      Value: title
    }

  ]
};


annotate adminDashboardSrv.Questions with @UI.LineItem #questionsSection: [
  {
    $Type: 'UI.DataField',
    Value: questionId
  },
  {
    $Type: 'UI.DataField',
    Value: text
  }

];


annotate adminDashboardSrv.Quizzes with @UI.Facets: [{
  $Type : 'UI.CollectionFacet',
  ID    : 'quizInfoTab',
  Label : 'Quiz Information',
  Facets: [
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'quizDetails',
      Label : 'Quiz Details',
      Target: '@UI.FieldGroup#quizDetails'
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'questionsSection',
      Label : 'Questions',
      Target: 'questions/@UI.LineItem#questionsSection'
    }
  ]
}];

annotate adminDashboardSrv.Questions with {
  quizzes @Common.ValueList: {
    CollectionPath: 'Quizzes',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: quizzes_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'quizId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
    ],
  }
};

annotate adminDashboardSrv.Questions with @UI.DataPoint #text: {
  Value: text,
  Title: 'Text',
};

annotate adminDashboardSrv.Questions with @UI.HeaderFacets: [{
  $Type : 'UI.ReferenceFacet',
  Target: '@UI.DataPoint#text',
  ID    : 'Text'
}];

annotate adminDashboardSrv.Questions with @UI.HeaderInfo: {
  TypeName      : 'Question',
  TypeNamePlural: 'Questions',
  Title         : {Value: questionId}
};

annotate adminDashboardSrv.Questions with {
  ID @UI.Hidden
};

annotate adminDashboardSrv.Questions with @UI.Identification: [{Value: questionId}];

annotate adminDashboardSrv.Questions with {
  questionId @Common.Label: 'Question Id';
  text       @Common.Label: 'Text';
  answers    @Common.Label: 'Answers';
  quizzes    @Common.Label: 'Quiz'
};

annotate adminDashboardSrv.Questions with {
  ID      @Common.Text: {
    $value                : questionId,
    ![@UI.TextArrangement]: #TextOnly
  };
  quizzes @Common.Text: {
    $value                : quizzes.quizId,
    ![@UI.TextArrangement]: #TextOnly
  };
};

annotate adminDashboardSrv.Questions with @UI.SelectionFields: [quizzes_ID];

annotate adminDashboardSrv.Questions with @UI.LineItem: [
  {
    $Type: 'UI.DataField',
    Value: ID
  },
  {
    $Type: 'UI.DataField',
    Value: questionId
  },
  {
    $Type: 'UI.DataField',
    Value: text
  },
  {
    $Type: 'UI.DataField',
    Label: 'Quiz',
    Value: quizzes_ID
  }
];


annotate adminDashboardSrv.Answers with @UI.LineItem #answersSection: [
  {
    $Type: 'UI.DataField',
    Value: answerId
  },
  {
    $Type: 'UI.DataField',
    Value: text
  },
  {
    $Type      : 'UI.DataField',
    Value      : isCorrect_code,
    Criticality: isCorrect.criticality
  }

];


annotate adminDashboardSrv.Questions with @UI.Facets: [{
  $Type : 'UI.CollectionFacet',
  ID    : 'questionsAndAnswersTab',
  Facets: [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'answersSection',
    Label : 'Answers',
    Target: 'answers/@UI.LineItem#answersSection'
  }]
}];

annotate adminDashboardSrv.Answers with {
  questions @Common.ValueList: {
    CollectionPath: 'Questions',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: questions_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'questionId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'text'
      },
    ],
  }
};

annotate adminDashboardSrv.Answers with @UI.DataPoint #text: {
  Value: text,
  Title: 'Text',
};

annotate adminDashboardSrv.Answers with @UI.DataPoint #isCorrect: {
  Value      : isCorrect_code,
  Title      : 'Is Correct',
  Criticality: isCorrect.criticality,
};

annotate adminDashboardSrv.Answers with @UI.HeaderFacets: [
  {
    $Type : 'UI.ReferenceFacet',
    Target: '@UI.DataPoint#text',
    ID    : 'Text'
  },
  {
    $Type : 'UI.ReferenceFacet',
    Target: '@UI.DataPoint#isCorrect',
    ID    : 'IsCorrect'
  }
];

annotate adminDashboardSrv.Answers with @UI.HeaderInfo: {
  TypeName      : 'Answer',
  TypeNamePlural: 'Answers',
  Title         : {Value: answerId}
};

annotate adminDashboardSrv.Answers with {
  ID @UI.Hidden
};

annotate adminDashboardSrv.Answers with @UI.Identification: [{Value: answerId}];

annotate adminDashboardSrv.Answers with {
  answerId  @Common.Label: 'Answer Id';
  text      @Common.Label: 'Text';
  isCorrect @Common.Label: 'Is Correct';
  questions @Common.Label: 'Question'
};

annotate adminDashboardSrv.Answers with {
  ID        @Common.Text: {
    $value                : answerId,
    ![@UI.TextArrangement]: #TextOnly
  };
  questions @Common.Text: {
    $value                : questions.questionId,
    ![@UI.TextArrangement]: #TextOnly
  };
  isCorrect @Common.Text: {
    $value                : isCorrect.name,
    ![@UI.TextArrangement]: #TextOnly
  };
};

annotate adminDashboardSrv.Answers with {
  isCorrect @Common.ValueListWithFixedValues;
};

annotate adminDashboardSrv.Answers with @UI.SelectionFields: [
  questions_ID,
  isCorrect_code
];

annotate adminDashboardSrv.Answers with @UI.LineItem #answersTable: [
  {
    $Type: 'UI.DataField',
    Value: answerId
  },
  {
    $Type: 'UI.DataField',
    Value: text
  },
  {
    $Type      : 'UI.DataField',
    Value      : isCorrect_code,
    Criticality: isCorrect.criticality
  },
  {
    $Type: 'UI.DataField',
    Value: questions.text
  }
];

annotate adminDashboardSrv.Answers with @UI.SelectionPresentationVariant #answersTable: {
  Text               : 'Answers Overview',
  SelectionVariant   : {SelectOptions: []},
  PresentationVariant: {Visualizations: ['@UI.LineItem#answersTable']}
};

annotate adminDashboardSrv.Answers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: ID
    },
    {
      $Type: 'UI.DataField',
      Value: answerId
    },
    {
      $Type: 'UI.DataField',
      Value: text
    },
    {
      $Type      : 'UI.DataField',
      Value      : isCorrect_code,
      Criticality: isCorrect.criticality
    },
    {
      $Type: 'UI.DataField',
      Label: 'Question',
      Value: questions_ID
    }
  ]
};

annotate adminDashboardSrv.Answers with @UI.Facets: [{
  $Type : 'UI.ReferenceFacet',
  ID    : 'Main',
  Label : 'General Information',
  Target: '@UI.FieldGroup#Main'
}];

annotate adminDashboardSrv.Users with @UI.DataPoint #username: {
  Value: username,
  Title: 'Username',
};

annotate adminDashboardSrv.Users with @UI.HeaderFacets: [{
  $Type : 'UI.ReferenceFacet',
  Target: '@UI.DataPoint#username',
  ID    : 'Username'
}];

annotate adminDashboardSrv.Users with @UI.HeaderInfo: {
  TypeName      : 'User',
  TypeNamePlural: 'Users',
  Title         : {Value: userId}
};

annotate adminDashboardSrv.Users with {
  ID @UI.Hidden
};

annotate adminDashboardSrv.Users with @UI.Identification: [{Value: userId}];

annotate adminDashboardSrv.Users with {
  userId   @Common.Label: 'User Id';
  username @Common.Label: 'Username';
  results  @Common.Label: 'Results'
};

annotate adminDashboardSrv.Users with {
  ID @Common.Text: {
    $value                : userId,
    ![@UI.TextArrangement]: #TextOnly
  };
};

annotate adminDashboardSrv.Users with @UI.SelectionFields: [userId];

annotate adminDashboardSrv.Users with @UI.LineItem #usersTable: [
  {
    $Type: 'UI.DataField',
    Value: userId
  },
  {
    $Type: 'UI.DataField',
    Value: username
  }
];

annotate adminDashboardSrv.Users with @UI.SelectionPresentationVariant #usersTable: {
  Text               : 'Users Overview',
  SelectionVariant   : {SelectOptions: []},
  PresentationVariant: {Visualizations: ['@UI.LineItem#usersTable']}
};

annotate adminDashboardSrv.Users with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: ID
    },
    {
      $Type: 'UI.DataField',
      Value: userId
    },
    {
      $Type: 'UI.DataField',
      Value: username
    }
  ]
};

annotate adminDashboardSrv.Users with @UI.Facets: [{
  $Type : 'UI.ReferenceFacet',
  ID    : 'Main',
  Label : 'General Information',
  Target: '@UI.FieldGroup#Main'
}];

annotate adminDashboardSrv.Results with {
  users @Common.ValueList: {
    CollectionPath: 'Users',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: users_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'userId'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'username'
      },
    ],
  }
};

annotate adminDashboardSrv.Results with @UI.DataPoint #score: {
  Value: score,
  Title: 'Score',
};

annotate adminDashboardSrv.Results with @UI.HeaderFacets: [{
  $Type : 'UI.ReferenceFacet',
  Target: '@UI.DataPoint#score',
  ID    : 'Score'
}];

annotate adminDashboardSrv.Results with @UI.HeaderInfo: {
  TypeName      : 'Result',
  TypeNamePlural: 'Results',
  Title         : {Value: resultId}
};

annotate adminDashboardSrv.Results with {
  ID @UI.Hidden
};

annotate adminDashboardSrv.Results with @UI.Identification: [{Value: resultId}];

annotate adminDashboardSrv.Results with {
  resultId @Common.Label: 'Result Id';
  score    @Common.Label: 'Score';
  users    @Common.Label: 'User'
};

annotate adminDashboardSrv.Results with {
  ID    @Common.Text: {
    $value                : resultId,
    ![@UI.TextArrangement]: #TextOnly
  };
  users @Common.Text: {
    $value                : users.userId,
    ![@UI.TextArrangement]: #TextOnly
  };
};

annotate adminDashboardSrv.Results with @UI.SelectionFields: [users_ID];

annotate adminDashboardSrv.Results with @UI.LineItem #resultsTable: [
  {
    $Type: 'UI.DataField',
    Value: resultId
  },
  {
    $Type: 'UI.DataField',
    Value: score
  },
  {
    $Type: 'UI.DataField',
    Value: users.username
  }
];

annotate adminDashboardSrv.Results with @UI.SelectionPresentationVariant #resultsTable: {
  Text               : 'Results Overview',
  SelectionVariant   : {SelectOptions: []},
  PresentationVariant: {Visualizations: ['@UI.LineItem#resultsTable']}
};

annotate adminDashboardSrv.Results with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: ID
    },
    {
      $Type: 'UI.DataField',
      Value: resultId
    },
    {
      $Type: 'UI.DataField',
      Value: score
    },
    {
      $Type: 'UI.DataField',
      Label: 'User',
      Value: users_ID
    }
  ]
};

annotate adminDashboardSrv.Results with @UI.Facets: [{
  $Type : 'UI.ReferenceFacet',
  ID    : 'Main',
  Label : 'General Information',
  Target: '@UI.FieldGroup#Main'
}];
