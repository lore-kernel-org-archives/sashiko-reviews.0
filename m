Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794720991;
	b=3G50E1N7EYxbnA/319j1tZ4v2kC3QE235dcCF7qCsthjCZuAvtIvDdTJy9ytp4xJhb+9
	 iiur1tNzys7J33DohFNjYIwxk435is5vAus4rY6iO9/fXB9ybqeogSjSGdtED6bW+hsXy
	 2DLLZUiMKob4nB/ZZNkAPpd7OjJ5EwHRBlKrwibBRCG6IZB1G48uD4kL1GFqALnpkKpYu
	 Nw7VWfDZ3MalFU4Bzkp4VdR2/xSOGKP95zDXgD43fM+w0leGsT8nve/DJonqvQ9VxAEqq
	 G0saFe9Mg1aZoKE6fF/Qh3YE1/jb1SU3nl5yOMPujNpTcj/RMi/m39/VlGX5rWDpXIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794720991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j6VoeGe/wk8xgZpQhEIYsSv2epjnw3INGgRJlWQrTDE=;
	b=OV3UlGzW0KFfV2EDHKr8BXql1/vBLQNCwCpxHHlB9b6YKF04mLy497yYvNALoxA29jDc
	 q5Hx7LmnqldFDg2m0TgVXUm1/bQkeVSsFbWM+qYM6JPDNI4PNxSEMFU2W1Aa5ruvZ4WYP
	 ReDubYbRFRbqlfc/dWSdpzqxyhNJd7BSTlJJ4PG1MKMyCa8cPFJchPouLKkKnmk1cghkF
	 vNoogI0GofXqv3ILfsKZmcFkUAOB1BoreoLlSkZ0Xpalo94ic0uC+pKaUqOCEVcjoAK8J
	 OCIOZAPbn3DCJPe1NzpFDWBQv7vZEF0ICV/2czjv5L181s1xXqiluW3m57ZJ1+X1m4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKzGw7Xn;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E703E606A327
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 05:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E703E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IKzGw7Xn
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37071c0f42aso3489157eec.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 21:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794720990; x=1795325790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6VoeGe/wk8xgZpQhEIYsSv2epjnw3INGgRJlWQrTDE=;
        b=IKzGw7Xn0tKGmQoxuKcsqv9GnIRzuO+gh9+r3cDL+U9aJTf8U+dLDT5o6iCvmcqr1C
         ByjLPokUVXoq9MpPPkBd24kIJopsLCyMhWeSbnOa+S7L0e67bIqFPUIbxbVftEa47Dsh
         1NuLxvdhxyr+95DvFpro4UiDzz3dDDlox7w2SeEEhlTcjE7fWwmH2/5ZSg/Y4io9dyyI
         fP8lY/C1XSNmajNQbiHL+e3biVL8sIBd4iNeCmz2AFCKC+FzEtvFrJGCq16rChdQCrjF
         NWPcrsj9J1mKvdqzT2FyJMxO0MfWSWyVyJDa/EjGKb7Zt8J5dic9/ZkAXfVyAuThgM3V
         WIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794720990; x=1795325790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6VoeGe/wk8xgZpQhEIYsSv2epjnw3INGgRJlWQrTDE=;
        b=OAAq2RzwYtQjq6mvH3lopAqBMJMQQ66iyXtIcKMln8G5ACp8liUDQX2dWUkb/xFOF1
         N1Ax6amu4I+Wmnr1unT/EEMUd8J9iatvWe6Sez8ZrmFAFMynnVLUe8+opBeziucFhDjV
         gvcCLjGcHNBR92F+VApOKXB/fTKPczORXXiWvewjlqxhiLqIwvJt2go/MoNdLHE07FgA
         FsPBWmjV8ZpdppiskYELjPFCNjmBNY/6KVxaWrAbfw2wScmVEPaCjRp2RGeONyfNUlj6
         BI3ppElHrpyN6lQ191hk9JsAJDgJRybWTFFcs/yomQm9/Gzp3sLgwhaSh7ldOuFalrw5
         bmOQ==
