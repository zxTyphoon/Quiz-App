using { adminDashboard } from '../db/schema.cds';

service adminDashboardSrv {
  @odata.draft.enabled
  entity Quizzes as projection on adminDashboard.Quizzes;
  entity Questions as projection on adminDashboard.Questions;
  entity Answers as projection on adminDashboard.Answers;
  entity Users as projection on adminDashboard.Users;
  entity Results as projection on adminDashboard.Results;
}