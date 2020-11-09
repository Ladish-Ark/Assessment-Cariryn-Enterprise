from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

#connecting to local database. This is obvs terrible security. ( discussed as part of lead in to U7)
#vetdb = mysql.connector.connect(user='Vets', password='Vets123456',
#                              host='127.0.0.1', database='vets',
#                              auth_plugin='mysql_native_password')


#Code runs if index.html called (root)
@app.route('/', methods=['GET', 'POST'])
def index():
    if "viewcharacter" in request.form:
        return render_template('/view_char.html')
    elif "viewitems" in request.form:
        return render_template('/view_item.html')
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


#Code runs if adding a new owner (submit pressed on owner.html page)
@app.route('/owner', methods=['GET', 'POST'])
def owner():
  #Takes details from form and crafts a sql statement  
  if "submit" in request.form:
          details = request.form
          Surname = details['Surname']
          FirstName = details['FirstName']
          Address = details['Address']
          Address2 = details['Address2']
          Phone = details['Phone']
          cur = vetdb.cursor()
          cur.execute("INSERT INTO owner(Surname, FirstName, Address, Address2, Phone) VALUES (%s, %s,%s, %s,%s)", (Surname, FirstName, Address, Address2,Phone))
          vetdb.commit()
          cur.close()
          
  elif "cancel" in request.form:
        pass
  return render_template('/index.html')

@app.route('/petadd', methods=['GET', 'POST'])
def petadd():
  #Takes details from form and crafts a sql statement  
  if "submit" in request.form:
        details = request.form
        ownerID = getpersonID(details['owner'])
        int_ownerID = ownerID[0]
        int_ownerID = int(int_ownerID[0])
        PetName = details['PetName']
        PetType = details['PetType']
        PetAge = details['PetAge']
        #OwnerID = details['OwnerID']
        cur = vetdb.cursor()
        cur.execute("INSERT INTO pets(PetName, PetType, PetAge, OwnerID) VALUES (%s, %s,%s, %s)", (PetName, PetType, PetAge, int_ownerID))
        vetdb.commit()
        cur.close()
          
  elif "cancel" in request.form:
        pass
  return render_template('/index.html')

if __name__ == '__main__':
    app.run(debug=True)
    #app.run()