X-Forwarded-Encrypted: i=1; AL+hErEy7pv4/X+782+wH0/w1MCB5q5SNqZfOgGnLnm+ombcxBNdL6WuylTkQEqPEMInVwH/ZgdNHEKtc7UVDvvOf+8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/CtLxfurykWi2ahbCZNvBIfKU4X2lau9lLE7HaM9LEt//Rf3UD
	p4doAx+bndjv6hllFamQso0tj2zXce4uBSkbjDRu4aucuEMIE6IAC+bU
X-Gm-Gg: AYBFou2gPWZKTj+h599oBBkaIZFo+DAKDwAznVNn3Xfy8dPYmQncpKtBi/n5czXC8Zz
	HDVGYg2mGmB8FT62fPiNWi3SMHIh10pohccWpMS7X94IXe75zqB1xF7z4UX1gYCYl7Xs9bQgP9O
	7EMyi8iTzuUbirzCyD0bi8K2JpvYxDz4JiUIOotgvRywhDc+bSnQzVMFuEzthD859YbvTHnCrH6
	0hjUXTmusGrzJsipax6ISoPKmIAYbw5OBq3ZWSPZ0onNGZzzlNOdU6bPA7niD+OKXWGrAJ26VVo
	5LKlwsMXn+ZXx6rI0xyS7Un685stR6F+JxLDdxaMMRTySmjJp3GgTA4ziFJiQAbrl4v6uJPmglP
	vTbJnyP4ppPeMv+RrpHwIeJcbGimucnM5Gx6amPop6NhW/aHLJiaKs4qKtJQbJzeIUL/psmuZf+
	zQaEmjac02BHH/LMSbFeDH41IXONnBwxusjmUCCcb/pKxBrTSU/vHXX4JeuVfPM/tlmOBQhmobg
	pFRewvZFfCH+BxXBoFQssXPPZRZu9l1+3NFP7TJ5EA9AUZCqHztah//Ou1cUUBWA6QuLOtRP17D
	cEOkqcujbfixdNa1Pw4q9IdeEV0ub7lrBCOJXQYUPHlXXgeUjWqqupYXYGce
X-Received: by 2002:a05:693c:8813:20b0:376:77e6:a66 with SMTP id 5a478bee46e88-37967315a29mr6673278eec.16.1794720989851;
        Sat, 14 Nov 2026 21:36:29 -0800 (PST)
Received: from arch.localdomain ([152.175.35.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm34739887eec.8.2026.11.14.21.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 21:36:29 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: sashiko-bot@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	jerrysteve1101@gmail.com,
	sashiko-reviews@lists.linux.dev,
	damon.ding@rock-chips.com
Subject: Re: [PATCH v4] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Sun, 15 Nov 2026 13:36:25 +0800
Message-ID: <20261115053625.404795-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-215231@kernel.org>
References: <sashiko-outbox-215231@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/bridge: analogix_dp: inaccurate RK3288 PHY comment in
>   analogix_dp_probe()

> [Severity: Low]
> Are this comment and the commit message accurate about RK3288?
>
> In arch/arm/boot/dts/rockchip/rk3288.dtsi and
> Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml,
> the RK3288 eDP node defines phys = <&edp_phy> and phy-names = "dp" for its
> rockchip,rk3288-dp-phy device, which drivers/phy/rockchip/phy-rockchip-dp.c
> programs via GRF_SOC_CON12 when phy_power_on() and phy_power_off() are
> called on dp->phy.

This is indeed inaccurate. Good catch. I will remove it in v5.

Do you have any opinions on this issue, Damon?

> RK3399 and RK3568 are the variants that omit the phys property and configure
> the built-in PHY directly through the controller MMIO registers rather than
> through a separate PHY device or GRF.

Yes, you're right. RK3399 doesn't configure PHY through GRF; MMIO registers
are the correct way. (RK3568 eDP is not supported in mainline yet.)

I'll send a v5 with the comment removed and the commit message reworded.

Thanks,
Jun
