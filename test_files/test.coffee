# todo

###
  todo
###
class Testclass
  testmethod: (value, val) ->
    test = """
            string
           """
    test = "string #{ test }"
    return test

  types: ->
    regex = /^\b1?[-.\s]?(\d{3})|([A-z])[-.\s]?\d{3}[-.\s]?\d{4}\b$/img

  classVar: (e) ->
    @element = e

  collections: (number) ->
    array = [1, 2, 3, 4, 5, 6, number]
    hash = {
      id: 1,
      float: 1.2,
      title: "objtitle",
      vals: array
    }

  conditionals: ->
    if true && false
      this.classVar("e")
    else
      RESULT

  loops: ->
    for items in [1, 2, 3]
      console.log items

  testType: (obj) ->
    obj typeof undefined

  tryCatch: ->
    try
      allHellBreaksLoose()
      catsAndDogsLivingTogether()
    catch error
      print error
    finally
      cleanUp()

  switchCase: ->
    score = 76
    grade = switch
      when score < 60 then 'F'
      when score < 70 then 'D'
      when score < 80 then 'C'
      when score < 90 then 'B'
      else 'A'

  invalidCoffee: ->
    function() {
      return bogus;
    }

#inheritance test
class Animal
  constructor: (@name) ->

  move: (meters) ->
    alert @name + " moved #{meters}m."

class Snake extends Animal
  move: ->
    alert "Slithering..."
    super 5

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"

sam.move()
tom.move()

