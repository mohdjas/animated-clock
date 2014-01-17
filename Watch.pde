class Watch extends WatchInternals implements IWatch {
    private float secondRadius, minuteRadius, hourRadius, dayRadius, monthRadius, yearRadius;
    private float facePlateRadius;
    private float originX, originY;
    private float hourCentreX, hourCentreY, minuteCentreX, minuteCentreY;
    private float dayCentreX, dayCentreY, monthCentreX, monthCentreY;
    private float yearCentreX, yearCentreY;
    private int secondsColour, minutesColour, hoursColour, daysColour, monthsColour, yearsColour, facePlateColour;
    
    Watch(int canvasWidth, int canvasHeight){
      originX = canvasWidth/2;
      originY = canvasHeight/2;
      yearCentreX = originX;
      yearCentreY = originY;
      
      facePlateColour = 191;
      
      secondsColour = 255;
      minutesColour = 153;
      hoursColour = 128;
      
      daysColour = 102;
      monthsColour = 77;
      yearsColour = 51;
      
      facePlateRadius = 0.48*canvasHeight;
      yearRadius = facePlateRadius;
      monthRadius = 0.75*yearRadius;
      dayRadius = 0.45*monthRadius;
      hourRadius = 0.40*dayRadius;
      minuteRadius = 0.40*hourRadius;
      secondRadius = (1.0/16)*minuteRadius;
    }  
    
    void drawClock(){
      //drawFacePlate();
      drawYearsHand();
      drawMonthsHand();
      drawDaysHand();
      drawHoursHand();
      drawMinutesHand();
      drawSecondsHand();
    }
    
    void drawFacePlate(){
      fill(facePlateColour);
      ellipse(originX, originY, facePlateRadius, facePlateRadius);
    }
    
    void drawYearsHand(){
      fill(yearsColour);
      ellipse(yearCentreX, yearCentreY, yearRadius, yearRadius);
    }
    
    void drawMonthsHand(){
      float monthAngle = getMonth()*(360.0/12) + getDay()*(30.0/getDaysInMonth());
      monthCentreX = yearCentreX + (yearRadius-monthRadius)*sin(radians(180-monthAngle));
      monthCentreY = yearCentreY + (yearRadius-monthRadius)*cos(radians(180-monthAngle));
      
      fill(monthsColour);
      ellipse(monthCentreX, monthCentreY, monthRadius, monthRadius);
      
      stroke(monthsColour);
      strokeWeight(16);
      line(yearCentreX, yearCentreY, monthCentreX, monthCentreY);
      noStroke();
    }
    
    void drawDaysHand(){
      float dayAngle = getDay()*(360.0/getDaysInMonth());
      dayCentreX = monthCentreX + (monthRadius-dayRadius)*sin(radians(180-dayAngle));
      dayCentreY = monthCentreY + (monthRadius-dayRadius)*cos(radians(180-dayAngle));
      
      fill(daysColour);
      ellipse(dayCentreX, dayCentreY, dayRadius, dayRadius);
      
      stroke(daysColour);
      strokeWeight(12);
      line(monthCentreX, monthCentreY, dayCentreX, dayCentreY);
      noStroke();
    }
    
    int getDaysInMonth(){
      int month = getMonth() + 1;
      switch(month){
        case 1: case 3: case 5:
        case 7: case 8: case 10:
        case 12: return 31;
        
        case 4: case 6: case 9:
        case 11: return 30;
        
        case 2: return isLeapYear() ? 29 : 28;
        default: return -1;
      }
    }
    
    boolean isLeapYear(){
      return getYear()%4 == 0;
    }
    
    void drawHoursHand(){
      float hourAngle = (getHours())*15 + getMinutes()*0.25;
      hourCentreX = dayCentreX + (dayRadius-hourRadius)*sin(radians(180-hourAngle));
      hourCentreY = dayCentreY + (dayRadius-hourRadius)*cos(radians(180-hourAngle));
      
      fill(hoursColour);
      ellipse(hourCentreX, hourCentreY, hourRadius, hourRadius);
    
      stroke(hoursColour);
      strokeWeight(8);
      line(dayCentreX, dayCentreY, hourCentreX, hourCentreY);
      noStroke();      
    }
    
    void drawMinutesHand(){
      float minuteAngle = getMinutes()*6 + getSeconds()*0.1;
      minuteCentreX = hourCentreX + (hourRadius-minuteRadius)*sin(radians(180-minuteAngle));
      minuteCentreY = hourCentreY + (hourRadius-minuteRadius)*cos(radians(180-minuteAngle));
      
      fill(minutesColour);
      ellipse(minuteCentreX, minuteCentreY, minuteRadius, minuteRadius);
      
      stroke(minutesColour);
      strokeWeight(4);
      line(hourCentreX, hourCentreY, minuteCentreX, minuteCentreY);
      noStroke();
    }
    
    void drawSecondsHand(){
      float x, y;
      float secondAngle = getSeconds()*6;
      
      x = minuteCentreX + (minuteRadius-secondRadius)*sin(radians(180-secondAngle));
      y = minuteCentreY + (minuteRadius-secondRadius)*cos(radians(180-secondAngle));
      fill(secondsColour);
      ellipse(x, y, secondRadius, secondRadius);
      stroke(secondsColour);
      strokeWeight(1);
      line(minuteCentreX, minuteCentreY, x, y);
      noStroke();
    }
     
    void displayAlarm(){
    }
}
