Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953649;
	b=3l27thA6SqVuGsdI42CTEm07fkLMTBBjBQu64AVAKqFlYcMTc42ibtXoToEgwzHj8lTF
	 Sq2zVblh07RqlbCzrDRVX1Z1tX0IMFcPKV4jV0coAmqazwXasqHzFPGtpFawPGd07i/87
	 rpbD9yEWk5eKCVQhYkEIaohL4MjHpliMFWKM/18G4Eu7xoexhUmzomtvK9kcv6lytctrz
	 3aNU+98hb7RCCnR4eMfFosu6znkZcQmRq3EheoUA0SgM8ZyvOyTNFicKLVmBRk1nBCQxX
	 TrDnJpfsXXndVIJRaKYDnKFcNAaJQYyFCkexBIJgyOmj9T5pwDzpPO2CfKpNq742nRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
	b=0V44sqnqJA5hML4shQj4wC52M4JcnSlyKSSPr/WMevh7ePGT+in0eIuvgwYexyARQkVG
	 b1P799FPOwnk8swfbS2y/t3tK9jzLujo4+DvquZHcrbGVtlq9qhjIxZUUfBw5/8FK9EJW
	 Fftegwu9XVwBSHrHSw2lkbJ7l5r80LgtWPvW2o7S8ZPRnuTqm/2Uvx3ELKMek3bblxTh8
	 MEU+RDaOIX29qrJkoOPDb+sCzwVtAj4EPWzCIp869nbpsouLde2QcP0Xw4xZb5oLGZcLN
	 CIlpWK3+EjuvuSRxBiOc03pU9G5MmBLwep/eqnC6hwJd2tsyZDxn4N19mXgJrTr/cvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=okpHtaWb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E21606A32F
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 22:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E21606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=okpHtaWb
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-5058b105df7so105223b6e.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 14:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953648; cv=none;
        d=google.com; s=arc-20260327;
        b=WEPNVUeylC7Bk1AGtt4sV3puLRmw0M8VyDXu+QwLVe2HJ/NmY3KLH1dbXUryjfb0lj
         uE/qaLIA+wkd6FBaKGW0iz2adOVJVHwrT83PRx5yX3CMJPrYkcJjsEqc9Yl7idMq8T3z
         SAl+72U1vX6B7SPjZW+LLsA27JPpzwiwb7yq4EQVjO4zkDfTKHXrnDewCpbnSQ7c8Sod
         SVwe1ycOJ4V7aLdLqYi4zdw4SnT8TnQFVnrPrmkhQFmbCPweFB+jqEAnkwbqW78hp63G
         UD9Ga58XQkjdE4tkzo4IgP95bMinJOSjpccwlJYyG3If3SAY+6eTtIF1XEu47Z5IA8dI
         rhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        fh=nTua2UbRSZWthxUBjoxa7bgGcZH1urAvU5eGzRoVE0I=;
        b=H8Fxr84ePQw4yA+ZIut+TOSOA12+DD3JPgdYzvE+H/o5VGbaalLK9+R+vXxkejR0NA
         IJKSYQuqDjJ+9Az70fOjTPNpa2VbLJmQnW3GC5ysj8ltnWP+c4KM1NtzvXsBZBZMkPTz
         NYpsQOec6Sjvr10fFOX0Z2BDUurdroUAw5mgh+aEtsa1Q24TgIADpCuRz8fsBAE2s6VC
         PKiuM25iknzatcNZ+OLl0y0EqcqAQRRcIJcz1pCgFc+4mloIqvJNZdLQ9HWYKOxWQczh
         bYIc082dPrWXNpZ43ejiAKfqLLj3xhyzTsXgZvaM5RnftsS76Lrk73goPZvBuj6MKyPV
         10eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953648; x=1795558448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        b=okpHtaWbo95YbfwhvhECYGR1BlJWR2T5ivPaGRnf7jml7Fx3yItfL4L0dQs7jM1kxb
         t9P3+1/IAC7ciF087DvZNS6RU0udb0nu+zXMnFqTdExzvjzTHOxIJ32Q1HyYQNhWCHzM
         Ja1UhxMebqrfmnB7TaHv4GNj0tOYlHJoORQAuJ1vY3kmQAalYEF21I8U163iHAEKepRB
         Tal2hH+e7PQdHOsoqJ56RvJ9Cza3vPifEC5r0D6Ft0U77h9LK7nSH3A4f4j/fW0KQ9oY
         AHoCrEzFcArDIKKU2/f1ObNHogPjkqCRIu0SEElcCbAXkIzxP1ubukoVQvZ4C0aW1IIh
         drPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953648; x=1795558448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        b=iHBOH4x4tEOZWJGrTsNCOhvbo9oGPy0wFl1FWEtD7YhNbUNF7ClSnDPwwRps030Rn7
         pTbhA98et0o2fxwd7+K07Cjwh9krWdl0dyOt2QbIlHN26ysWkwzRwpj7DAsxXBT7SXhx
         KMyaJRKKmYJd8aa0JcOKQQj4R7CRJs3B8fAhmOmFXJIgHqk6idQCcyYRS++c1R2ycpqu
         qT2rKxsFHvDBpV1lH9bYDqpC5BEkiu29UGZ9w+MzqGYMWASJmXjbj2sG9S8BO3rwPlI1
         oCnxeaGU5qncWQY4T5f+l2FEwEVyfRdCc9Wqyxt5oiAAE+4zn9jn+M2JqV2oAeOc6M8W
         AD4w==
