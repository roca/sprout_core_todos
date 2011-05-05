// ==========================================================================
// Project:   Todos.TaskDataSource
// Copyright: ©2011 My Company, Inc.
// ==========================================================================
/*globals Todos */

/** @class

  (Document Your Data Source Here)

  @extends SC.DataSource
*/

sc_require('models/task');
Todos.TASKS_QUERY = SC.Query.local(Todos.Task, {
  orderBy: 'isDone,description'
});


Todos.TaskDataSource = SC.DataSource.extend(
/** @scope Todos.TaskDataSource.prototype */ {

  // ..........................................................
  // QUERY SUPPORT
  // 

fetch: function(store, query) {
  if (query === Todos.TASKS_QUERY) {
    SC.Request.getUrl('/tasks').header({'Accept': 'application/json'}).json()
      .notify(this, 'didFetchTasks', store, query)
      .send();
    return YES;
  }
  return NO;
},
didFetchTasks: function(response, store, query) {
  if (SC.ok(response)) {
    store.loadRecords(Todos.Task, response.get('body').content);
    store.dataSourceDidFetchQuery(query);
  } else store.dataSourceDidErrorQuery(query, response);
},

  // ..........................................................
  // RECORD SUPPORT
  // 
  
  retrieveRecord: function(store, storeKey) {
    
    // TODO: Add handlers to retrieve an individual record's contents
    // call store.dataSourceDidComplete(storeKey) when done.
    
    return NO ; // return YES if you handled the storeKey
  },
  
  createRecord: function(store, storeKey) {
    
    // TODO: Add handlers to submit new records to the data source.
    // call store.dataSourceDidComplete(storeKey) when done.
    
    return NO ; // return YES if you handled the storeKey
  },
  
  updateRecord: function(store, storeKey) {
    
    // TODO: Add handlers to submit modified record to the data source
    // call store.dataSourceDidComplete(storeKey) when done.

    return NO ; // return YES if you handled the storeKey
  },
  
  destroyRecord: function(store, storeKey) {
    
    // TODO: Add handlers to destroy records on the data source.
    // call store.dataSourceDidDestroy(storeKey) when done
    
    return NO ; // return YES if you handled the storeKey
  }
  
}) ;
; if ((typeof SC !== 'undefined') && SC && SC.scriptDidLoad) SC.scriptDidLoad('todos');