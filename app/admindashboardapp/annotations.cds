using {adminDashboardSrv} from '../../srv/service.cds';

annotate adminDashboardSrv.Quizzes with @UI.HeaderInfo: {
  TypeName      : 'Quiz',
  TypeNamePlural: 'Quizzes',
  Title         : {Value: title}
};

annotate adminDashboardSrv.Quizzes with @UI.Identification: [{Value: title}];

annotate adminDashboardSrv.Quizzes with {
  quizId @Common.Label: 'Quiz Id';
  title  @Common.Label: 'Title'
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

annotate adminDashboardSrv.Quizzes with {
  ID @UI.Hidden
};

annotate adminDashboardSrv.Quizzes with @UI.SelectionPresentationVariant #quizzesTable: {
  Text               : 'Quizzes Overview',
  SelectionVariant   : {SelectOptions: []},
  PresentationVariant: {
    Visualizations: ['@UI.LineItem#quizzesTable'],
    SortOrder     : [{
      Property  : quizId,
      Descending: false
    }]
  }
};

annotate adminDashboardSrv.Questions with @UI.LineItem #questionsTable: [
  {
    $Type: 'UI.DataField',
    Value: questionId
  },
  {
    $Type: 'UI.DataField',
    Value: text
  }
];

annotate adminDashboardSrv.Questions with @UI.SelectionPresentationVariant #questionsTable: {
  Text               : 'Questions Overview',
  SelectionVariant   : {SelectOptions: []},
  PresentationVariant: {
    Visualizations: ['@UI.LineItem#questionsTable'],
    SortOrder     : [{
      Property  : questionId,
      Descending: false
    }]
  }
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

annotate adminDashboardSrv.Questions with @UI.HeaderInfo: {
  TypeName      : 'Question',
  TypeNamePlural: 'Questions',
  Title         : {Value: text}
};

annotate adminDashboardSrv.Questions with {
  ID @UI.Hidden
};

annotate adminDashboardSrv.Questions with @UI.Identification: [{Value: text}];

annotate adminDashboardSrv.Questions with {
  questionId @Common.Label: 'Question Id';
  text       @Common.Label: 'Question';
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
    Value: text,
    
  },
  {
    $Type      : 'UI.DataField',
    Value      : isCorrect_code,
    Criticality: isCorrect.criticality
  }
];

annotate adminDashboardSrv.Questions with @UI.FieldGroup #questionDetails: {
  $Type: 'UI.FieldGroupType',
  Data : [
    {
      $Type: 'UI.DataField',
      Value: questionId
    },
    {
      $Type: 'UI.DataField',
      Value: text
    }
  ]
};

annotate adminDashboardSrv.Questions with @UI.Facets: [{
  $Type : 'UI.CollectionFacet',
  ID    : 'questionInfoTab',
  Label : 'Question Information',
  Facets: [
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'quizDetails',
      Label : 'Quiz Details',
      Target: '@UI.FieldGroup#questionDetails'
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'answersSection',
      Label : 'Answers',
      Target: 'answers/@UI.LineItem#answersSection'
    }
  ]
}];

annotate adminDashboardSrv.Answers with @UI.DataPoint #text: {
  Value: text,
  Title: 'Question',
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
    ID    : 'Question'
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
  text      @Common.Label: 'Answer';
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
  PresentationVariant: {
    Visualizations: ['@UI.LineItem#answersTable'],
    SortOrder     : [{
      Property  : answerId,
      Descending: false
    }]
  }
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
  PresentationVariant: {
    Visualizations: ['@UI.LineItem#usersTable'],
    SortOrder     : [{
      Property  : userId,
      Descending: false
    }]
  }
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
  PresentationVariant: {
    Visualizations: ['@UI.LineItem#resultsTable'],
    SortOrder     : [{
      Property  : resultId,
      Descending: false
    }]
  }
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

annotate adminDashboardSrv.Quizzes with @odata.draft.enabled;
annotate adminDashboardSrv.Questions with @odata.draft.enabled;
annotate adminDashboardSrv.Answers with @odata.draft.enabled;
annotate adminDashboardSrv.Users with @odata.draft.enabled;
annotate adminDashboardSrv.Results with @odata.draft.enabled;