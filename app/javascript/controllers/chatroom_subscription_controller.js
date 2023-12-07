import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "input"]

  connect() {
    const chatroomId = this.chatroomIdValue;
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: chatroomId },
      {
        received: data => {
          this.#insertMessageAndScrollDown(data);
        }
      }
    );

    console.log(`Subscribed to the chatroom with the id ${chatroomId}.`);
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.children[0].insertAdjacentHTML("beforeend", data);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }


  disconnect() {
    console.log("Unsubscribed from the chatroom");
    this.channel.unsubscribe();
  }
}
