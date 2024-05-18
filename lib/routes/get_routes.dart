part of './get_pages.dart';

abstract class Routes {
  static const LOGIN = '/auth/login';
  static const NICKNAME = '/auth/nickname';
  static const INFO = '/auth/infomation';
  static const INTEREST = '/auth/interest';
  static const FREQUENCY = '/auth/frequency';
  static const WELCOME = '/auth/welcome';
  static const HOME = '/';
  static const PLUS = '/plus';
  static const SHARE = '/share';
  static const ADDSURVEY = '/share/add';
  static const FIRSTQUIZ = '/share/quiz/one';
  static const SECONDQUIZ = '/share/quiz/two';
  static const RESULTQUIZ = '/share/quiz/result';
  static const SURVEY = '/share/survey';
  static const PROFILE = '/profile';
  static const EDITORNEWS = '/home/editor';
  static const LIVE = '/home/live';
  static const ALLLIVE = '/home/alllive';
  static const TODAYTERM = '/home/term';
  static const PLUSONBOARDING = '/plus/onboarding';
  static const PLUSSTEP = '/plus/step';
  static const PLUSSTORAGE = '/plus/storage';
  static const PLUSCOMPLETE = '/plus/complete';
}