X-Gm-Message-State: APuU4Z88L5kFq+U3pVgRs4xCXtIcGLXXMleIKPBFV8+WVXcAbzCVYL/S
	9G4ov5gjQvhjyqblpCcTlcW6dSqZ55JDcCVGJqgW/43ZyobruKTHynCx2ywciNFl3QK24IBoDMX
	VnVA2d1oyKFMCBwKiXa0oPfQz4lLD8yP/GX2yyyq/Y6taVM6zlHYnEsrs0waK1g==
X-Gm-Gg: AYBFou2X7fDTaZ6y3mVvb7I+/THi62k54jQLJk7+KGGFCKIuSyxJYTR1jCqE1cFofkN
	cDP+Pojo9l2OUNeiqDhmNmMIXC16TbJRAwOQM9cSk+2uizPgO80hGIvzTAOLW3KvUtkYbsP72w0
	xZv+IgY4uzSDbr8OLV8cxGGHyn+YHmbLg+Z+uXmpiWXVd/r2/uT8KDZEyY+Fc52lN3TKSY7FJJM
	WcBbcUVGRhPvIHzpbjkCWZ/RX6jhe3y/91HXenpdiC7UkUxCw6I2PYJpDDk3z5wS+oUivD7dsRA
	+MJEgIsOFOH38PqDEMTVTpLFivlPLrJiY0H+UacbQL1cDdZOb3r7bM+fmSi2YOMG33g1Xm/w4HH
	Z+g9TM55SpLHfRSQJzQnDKKLagHua6cnagaRSTBpljUelZ5aXomBpkHhH0mT2y7lsols=
X-Received: by 2002:a05:6808:30a9:b0:4b9:a88b:888b with SMTP id
 5614622812f47-5774162054dmr1516905b6e.33.1794953647357; Tue, 17 Nov 2026
 14:14:07 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-2-mrungta@google.com>
 <sashiko-outbox-210280@kernel.org>
In-Reply-To: <sashiko-outbox-210280@kernel.org>
From: Mayank Rungta <mrungta@google.com>
Date: Tue, 17 Nov 2026 14:13:55 -0800
X-Gm-Features: AclHuK-gfyGRgfHP6b95c4djqnr6JWB02JWcunq_dlapBgDtO9GdRA_nY1E9eCw
Message-ID: <CABz7rdC2Q1qtUdhiXDpEydbhCnSaNSuS5jzcUK+cZFdNZmULgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] genirq: Synchronize in-flight handlers during NMI teardown
To: sashiko-reviews@lists.linux.dev, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko has found one potential issue:

> [Severity: Medium]
> Can __synchronize_nmi() return while handle_fasteoi_nmi() is still runnin=
g
> on another CPU because it checks desc->nmi_active before querying
> IRQCHIP_STATE_ACTIVE?
>
> Unlike regular IRQ flow handlers, which acquire desc->lock before setting
> IRQD_IRQ_INPROGRESS and calling chip->irq_eoi(), handle_fasteoi_nmi() run=
s
> without desc->lock.  On the NMI CPU, hardware acknowledge sets
> IRQCHIP_STATE_ACTIVE first, then handle_fasteoi_nmi() increments
> desc->nmi_active, then chip->irq_eoi() clears IRQCHIP_STATE_ACTIVE, and
> finally desc->nmi_active is decremented:
>
> CPU0 (NMI)                        CPU1
> <NMI acknowledged in hw>
>   (IRQCHIP_STATE_ACTIVE =3D true)
>                                   __synchronize_nmi()
>                                     inprogress =3D
>                                       atomic_read_acquire(&desc->nmi_acti=
ve);
>                                       -> 0
>   handle_fasteoi_nmi()
>     atomic_inc(&desc->nmi_active)
>     action->handler(...)
>     chip->irq_eoi()
>       (IRQCHIP_STATE_ACTIVE =3D false)
>                                     __irq_get_irqchip_state(...,
>                                       IRQCHIP_STATE_ACTIVE, &inprogress);
>                                       -> false
>                                   /* __synchronize_nmi() returns */
>                                   __cleanup_nmi()
>                                     irq_nmi_teardown()
>     atomic_dec(&desc->nmi_active)  <-- NMI handler still in flight
>
> Querying IRQCHIP_STATE_ACTIVE before reading desc->nmi_active (or
> re-checking desc->nmi_active after observing IRQCHIP_STATE_ACTIVE is
> false) would prevent missing the handover between hardware-active and
> software-active states.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112031629.39=
6819-1-mrungta@google.com?part=3D1

The observation is valid in theory, though practically benign for
disable_nmi() and free_nmi():

In that window, IRQD_IRQ_DISABLED is already set by __irq_disable() or
irq_shutdown() before __synchronize_nmi() is called. If
__synchronize_nmi() reads desc->nmi_active =3D=3D 0 after
smp_mb__after_spinlock(), then the NMI CPU's
atomic_inc(&desc->nmi_active) occurred after IRQD_IRQ_DISABLED was
set, so handle_fasteoi_nmi() is guaranteed to observe
irqd_irq_disabled() =3D=3D true and skip action->handler().

By the time __synchronize_nmi() reads IRQCHIP_STATE_ACTIVE as false,
chip->irq_eoi() has also completed, leaving only
atomic_dec(&desc->nmi_active) in handle_fasteoi_nmi(). The IRQ mapping
is not torn down in disable_nmi() or free_nmi(), and even if it were
torn down immediately after free_nmi(), free_desc() frees struct
irq_desc via call_rcu(&desc->rcu, delayed_free_desc), which cannot
complete until the NMI CPU exits NMI context (nmi_enter() /
ct_nmi_enter()), so no use-after-free can occur.

Human review feedback on v4 as-is would still be very much
appreciated. I plan to hold off on spinning a v5 just for this and
will swap the check order in __synchronize_nmi() alongside any
maintainer feedback.
