Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565286;
	b=ohHMmgXSd86IzygbmhlGbJ0dUL0MbiOrEa6ZG+7lkJ/cBFTpFb43NbRnC2gZeQbVM2FH
	 /0Q5S0QBeluSvCqOzoDVrpA9yPNdwcSE37N31kzCfzpFaOC0cXDVPsOaImEDOGrGyAE8g
	 WOqklsweP3KdswUdPtRYyQ7laf8DJOg0yB/zTthv/y22st/lSyFcag0WxvHZfowi+2zcx
	 RzNjrmfMJmw3aJRJvaYV1YphAQCylS7zuoSdkuRy9biAye6mJZzGPtqXfZxAF8DmkRuix
	 44OBurIF9m9IlQSmTx7z7ycI3FDBKVHwKs5p8k3zOhkHqPEfAHLi43tgU1IvSs61MWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
	b=HRrlTgBnWghiHgBFej/O4SHDpfVxRIegSW6enDUC+g8di5TGYgnl6PQSd13B17YB2lMs
	 zlyZcSLr/XU5AU5L5mFw9b4okMy+2Ye+dMDOJt+XAIDXVjISfY9mJihA2qFf7gXoePh1Y
	 hlP9J+H3sZ/uj66r5e+JgRUl7+/MxHW9mVoaTK2WPN2ViF7CInE7qR8zcnv6Zi6Mt30Yl
	 cax3/0V+6o0YFzlicmZ8D1hrlUsXK8boHghlCntT/VGn5gV9nisc2TVJ61r94OpKf4Dy/
	 SjEVnrRaV6h5lOwk1tceur/zoyLjq8EJIlih8fPYmUu3ZFT7nXGwBSoZF6CRYQpgbRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HNo2RivP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7989606A31D
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7989606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HNo2RivP
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-918f75a68f0so6094426d6.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565283; cv=none;
        d=google.com; s=arc-20260327;
        b=HToV3N30zKhLJzxGlsN3jawtp+FxeB8IEiqabEQvVFID8tggR+PRiYW8njEBZwyIqV
         gxiBVxGcvbb4tiY9TwA/UZVPo0BWXlneCgmhUVNb/jmKVX7t0IMRKM0G/NWJzD2PasED
         xu8JGYAAToz3sgE4YKU1RrXJcDMC0dIvjdN5d4YfBJVfnVz+VKZsjH2w27IekL6yy3kH
         QK2SbNuIV/a3hiTm8pQN1SXY+Gm2dDwKnKXtHs4tDt/r0czUNi7TaJw88/LZO4ndA/gJ
         4rjePmr8j0nFe1575AGryCNiih/k+lkkeLw9Xw2IlwNHLztuuLl6BdldYXg7Rzmpy+gR
         IcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
        fh=SKlRGCwKdtdyEF8Kb5l+vwcMyvzCcNyahRdpojZj6w8=;
        b=p4r7uhBvmiLyAPGjOgixuXiv9S4ZHKmAg4QMO2ht2BDOKYG2ypJ/8zoogVnycNfYk3
         ZSGlmPfW0p43Ziv1oet+KBJN7IBlo/nmAOBdXnBOHvLtN3UliVNti4Xk99JhEA6OEa2G
         Eh/ZdZswkbMljvemup7baTbGoAeUHgCbdhgBAgMoOhKA+zJ7GLspl2p1PT0604Oh62ij
         XQkuP7BtdomIt33rnG+t82V+wOoKzhoSNA/RS2QTnlAuWARyjgqEyPkUdxSEewMs69QB
         i1ZYviJf6iDzB5qAWuaFUysb9B8MEVhHDW5MwzYVmjE0NsuN/p3nRbKxlJYlhCIJxbVZ
         fLhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565283; x=1793170083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
        b=HNo2RivPfb396LKBH7eoCQnJaBUc7AlubXHc1pSlPYQbm0Hoj6nWyauoJxHhgWkWlm
         yrlAW/gWbfFzp9oNxCJ+QfgplScIir7AbpnjFW731PW9qV2O3t1Vt6QYuvSWQUnhttA7
         RGgXJongAX1tG3fiyKxX4BwrCd83aLzApCHG7+/KkIouW3+LI4W4mAd4OepmzcoetIHy
         qfkwDR/5vUnbcd+yf/KkzmV/fGQk18lNTnV7M62FuHkK8u4rs8mZ4RDBIbm1CgMqJH2W
         K3H6l8Th2vGogWAU7gYMPnvuDiwcQBbciZtru9aUfEtxGhIDr6EcWVl8X14sjS60zn28
         7iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565283; x=1793170083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZebDNhl0jDkzl6q0bMQgUQBeTiOfmvSac92uQHwiH20=;
        b=M76ILBE8OZYuINlY5llThJp6JNshcSbw0B1gwwrCZssF6bHKXEhvV6EV/9yvYEfo+l
         T+BxnY9CqHK33r9rYyp+36d7wHH3b4EyE/VPitodAYZyc3Lm0JupSTU/HfHiLrtJhG+W
         FNPfDtVSMMeQpSU6DfmunhfKWzVvWKNrjSAhyp6Ib+QCeAFPia9myq5dbdJexL0xJwNw
         64yudjr8Qsr8iDBP6gx8b6hdL9ae1HTjAS/rKG8WgqBiNtF99hJ4gMxvaFkySFrOm6Il
         DS5o1vCLdXBjBADrcgDtp4O1zvPWVj4TmBa5J8tFlORMEClldrrXwehhY9KWOiupHMXZ
         NMXw==
