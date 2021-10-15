# crud

Test CRUD to find `was disposed before a value was emitted.` error root.

## Reproduce.

1. Update `firebaseConfig` in `index.html`
2. Start emulator.
3. Start web app.
4. Insert on record.

The record is added in firestore but throws and error:
> Failed to update event: Bad state: The provider AutoDisposeFutureProvider<String>#249dd(Todo(id: null, description:
> sdsdsd)) was disposed before a value was emitted.

