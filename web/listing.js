// Step 1: Ensure GSAP is included in your HTML file

// Step 2: Select all the items from the DOM
const things = document.querySelectorAll('.item');

// Step 3: Create a timeline and add animations to it
const timeline = gsap.timeline();

// Add animations for each item to the timeline
things.forEach(item => {
  timeline.to(item, {
    duration: 1,
    scale: 1,
    opacity: 1,
    ease: 'bounce'
  });
});

