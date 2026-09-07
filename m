Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BFE388880
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788746811; cv=pass; b=ltDhRpnu09cIr6Dhd8CIr1Wd/8x3Xo7+T7rG2RiAlTk3RzJcznOnqoRSOoFxpIrwpq25VMP81PcyquudV3eqh+W+xJga85G8XedouneuM3kWlcas5wR1KSdxK8HBo7DxU3/LUcMKof5jLJmqGjFdmp+8X0nDGzh1sA6pkIMCdMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788746811; c=relaxed/simple;
	bh=5r7mWrOx4Rbi/x6Q7SuaXOQGNdkKqVoQN3vx0AL5MJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ashB96q56mKsL1QOqsvGWvLQ/iSZUsSoLlgbdWZESZyIBTsCTEwiUbVj0J4tb0vyJJAysGqr4pxFXoVrcSymrWewnkTgoz8aYvcF+cBzA/PLlWn3TcBG4aeE2AP7mLlT2HNt1S+OVs+QhXna7mdMS4DE3gyH+KVBVmEYGtH7Q4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pRb08/J9; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pRb08/J9"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso2914309a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 06 Sep 2026 19:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788746807; cv=none;
        d=google.com; s=arc-20260327;
        b=DZAlrqlb4tX9tW/SWO8Gq2Qh/FOQgC4dOE3YOUrCNe4aWmrNi63nCvsY9mKbksIuSe
         DyF/bnTizQz0DrcFNb87CUCBFAWfvHxAz8RhzAlszSwZnyAO3Q03qrTicrc/Klwj6Cx7
         7m0WgSuiex8wY6uo2ZIITs6+hbhuXdW4x1LjNWSiDptKFnTptQDvQyDB95rJDLt6KPt/
         L2JbCgYgmeWe18HwVtOeFyactZXvX4+5EZB5g9mVwscVl3GZV3nDhOlwa3Y4q6vNfr0O
         C5FJVQ9XEA1HKNhHBBSd6Wp2RGO2clJBxyznCkM+RElv4JnKIPvRCBCj38vH8Rgx32nC
         KLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5r7mWrOx4Rbi/x6Q7SuaXOQGNdkKqVoQN3vx0AL5MJE=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=oY3a7gNn2EQsQqVGopr57P/7Sb7b0iftoigFregTpdyaThAYvv+flWdrSawOtx+f3p
         Jj3dbXGsG2GKG7qlqfhiCID45dpGgEoICv8dTaNH0JyKz2v1qQntCakHsRy95mpp60pB
         FTRmJrWeOczIRfjFfc5yNQjU8NgCyyLJA2/arjUIpTP76vphKim6ei8ni7a9OZttdhXG
         sfhy58OD35Z1cBrf1259bc49fraGmsNslw1+0kMno9lDm4vTeC+oz1amAQ7f0BXJY/oY
         3pSnbGkLHHxoRiBNUUNjH4JheKDKURGOQ1KNjGmcw8JBBewedKTzmuoMIC5SCvt+H8s/
         199g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788746807; x=1789351607; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5r7mWrOx4Rbi/x6Q7SuaXOQGNdkKqVoQN3vx0AL5MJE=;
        b=pRb08/J9wifAgfY5CfRHug94IZ5lwhyP6UG3S7SCHhL8RMwZH9/waOUx28q1jiyEf6
         mwzdMJ8QT6pvar8PlTsGd8WYgwSPkj1dEmdsaUzAYA4y2ht9IgahnB/ZzkMJXsqglzxQ
         kk7rLNN2GJv/GQaVk4qSA8q818PO8f9td33o3Xy/miLasohE/tdLdJRQ1y3NuDD67325
         N7Yo0kC8a5Yh4S1KTjbinnCYIoTJwLNsAxbMZZNPs+vRRx+NbbV3nXXI7aPIZDQCuJLH
         0s6MqHasgrR/uBYg2aeNs6ey4v5Iag8D6tjARDxP/oGTx5HZL0zDzw1SUepdfYwT1vgC
         PHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788746807; x=1789351607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5r7mWrOx4Rbi/x6Q7SuaXOQGNdkKqVoQN3vx0AL5MJE=;
        b=Luvz6CklXGN3YRrlak6Td4heK3+54neLgrAI5z/8zEtQx2O0af8d756iWBk281rwOT
         U3sOlSjOjqgWmBVRp/Grg4OdsRezqMm+59u27+rMtyzCQX+fAAcaVNO0ryLcN61Cy72X
         47oROrxYrf6UjI9TEakaczbP/M5EFbcFHow7Hq8isIZRAj9LzDRVedSwWMwX/564wuXl
         5bmlGrMLbOqkPLMRnsNO3TrPtpvpVs+lXnvCE/Y+e+EuaUNIFWbU/JKYuUEyzqIlHo0v
         4GGvfECBauBxCoNXjoxIb22QF9tUJto28jrMwq9btxcYM0PcjV7U80cHThnlkvpT9w72
         xLEQ==
