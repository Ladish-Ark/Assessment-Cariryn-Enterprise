from flask import Flask, render_template, request
import mysql.connector
import re

app = Flask(__name__, static_url_path='/static')

gamedb = mysql.connector.connect(user='snazzylaces', password='GT67phn@',
                              host='192.168.0.34', database='game',
                              auth_plugin='mysql_native_password')


#Code runs if index.html called (root)
@app.route('/', methods=['GET', 'POST'])
def index():
    if "viewcharacter" in request.form:
        return render_template('/view_char.html', data=viewchar())
    elif "viewitems" in request.form:
        return render_template('/view_item_charpick.html', data=view_char_items())
    elif "viewencounters" in request.form:
        return render_template('/pick_encounter.html')
    elif "viewnpclife" in request.form:
        return render_template('/viewnpc.html', data=view_npc())
    elif "characteroptions" in request.form:
        return render_template('/character_edit.html', data=character_edit_race(), data1=character_edit_class(), data2=character_edit_alignment(), data3=character_edit_armour(), data4=character_edit_protection())
    elif "additems" in request.form:
        return render_template('/item.html') 
    elif "addencounters" in request.form:
        return render_template('/add_encounter.html', data=view_locations(), data1=view_npc_name(), data2=view_enemies(), data3=view_items()) 
    else:
        return render_template('/index.html')