X-Gm-Message-State: AFq9FYJ5dSLlLbJ7aleHW4b9Kp8/X5luy6QcZIMkI/gEOlbUAwaXRkxi
	+jE8jQmFHq0XNTIfzZNu36CGfcOlOdEqbPIMNGdlT9+6q9yBHcmHk4OGV400YgD3IR4dFJf3DMM
	GfIs9lgAO9EdZoYrsLA/PXQJN7tmkNOlbcZDA
X-Gm-Gg: AYBFou3iZbhUiN+MZo5QGaRyli4maa0gzFEcoaKbDTlViZXagq2xbsgvPmBMpSTv7yq
	7815Fhyv7CZjd4mDrZqV+oxcXd/FyYsIvu2VZM+VLQGDvPJ/ghSobj2TzrcRDTaRs0mUCGiYP08
	OzNOpIg8g5koAk1j4atxWRhNgmeo2Sgu7Pm4pTgWN32dtoblGW7gRzRCRX/k2qseFBQs/ce1oJQ
	XlpLfzhcXoZiagrTGtsFT7Ir/VL2JbPCwg948U3O+FvrmyX6qQTLSgrYOgOKCf6j5KhskYZ39SP
	HTceLfYHpGa36VYOIdXket4ujI4ZEQIT35ZiosVqahCR1IciHpcuQCl6VbgsFA0f1H0PU1u+mGE
	Z2BrdeQkxqLShAi0uvMULqIKYTTMYQeD2c0y9hA==
X-Received: by 2002:a05:6214:5001:b0:919:85a3:313e with SMTP id
 6a1803df08f44-91c12ec6c58mr19603226d6.17.1792565282908; Tue, 20 Oct 2026
 23:48:02 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-7-a0282524688@gmail.com> <sashiko-outbox-169120@kernel.org>
In-Reply-To: <sashiko-outbox-169120@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:47:51 +0800
X-Gm-Features: AclHuK8leOvF9ONCDArFqCNXOunnjuvslXDH4iF86BFZ8ghLkyV1E7Y56MP_8_0
Message-ID: <CAOoeyxVJs+3Wpm3m2YDXPO5JaobW=9HRmiO6-ob55E_m5vf3TA@mail.gmail.com>
Subject: Re: [PATCH v9 06/12] mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] irq: lockdep wait-context violation on RT due to spinlock_t in=
 irq_enable
> --
> [ ... ]
>
> >  static void nct6694_irq_enable(struct irq_data *data)
> >  {
> > -     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> >       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> >
> > -     guard(spinlock_irqsave)(&nct6694->irq_lock);
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: Medium]
> The kernel IRQ core holds the IRQ descriptor lock (desc->lock, which is a
> raw_spinlock_t) when invoking the .irq_enable callback.
>
> Since irq_lock is a spinlock_t, it maps to a preemptible, sleeping rt_mut=
ex on
> PREEMPT_RT systems. Acquiring a sleepable lock while holding a raw spinlo=
ck
> violates lock wait-context nesting rules and will trigger a lockdep BUG a=
nd
> priority inversion on RT kernels.
>
> Should irq_lock be converted to a raw_spinlock_t?
>
> >
> > -     nct6694->irq_enable |=3D BIT(hwirq);
> > +     ddata->irq_enable |=3D BIT(hwirq);
> >  }
> >
> >  static void nct6694_irq_disable(struct irq_data *data)
> >  {
> > -     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +     struct nct6694 *ddata =3D irq_data_get_irq_chip_data(data);
> >       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> >
> > -     guard(spinlock_irqsave)(&nct6694->irq_lock);
> > +     guard(spinlock_irqsave)(&ddata->irq_lock);
>
> [Severity: Medium]
> Similarly, the .irq_disable callback is also called with the IRQ descript=
or
> lock held. Does this also require a raw_spinlock_t to avoid the wait-cont=
ext
> violation on PREEMPT_RT?
>
> >

Thanks, the report is valid. The issue dates back to commit
51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694"); this patch
only renames the variable.

irq_lock only protects the irq_enable bitmask, and nothing reads that
mask, so the .irq_enable/.irq_disable callbacks do not mask anything
in practice. The IRQ core already keeps a disabled interrupt from
reaching its handler: handle_simple_irq() marks it pending instead.

Rather than converting the lock to a raw spinlock, v10 will add a
separate fix ahead of this patch that removes both callbacks, along
with irq_enable and irq_lock. This patch will then be rebased on top
of it.