X-Gm-Message-State: AFuF++k8rhR2uF3QxqXW/ZYQJJXr0az8KdSC1lmnYqgQwh/DkcFT0kH6
	7KiIZR4mu9aHr01FuSbNeaiKFd1GY7liTGskZwE7bbfJrAq+sYzvjlKXpt1QHcz9kBO/5dgF9v3
	EYvZ/mjwyWx/J2DIXDwlXmvpqzOe62am8W05Q
X-Gm-Gg: AYBFou0ReD7rGBK5PAf/QPVffAGyMSjmgrUWKdT/YRVmzJ7kH0rxWTCovBt6NJDFaV9
	rkjH318vqKQj5Ce+s9Mn56jiM5UYAz/9KZRfsj0LRsi6oxs+kyVRXmTQ55UF2v+xd4J1e/3UxbD
	ncAX6AUjPrXIbHWpcWN1eEc0ntNvqsubcWwCqnWu+Db7NqaY7ww2mot/mASWRjahKSVkLca0Qtr
	ZwnwbAxSYQ5baKDcAaAsxmZRevfrJgHICFqXNwrLfHOgqEPiu7ON9UHGmAOy9B3QAo/8FFXLRQS
	wTwCcGqpohjSrWioUGA/Yn2IGuMFsnMKcZgAcLk8rliQiwi6ev/hV6735yiS9aCMhqIJOi+TPwq
	c5uSrH2ZL9U8oUAcANeR0JzD31HPlo+Kkl4XT1onW71qXlDR3btwobj6EVquOsky/em0=
X-Received: by 2002:a05:6a20:9d93:b0:3d3:ae40:51e8 with SMTP id
 adf61e73a8af0-3da3a104d63mr28631150637.28.1788746807086; Sun, 06 Sep 2026
 19:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904105542.70540-1-phucduc.bui@gmail.com> <20260905105608.AAB061F00A3D@smtp.kernel.org>
In-Reply-To: <20260905105608.AAB061F00A3D@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 09:06:35 +0700
X-Gm-Features: AcwNN1WsqNz1-eSotOZi3GvJ-yT1AxUdFKExrKK91NuTvvsynginP_12Ih8wgQs
Message-ID: <CAABR9nF8iGKcNvZ4zp-9QjCQDDMOBZNRdm0WcbJzPmc8aJ-S_g@mail.gmail.com>
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 5:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Direct return from `fec_probe()` upon IRQ lookup failure bypasse=
s error handling cleanup, leading to resource leaks and a kernel panic.

Yes, this was my mistake.

It should be:
+ ret =3D irq;
+ goto failed_irq;

instead of :
+ return irq;.

I will fix this in the next version.


> - [High] Freeing `ndev` while the PPS `devm_request_irq` is still active =
causes a Use-After-Free if the interrupt fires.
> --

This is a pre-existing issue:
https://lore.kernel.org/all/CAABR9nEkci1OFoHx2qmJWvKabUN=3DJSu5AcPynQ-tH02w=
xHEmOA@mail.gmail.com/

Previously, I suggested using request_irq() and free_irq() manually,
but that would add more code.
Another option is to replace alloc_etherdev_mqs() with
devm_alloc_etherdev_mqs(). With the LIFO cleanup order,
devm_request_irq() will be cleaned up before free_netdev(res->ndev),
which should resolve the issue.

Since this is a long-standing, pre-existing issue, I think it would be
better to handle it in a separate patch.
