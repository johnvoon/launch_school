var today = new Date();
var weekday = today.getDay();
var daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
var date = today.getDate();

function dateSuffix() {
  
}

console.log('Today\'s date is ' + daysOfWeek[weekday] + ' the ' + date + );
