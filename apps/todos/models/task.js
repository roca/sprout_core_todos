// ==========================================================================
// Project:   Todos.Task
// Copyright: ©2011 My Company, Inc.
// ==========================================================================
/*globals Todos */

/** @class

  (Document your Model here)

  @extends SC.Record
  @version 0.1
*/


// App.Rails.Record = SC.Record.extend({
//   primaryKey : "id" // Extend your records from App.Rails.Record instead of SC.Record.
// });

Todos.Task = SC.Record.extend(
/** @scope Todos.Task.prototype */ {

  // TODO: Add your own code here.
   
   isDone: SC.Record.attr(Boolean),
   description: SC.Record.attr(String)
   
}) ;
