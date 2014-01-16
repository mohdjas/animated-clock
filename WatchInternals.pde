/*
    Describes the internal functions of the watch, ie, time retrieval.
    
    Must be inherited by all Watch classes.

*/

public class WatchInternals {
    int getHours(){
      return hour();
    }
    int getMinutes(){
      return minute();
    }
    int getSeconds(){
      return second();
    }
    int getDay(){
      return day() - 1;
    }
    int getMonth(){
      return month() - 1;
    }
    int getYear(){
      return year();
    }
    boolean isAfterNoon(){
      return getHours() >= 12;
    }
}

/*
    Interface that must be implemented by all Watch classes.
    
*/
  
public interface IWatch {
    //TODO: change name to reflect that not all faces will be 'hands'   
    void drawClock();
    void drawSecondsHand();
    void drawMinutesHand();
    void drawHoursHand();
    //TODO: change name as it will not necessarily 'display' an alarm
    void displayAlarm();    
};