@app.route('/character_edit.html', methods=['GET', 'POST'])
def character():
    if "submit" in request.form:
        details = request.form

        FirstName = details['FirstName']
        Surname = details['Surname']

        ###########################################################################
        #                     Get details from drop down boxes                    #
        ###########################################################################

        ## Selected RaceID
        race = details['race_pick']

        cur = gamedb.cursor()
        cur.execute('SELECT raceID FROM race WHERE race.name="' + race + '"')
        raceid = cur.fetchall()

        temp_raceid = re.sub(r'[\[\]\(\), ]', '', str(raceid))
        print(temp_raceid)
        

        ## Selected ClassID
        class_name = details['class_pick']

        cur = gamedb.cursor()
        cur.execute('SELECT classID FROM classes WHERE classes.classes="' + class_name + '"')
        classid = cur.fetchall()

        temp_classid = re.sub(r'[\[\]\(\), ]', '', str(classid))
        print(temp_classid)


        ## Selected Alignment
        alignment = details['alignment_pick']

        cur = gamedb.cursor()
        cur.execute('SELECT alignmentID FROM alignment WHERE alignment.type="' + alignment + '"')
        alignmentid = cur.fetchall()

        temp_alignmentid = re.sub(r'[\[\]\(\), ]', '', str(alignmentid))
        print(temp_alignmentid)


        ## Selected Armour
        armour = details['armour_pick']

        cur = gamedb.cursor()
        cur.execute('SELECT armourID FROM armour WHERE armour.name="' + armour + '"')
        armourid = cur.fetchall()

        temp_armourid = re.sub(r'[\[\]\(\), ]', '', str(armourid))
        print(temp_armourid)


        ## Selected Protection
        protection = details['protection_pick']

        cur = gamedb.cursor()
        cur.execute('SELECT protectionID FROM protection WHERE protection.name="' + protection + '"')
        protectionid = cur.fetchall()

        temp_protectionid = re.sub(r'[\[\]\(\), ]', '', str(protectionid))
        print(temp_protectionid)

        ###########################################################################
        #                                   END                                   #
        ###########################################################################


        Level = details['Level']
        Strength = details['Strength']
        Brawn = details['Brawn']
        Agility = details['Agility']
        Mettle = details['Mettle']
        Craft = details['Craft']
        Insight = details['Insight']
        Wits = details['Wits']
        Resolve = details['Resolve']
        Life = details['Life']

        cur = gamedb.cursor()
        sql = ("INSERT INTO player_characters(first_name, last_name, raceID_FK1, classID_FK1, alignmentID_FK1, level, strength, brawn, agility, mettle, craft, insight, wits, resolve, life, armourID_FK1, protectionID_FK1) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
        val =  (FirstName, Surname, temp_raceid, temp_classid, temp_alignmentid, Level, Strength, Brawn, Agility, Mettle, Craft, Insight, Wits, Resolve, Life, temp_armourid, temp_protectionid)
        cur.execute(sql, val)
        gamedb.commit()
        cur.close()
          
    elif "cancel" in request.form:
        pass
    return render_template('/index.html')

@app.route('/view_item_charpick.html', methods=['GET', 'POST'])
def item_charpick():
    if "Select" in request.form:
        details = request.form
        Character_Details = details['character']
        Character_Details = Character_Details.split(" ")
        CharacterFirstName = Character_Details[0]
        CharacterSecondName = Character_Details[1]
        character = get_char_name(CharacterFirstName, CharacterSecondName)
        #character2 = get_char_name(CharacterSecondName)
        print(CharacterFirstName)
        print(CharacterSecondName)
        try:
            int_nameID = character[0]
            int_nameID = str(int_nameID[0])
        except IndexError:
            print("No Data For Selected Character")
        return render_template('/view_item.html', data=get_char_name(CharacterFirstName, CharacterSecondName), data1=total_load(code))
    elif "viewallitems" in request.form:
        return render_template('/view_all_items.html', data=items_most_expensive_first())
    elif "Back" in request.form:
        pass
    return render_template('/index.html')

@app.route('/view_all_items.html', methods=['GET', 'POST'])
def view_all_items():
    if "Back" in request.form:
        pass
    return render_template('/index.html')

@app.route('/item.html', methods=['GET', 'POST'])
def add_items():
    if "inventory" in request.form:
        return render_template('/add_item_character.html', data=view_char_items(), data1=view_items())
    elif "inv_remove" in request.form:
        return render_template('/remove_item_char.html', data=view_char_items())
    elif "database" in request.form:
        return render_template('/add_item_database.html')
    elif "exit" in request.form:
        pass
    return render_template('/index.html')

@app.route('/add_item_character.html', methods=['GET', 'POST'])
def add_item_char():
    if "add" in request.form:
        details = request.form

        # Get PlayerID 
        Char = details['Character']

        char = Char.split(" ")
        first_char = char[0]
        surname_char = char[1]

        print(first_char)
        print(surname_char)
        cur = gamedb.cursor()
        characterid = ("SELECT playerID FROM player_characters where player_characters.first_name='" + first_char + "' and player_characters.last_name='" + surname_char + "'")
        cur.execute(characterid)
        characterid = cur.fetchall()
        print(characterid)

        temp_charid = re.sub(r'[\[\]\(\), ]', '', str(characterid))
        print(temp_charid)

        # Get ItemID
        item = details['items']

        cleanstring = item.strip()
        print(cleanstring)
        
        cur = gamedb.cursor()
        itemid = ('SELECT itemID FROM items where items.name="' + cleanstring + '"')
        cur.execute(itemid)
        itemid = cur.fetchall()

        temp_itemid = re.sub(r'[\[\]\(\), ]', '', str(itemid))
        print(temp_itemid)

        # Final Commit Addition Of Item To Specified Player Inventory

        cur = gamedb.cursor()
        sql = ("INSERT INTO inventory(playerID_FK1, itemID_FK2) VALUES (%s, %s)")
        val = (temp_charid, temp_itemid)
        cur.execute(sql, val)
        gamedb.commit()
        cur.close()

    elif "exit" in request.form:
        pass
    return render_template('/index.html')

@app.route('/add_item_database.html', methods=['GET', 'POST'])
def add_item_data():
    if "add" in request.form:
        details = request.form

        name = details['item_name']
        cost = details['item_cost']
        load = details['item_load']

        cur = gamedb.cursor()
        sql = ("INSERT INTO items(name, cost, item_load) VALUES (%s, %s, %s)")
        val = (name, cost, load)
        cur.execute(sql, val)
        gamedb.commit()
        cur.close()

    elif "exit" in request.form:
        pass
    return render_template('/index.html')

@app.route('/pick_encounter.html', methods=['GET', 'POST'])
def enc_option():
    if "spider" in request.form:
        return render_template('/view_encounter.html', data=giant_spider())
    elif "all" in request.form:
        return render_template('/view_encounter.html', data=all_encounters())
    elif "Back" in request.form:
        pass
    return render_template('/index.html')

@app.route('/add_encounter.html', methods=['GET', 'POST'])
def add_encounter():
    details = request.form

    if "add" in request.form:

        location = details['Location']
        npc = details['NPC']
        enemy = details['Enemies']
        item = details['item']

        ## Location
        cur = gamedb.cursor()
        cur.execute('SELECT locationID FROM locations WHERE locations.name="' + location + '"')
        locationid = cur.fetchall()

        temp_locationid = re.sub(r'[\[\]\(\), ]', '', str(locationid))

        ## NPC
        cur = gamedb.cursor()
        cur.execute('SELECT npcID FROM non_player_characters WHERE non_player_characters.name="' + npc + '"')
        npcid = cur.fetchall()

        temp_npcid = re.sub(r'[\[\]\(\), ]', '', str(npcid))

        ## Enemy
        cur = gamedb.cursor()
        cur.execute('SELECT enemiesID FROM enemies WHERE enemies.name="' + enemy + '"')
        enemyid = cur.fetchall()

        temp_enemyid = re.sub(r'[\[\]\(\), ]', '', str(enemyid))

        ## Item
        cur = gamedb.cursor()
        cur.execute('SELECT itemID FROM items WHERE items.name="' + item + '"')
        itemid = cur.fetchall()

        temp_itemid = re.sub(r'[\[\]\(\), ]', '', str(itemid))

        ## INSERT INTO DATABASE
        cur = gamedb.cursor()
        sql = ('INSERT INTO encounter(locationID_FK1, npcID_FK1, enemiesID_FK1, itemID_FK1) VALUES (%s, %s, %s, %s)')
        val = (temp_locationid, temp_npcid, temp_enemyid, temp_itemid)
        cur.execute(sql, val)
        gamedb.commit()
        cur.close()

    elif "exit" in request.form:
        pass
    return render_template('/index.html')

##################################################################################################################################################### HELP HELP HELP HELP HELP 

@app.route('/remove_item_char.html', methods=['GET', 'POST'])
def rem_item_char():
    if "next" in request.form:
        return render_template('/remove_item_item.html', data=remove_item_list())  
    elif "Back" in request.form:
        pass
    return render_template('/index.html')

def remove_item_list():
    details = request.form

    character = details['char_rem_item']
    print(character)

    character = character.split(" ")
    first_char = character[0]
    surname_char = character[1]

    print(first_char)
    print(surname_char)

    cur = gamedb.cursor()
    cur.execute("SELECT playerID FROM player_characters WHERE player_characters.first_name='" + first_char + "' AND player_characters.last_name='" + surname_char + "'")
    player = cur.fetchall()

    temp_playerid = re.sub(r'[\[\]\(\), ]', '', str(player))
    print(temp_playerid)

    cur = gamedb.cursor()
    cur.execute("SELECT itemID_FK2 FROM inventory WHERE inventory.playerID_FK1='" + temp_playerid + "'")
    item = cur.fetchall()

    print(len(item))
    print(item[0])

    temp_itemid = re.sub(r'[\[\]\(\), ]', '', str(item))

    cur = gamedb.cursor()
    cur.execute("SELECT name FROM items WHERE items.itemID='" + temp_itemid + "'")
    data = cur.fetchall()
    return data

################################################################################################################################################################################################################################################

def view_locations():
    cur = gamedb.cursor()
    cur.execute('SELECT name FROM locations')
    data = cur.fetchall()
    return data

def view_enemies():
    cur = gamedb.cursor()
    cur.execute('SELECT name FROM enemies')
    data = cur.fetchall()
    return data

def view_npc_name():
    cur = gamedb.cursor()
    cur.execute('SELECT name FROM non_player_characters')
    data = cur.fetchall()
    return data

def all_encounters():
    cur = gamedb.cursor()
    cur.execute('SELECT locations.name, non_player_characters.name, enemies.name, items.name FROM locations, non_player_characters, enemies, items, encounter WHERE locations.locationID=encounter.locationID_FK1 AND non_player_characters.npcID=encounter.npcID_FK1 AND enemies.enemiesID=encounter.enemiesID_FK1 AND items.itemID=encounter.itemID_FK1')
    data = cur.fetchall()
    return data

def giant_spider():
    cur = gamedb.cursor()
    cur.execute('SELECT locations.name, non_player_characters.name, enemies.name, items.name FROM locations, non_player_characters, enemies, items, encounter WHERE locations.locationID=encounter.locationID_FK1 AND non_player_characters.npcID=encounter.npcID_FK1 AND enemies.enemiesID=encounter.enemiesID_FK1 AND enemies.enemiesID="8" AND items.itemID=encounter.itemID_FK1')
    data = cur.fetchall()
    return data

def items_most_expensive_first():
    cur = gamedb.cursor()
    cur.execute('SELECT name, cost, item_load FROM items ORDER BY cost DESC')
    data = cur.fetchall()
    return data

def view_npc():
    cur = gamedb.cursor()
    cur.execute('SELECT name, Life FROM non_player_characters')
    data = cur.fetchall()
    return data

def view_char_items():
    cur = gamedb.cursor()
    cur.execute('SELECT CONCAT(first_name," ",last_name) FROM player_characters')
    data = cur.fetchall()
    return data

def get_char_name(first_num, second_num):
    cur = gamedb.cursor()
    check = ("SELECT playerID FROM player_characters where player_characters.first_name='" + first_num + "' and player_characters.last_name='" + second_num +"'")
    cur.execute(check)
    code = cur.fetchall()

    temp = re.sub(r'[\[\]\(\), ]', '', str(code))
    print(temp)

    total_load(temp)

    get_items = ("SELECT name, cost, item_load FROM inventory, items WHERE inventory.playerID_FK1='" + temp + "' and inventory.itemID_FK2=items.itemID") 
    cur.execute(get_items)
    data = cur.fetchall()
    print(data)
    return data

def total_load(temp):
    cur = gamedb.cursor()
    cur.execute('SELECT item_load FROM items, inventory WHERE inventory.playerID_FK1="' + temp + '" AND inventory.itemID_FK2=items.itemID')
    data = cur.fetchall()
    return data

def view_items():
    cur = gamedb.cursor()
    cur.execute("SELECT name FROM items")
    data = cur.fetchall()
    return data


def viewchar():
    cur = gamedb.cursor()
    cur.execute("SELECT first_name, last_name, race.name, classes.classes, alignment.type, level, strength, brawn, agility, mettle, craft, insight, wits, resolve, life, armour.name, protection.name FROM player_characters, race, classes, alignment, armour, protection where player_characters.raceID_FK1=race.raceID and player_characters.classID_FK1=classes.classID and player_characters.alignmentID_FK1=alignment.alignmentID and player_characters.armourID_FK1=armour.armourID and player_characters.protectionID_FK1=protection.protectionID;")
    data = cur.fetchall()
    return data

def character_edit_race():
    cur = gamedb.cursor()
    cur.execute('SELECT name FROM race')
    data = cur.fetchall()
    return data

def character_edit_class():
    cur = gamedb.cursor()
    cur.execute('SELECT classes FROM classes')
    data = cur.fetchall()
    return data

def character_edit_armour():
    cur = gamedb.cursor()
    cur.execute('SELECT name FROM armour')
    data = cur.fetchall()
    return data

def character_edit_protection():
    cur = gamedb.cursor()
    cur.execute('SELECT name FROM protection')
    data = cur.fetchall()
    return data

def character_edit_alignment():
    cur = gamedb.cursor()
    cur.execute('SELECT type FROM alignment')
    data = cur.fetchall()
    return data


if __name__ == '__main__':
    app.run(debug=True)
    #app.run()