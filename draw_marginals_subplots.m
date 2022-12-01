figure
subplot(2,3,1)
plot(p,margP_array_w2(:,1), '-k')
hold on
area(p(1:512), margP_array_w2(1:512, 1))
hold on
area(p(513:1024), margP_array_w2(513:1024, 1))
title('$\omega^2 = 50$')
subplot(2,3,2)
plot(p,margP_array_w2(:,2), '-k')
hold on
area(p(1:512), margP_array_w2(1:512, 2))
hold on
area(p(513:1024), margP_array_w2(513:1024, 2))
title('$\omega^2 = 92$')
subplot(2,3,3)
plot(p,margP_array_w2(:,3), '-k')
hold on
area(p(1:512), margP_array_w2(1:512, 3))
hold on
area(p(513:1024), margP_array_w2(513:1024, 3))
title('$\omega^2 = 148$')
subplot(2,3,4)
plot(p,margP_array_w2(:,4), '-k')
hold on
area(p(1:512), margP_array_w2(1:512, 4))
hold on
area(p(513:1024), margP_array_w2(513:1024, 4))
title('$\omega^2 = 216$')
subplot(2,3,5)
plot(p,margP_array_w2(:,5), '-k')
hold on
area(p(1:512), margP_array_w2(1:512, 5))
hold on
area(p(513:1024), margP_array_w2(513:1024, 5))
title('$\omega^2 = 298$')
subplot(2,3,6)
plot(p,margP_array_w2(:,6), '-k')
hold on
area(p(1:512), margP_array_w2(1:512, 6))
hold on
area(p(513:1024), margP_array_w2(513:1024, 6))
title('$\omega^2 = 392$')
sgt = sgtitle('Marginal distribution $P(p)$ for gaussian barrier with $U_0 = 0.008$ at $T = 7000$ a.u..');
sgt.FontSize = 20;