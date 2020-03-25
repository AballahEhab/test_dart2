
main(List<String> arguments) {

  Schedule calender = Schedule();

  calender.addNewReservation(DateTime(2020,5,3,7), DateTime(2020,5,3,9), 'abdallah');
  calender.addNewReservation(DateTime(2020,5,3,9), DateTime(2020,5,3,11), 'abdallah');
  calender.addNewReservation(DateTime(2020,5,3,12), DateTime(2020,5,3,14), 'abdallah');
  calender.addNewReservation(DateTime(2020,5,3,15), DateTime(2020,5,3,17), 'abdallah');
  calender.addNewReservation(DateTime(2020,5,3,20), DateTime(2020,5,3,21), 'abdallah');
  calender.addNewReservation(DateTime(2020,5,3,22), DateTime(2020,5,3,23), 'abdallah');


  Reservation reservation1 = calender.checkStartingDate(DateTime(2020,5,3,7));

  if(reservation1== null){

    print('you can reserve from this hour');

  }else{
    print('the hall is reserved from ${reservation1.start.hour} to  ${reservation1.end.hour} you asked to reserve it at  7');
  }


}

class Reservation {
  DateTime start;
  DateTime end;
  var UserName;

  Reservation(this.start, this.end, this.UserName);


}

class Schedule{

  List<Reservation> reservations;

  Calender(){
    reservations = new List();
  }

  void addNewReservation(DateTime start,DateTime end, var userName){
    Reservation reservation = Reservation(start, end, userName);
    reservations.add(reservation);
  }

  Reservation checkStartingDate(DateTime startDate){

    for(int counter=0;counter<reservations.length;counter++) {
      Reservation a_reservation = reservations[counter];

      if (startDate.isAtSameMomentAs(a_reservation.start)) {
        return a_reservation;
      }else if(startDate.isAtSameMomentAs(a_reservation.end)){
        return null;
      }else {
        if (startDate.isAfter(a_reservation.start)) {
          if (startDate.isBefore(a_reservation.end)) {
            return a_reservation;
          }
        }
      }
    }
    return null;
  }




  Reservation checkEndDate(DateTime endDate){

    for(int counter=0;counter<reservations.length;counter++) {
      Reservation a_reservation = reservations[counter];

      if (endDate.isAtSameMomentAs(a_reservation.end)) {
        return a_reservation;
      }else if(endDate.isAtSameMomentAs(a_reservation.start)){
        return null;
      }else {
        if (endDate.isAfter(a_reservation.start)) {
          if (endDate.isBefore(a_reservation.end)) {
            return a_reservation;
          }
        }
      }
    }
    return null;
  }

}
