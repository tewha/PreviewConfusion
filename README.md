# PreviewConfusion

I'm trying to get the preview to consistently match the size of the content, which can be any (reasonable) length.

What do I mean?

We've got a few major areas here:

1. The main view. We can just ignore this. It's there, maining, just like you'd expect.
2. Buttons to hold (not tap) to activate previews.
3. The ContextMenu preview (white background).
4. The hosted PreviewView (light grey background).

Now let's look at how things have gone wrong.

To see all this for yourself, run the project. There are three buttons: hold (don't just tap) on one to show the message preview.

The problem is demonstratable in the iOS Simulator, though I've found hold gestures a little tricky to trigger in the Simulator. It helps to pause a moment after moving the mouse before clicking and holding the button.

### Medium Message

![medium_message](./assets/medium_message.png)

I put this first because this actually looks pretty good. It's probably just luck, but at least it explains what it should look like: there's minimal spacing above and below the photo and text.

### Short Message

![short_message](./assets/short_message.png)

Things have gone so horribly wrong here, and not in the direction I was expecting. The preview area is smaller despite having more content. But then the ContextMenu preview gets swole. Why does this short message get high white bars above and below it?

### Long Message

This isn't right, either, but at least predictably so. The content area within the preview is too small, so the message has been truncated. But at least the ContextMenu preview matches it, I guess.

![long_message](./assets/long_message.png)
