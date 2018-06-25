# Mocking External Dependencies

- Talk through the user stories, and the domain model.

- Make sure all developers have cloned the repository.

- Share the below instructions, one at a time. Use [HackMD](https://hackmd.io/)

- Give the developers a few minutes to complete the instruction, then pick a developer to share their code.


## Instructions

1. Write a test for viewing the `message` on the `Greeter` class

2. Once you have a failing test, use the test fail errors to test drive your development until the test passes.
> Hint: Red, Green, Refactor is a bit of a simplification. Really the TDD process is Red, read the error message, write code to fix only that error message, run the test again. Repeat until the test turns Green, then Refactor!

3. Create a double of the `twilio_client`, update your `Greeter` tests so that this mock is injected into the `Greeter` class in our unit tests.

4. Step 3 will have broken your unit tests, so update the `Greeter` class to take the injected `twilio_client`.
> Hint: we don't need to worry about the default values right now, let's just get the tests passing

5. From the Twilio quickstart guide, we can see that configuration information needs to be sent to the twilio client, so let's create a double for a config hash and inject that into the `Greeter` class in our unit tests.
> Hint: the config needs to include:
  - account_sid: a string
  - account_token: a string
  - from: a phone number

6. Update the `Greeter` class to take the injected config - your tests should be passing again!

7. Using the domain model we can see that the user will call `send_message` on the `Greeter` and pass in a phone number. And the Greeter should return something called `Message`. So, let's write a test for `send_message` that checks for this behaviour.

8. We should now have a failing test, but it's not quite complete. We can also see from the domain model that `Greeter` will call two methods on the Twilio client when send_message is called. So let's mock these methods on the `twilio_client` double using the `allow` syntax.

  - `messages` needs to return the twilio_client when it's called, so that create can be called.

  - `create` will be called with an argument - a `config` hash, and it should return something called `Message`.

  >Hint: It's a good idea to check the format and contents of `config` in the Twilio docs,

9. Finally, we have a test we can use to implement Twilio integration! Use the error messages from the failing test to test-drive your development to Green.
> We have passing tests, but what will happen when you try to send the message to your number?

10. Now, update your code to use a default config hash if none is provided. (Don't commit this to GitHub)

11. Now, update your code to use the Twilio client by default, and make sure it is set up using the config as per the documentation.

Try sending the greeting message to your own number!


### Useful links

- [Twilio Quick Start](https://www.twilio.com/docs/sms/quickstart/ruby)
