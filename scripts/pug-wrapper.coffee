# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   Have Ah-nahld comment on what a great deal you're getting

module.exports = (robot) ->

  robot.listenerMiddleware (context, next, done) ->
    if pugCommand(context.response.message.text)
      console.log("PUG COMMAND!!")
      pugCount = getPugCount(context.response.message.text)

      if tooManyPugs(pugCount)
        context.response.reply "I don't think you can handle that much cute"
        done()
      else
        next()
    else
      next()

pugCommand = (commandString) ->
  pugRegex().test(commandString)

pugRegex = () ->
  /pug bomb/i

getPugCount = (pugCommand) ->
  /(\d+)/.exec(pugCommand)[1]

tooManyPugs = (count) ->
  count > 10 ? true : false
