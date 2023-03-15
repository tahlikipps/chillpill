import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatId: Number, currentUserId: Number, imageLink: String }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.chatIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    console.log(`Subscribed to the chat with the id ${this.chatIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chat")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  #insertMessageAndScrollDown(data) {
    // Logic to know if the sender is the current_user
    const currentUserIsSender = this.currentUserIdValue === data.sender_id

    // Creating the whole message from the `data.message` String
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)

    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="msg-row d-flex ${this.#justifyClass(currentUserIsSender)}">
      <span class="sent-time-receiver ${this.#hideTimeReceiverStyle(currentUserIsSender)}">${new Date().getHours()}:${new Date().getMinutes()}</span>

        <div class="chat-vet-avt">
          <img src="${this.imageLinkValue}" />
        </div>
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
        <span class="sent-time-sender ${this.#hideTimeSenderStyle(currentUserIsSender)}">${new Date().getHours()}:${new Date().getMinutes()}</span>
        </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end msg-row-sender" : "justify-content-start msg-row-receiver"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  #hideTimeReceiverStyle(currentUserIsSender) {
    return currentUserIsSender ? "" : "hide-time"
  }

  #hideTimeSenderStyle(currentUserIsSender) {
    return currentUserIsSender ? "hide-time" : ""
  }
}
