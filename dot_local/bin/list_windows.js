const clients = workspace.stackingOrder;
for (var i = 0; i < clients.length; i++) {
  print(clients[i].caption, "::", clients[i].internalId);
}
