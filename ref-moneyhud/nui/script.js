window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'updateHud') {
        if (typeof data.cash !== 'undefined') {
            document.getElementById('cash').textContent = `$${data.cash.toLocaleString()}`;
        }
        if (typeof data.id !== 'undefined' && typeof data.players !== 'undefined') {
            document.getElementById('player-id').textContent = `ID: ${data.id}`;
            document.getElementById('player-count').textContent = `Players: ${data.players}`;
        }
    }
});
