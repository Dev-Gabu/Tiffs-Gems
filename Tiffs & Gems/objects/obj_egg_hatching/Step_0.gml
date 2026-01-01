if (hatch_timer > 0) {
    hatch_timer--;
    
    if (hatch_timer < 3 * 60) {
        shaking = random_range(-2, 2);
    }

    if (hatch_timer <= 0) {
        hatch_creature(rarity)
    }
}