Splitting();
const typed = new Typed(".typing .txt", {
    strings: [
        "No.1 취미모임 웹페이지<strong> ToGather!</strong>",
        "ToGather 크루와 <strong>함께</strong>",
        "취미생활을 하며 <strong>워라벨</strong>을 찾고",
        "소소하지만<strong>확실한 행복</strong>을 경험해보세요.",
        "커뮤니티가 많아질수록 세상은 더 <strong>행복해진다!</strong>",
        "<strong>ToGather</strong>는 지역별 관심사별",
        "<strong>오프라인 모임</strong>을 할 수있는",
        "웹페이지 커뮤니티 <strong>플랫폼 서비스</strong>입니다.",
    ],
    typeSpeed: 20,
    startDelay: 1000,
    backSpeed: 10,
    backDelay: 1000,
    loop: true,
});

gsap.defaults({
    duration: 1,
    ease: "back",
});
ScrollTrigger.defaults({
    //markers: true,
});
