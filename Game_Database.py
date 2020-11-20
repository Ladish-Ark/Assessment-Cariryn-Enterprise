from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__, static_url_path='/static')

gamedb = mysql.connector.connect(user='callum', password='GT67phn@',
                              host='192.168.0.34', database='game',
                              auth_plugin='mysql_native_password')


#Code runs if index.html called (root)
@app.route('/', methods=['GET', 'POST'])
def index():
    if "viewcharacter" in request.form:
        return render_template('/view_char.html', data=viewchar())
    elif "viewitems" in request.form:
        return render_template('/view_item_charpick.html')
    elif "viewencounters" in request.form:
        return render_template('/.html')
    elif "characteroptions" in request.form:
        return render_template('/character_edit.html')
    elif "additems" in request.form:
        return render_template('/add_item.html') 
    elif "addencounters" in request.form:
        return render_template('/.html') 
    else:
        return render_template('/index.html')


@app.route('/character_edit', methods=['GET', 'POST'])
def character():  
  if "submit" in request.form:
          details = request.form
          Surname = details['Surname']
          FirstName = details['FirstName']
          Address = details['Address']
          Address2 = details['Address2']
          Phone = details['Phone']
          cur = gamedb.cursor()
          # Need to finish line 
          #cur.execute("INSERT INTO player_characters(first_name, last_name, raceID_FK1, classID_FK1, alignmentID_FK1, level, strength, brawn, agility, mettle, craft, insight, wits, resolve, life, armourID_FK1, protectionID_FK1) VALUES (%s, %s, %s, %s, %s %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,)", (Surname, FirstName, Address, Address2,Phone))
          gamedb.commit()
          cur.close()
          
  elif "cancel" in request.form:
        pass
  return render_template('/index.html')

@app.route('/view_item_charpick.html', methods=['GET','POST'])
def item_charpick():
    if "Select" in request.form:
        return render_template('/view_item.html')
    elif "Back" in request.form:
        pass
    return render_template('/index.html')

#@app.route('/view_item.html', methods=['GET','POST'])
#def item_view():
    #if "Back" in request.form:
        #return render_template('/index.html')

def viewchar():
    cur = gamedb.cursor()
    cur.execute("SELECT first_name, last_name, race.name, classes.classes, alignment.type, level, strength, brawn, agility, mettle, craft, insight, wits, resolve, life, armour.name, protection.name FROM player_characters, race, classes, alignment, armour, protection where player_characters.raceID_FK1=race.raceID and player_characters.classID_FK1=classes.classID and player_characters.alignmentID_FK1=alignment.alignmentID and player_characters.armourID_FK1=armour.armourID and player_characters.protectionID_FK1=protection.protectionID;")
    data = cur.fetchall()
    return data

if __name__ == '__main__':
    app.run(debug=True)
    #app.run()
