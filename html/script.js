window.addEventListener('message', (e) => {
    if (e.data.action === 'openMenu') {
        document.getElementById('menu').classList.remove('hidden');
    }
});

function closeMenu() {
    document.getElementById('menu').classList.add('hidden');
    fetch(`https://${GetParentResourceName()}/closeMenu`, { method: 'POST' });
}

function setPreset(preset) {
    const presets = {
        premium: '#00f7ff',
        clean: '#ffffff',
        flat: '#888888'
    };

    document.documentElement.style.setProperty('--accent', presets[preset]);
    localStorage.setItem('hud_preset', preset);
}
