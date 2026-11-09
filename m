Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246591;
	b=JLNuMHDxP/jPcJTQHyMXIcWWSResaEgAmuIVojy5oCMgVTiieZwAgunzcj700NxTaBtr
	 a23thx47IGx2unLtHPUkgZCVkmyT/xCfTbYc7GjInyyVzLLvbm2HPG5XF8Av8kqnIvD36
	 lNvyQW/A5b9CqmViUB+iglHTLlHswh5teRMK2fsLd83xZ+sbgrS4drAPjOkEc50kWIqd2
	 1MadGYybcBOfhE3s4YFTfEDZty/B3YnNt46YylCxT471k3lcasa/61VeL9pJY9ZXSjpRW
	 x7Sw7lmLfimeoNeM9uAZpc24c02+t0cHpFdUEfYBIsRLWBpTY3Yp6g+sYaWtsI95ajw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
	b=n0QuzAMiqIgW95+8w4hZ7WaoJs8LYX9rAbw4LXKxUouqa1151JVkDlBGCNGYt3fOWIiy
	 sO5V9rNNaH8Y/6M6iUGTSgFIdDvTY2wo9FqcEfc0A99HKJ8VyrFlOpPf0Ya3YNMyYYSmD
	 9S66tU3MiF2g3dZ7xTs/J/ZG3Wv73Lul251lAfJQxAAJwIpjf5w5y28axQjfYlqA/IwvC
	 gzKclUTu1HUTr1gQPo5CD7uGUS6Iw6oMmMnqoyGtZR/cGVC9uxCSWa2R12D//LhvoZpNR
	 UJS5qH8tX2sbIbgmUDioisVKCPiUpp8TVcGJTqZ/q3SSvjes4HAnUglYovH1hsaU8zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NwinIgu/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4C606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 17:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E4C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwinIgu/
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91eed03da8bso4858386d6.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 09:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794246590; cv=none;
        d=google.com; s=arc-20260327;
        b=VraL/jS/lJWSeF6xTkTAEIGDIBZUmrfGKY4o+GkirBSLpLossMlqO3un/snPC3N6NA
         ZIGvARQnqhQbB6ygHt2YaiyzwEhj7AkEyqLacCt+aEo0x18qklJRRt22HhkHnHcFfYtT
         kuNTLhgnudQ3JTdK9oXMyjc0qrzNMUhvdsdKOEj0Zgrdur9Xt+zqBmNUl0pBoq26D/8T
         i8PH4Dmc4iOCYBwuAi1B4XXkoYzPybi86uVau+MSK5KHhZdFoo+T6OMInG4aaofQkCQV
         +E/AfIt2CwzxDlkSpaoW/nabjt+fKQlEeYE6cKjrigMNLgNibZfJkKH3Ntla5EeFr4At
         OL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=HOnf/R6xud+eZ7pysEZVDsEpfO9YL4MUqSP6NhNGFty2oBXsfob3a5lkoF7kaWZfIe
         elRUm6DQZCUeOjIEW0DLdH9zNgrqPsjZPiqjtYTN6QJBL/HdAjRdiujDwBAsYO1vgXVD
         t+pzBPSh5y1RKbXnaarwCGCMyRXoWo2VpM8mte0WxXDWNkpx6ozf5clmAFs18LZskhan
         LiREj99YhNLnd1xmqXBK0mIx1FuyKc8XEERdGrXwCti0cO7gnwYk/1MkaRWJbO7sgC3B
         baFMF7q7pB03q8W07R7ZdrGhq5dZCIQTbtW2kwT3OjM7CXige2N9neeDWLoCKDrIzO82
         sobg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246590; x=1794851390; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
        b=NwinIgu/AurzOtoE7y38906273zicVYnSWAjSCcvWqpUAvWv32CPi+59mQSfasI4PQ
         /HEPD2b8Naazgcw4Bb1rInYXtgYtQF1VsKNtYvfUdtKGvetRO5Jq1xCW5sZsPjRNpanX
         noWKcu16F0Naa/D+/mpXj8ZV8xdJ7f/achVmIQLuinLXGIAdYqKoC2hYQvPTjiVPIcHY
         1fgeGnnbZGpoE71rOb05OUE/2E+bnAsPWVXjU+tlgBtTKKTJI5vmPPmbQLJwHBidtVO+
         Nb1PlcKlL7fi7DP4SkDj4oH1YLw4tjurJSqrxPik1dmA2jWypCRemIF9/ksffEP/Buwo
         wdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246590; x=1794851390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
        b=2E5kq/Aj9Pb4mrNFCtDXwsxMS2mPyyrZJG9eMorZzJX9CSu9CB8RJq1ckPgiWyhrcC
         hTPxdvSd8oKKIn+xBdz+d47/2RL9YINV5Zuic/crW3UJ2DNwTC1rC5SOrQUyFiuZYg4n
         r9eYEX3MYckSi1PVe9W0NtZh7ZI4HsecAzVdCP3T4IvngvXlVtKWIvlEH20f/AwT7IJd
         FYjs3wFF6l/jJGcV1BFgKnfUzd900rfPCXma9Yb2Z6Wqq3pHPPdXnuP5Cppet+7Hv8aW
         AjFRXvESpLko0SDcadVP8ansCw1bRy8mToJYCuy2+fFDgUQ35i0rYUBlmLencF+kvwe1
         QoeA==
X-Gm-Message-State: APuU4Z/yIMLwYfuv7VRGMEZVARTEcN7woUIflNVe+zrWABOQSDX5LfJu
	47BEo9FNmRP0xkOd2qUPtfANEEMjwPqOCSybtc6Qcqc2082mz8mcnBk9bcNu/pCJnVL00g6Kj2K
	/LXnSEW3dX4VuWk2bFcQ0PJpXFr9OGlv4X3WeMbs=
X-Gm-Gg: AYBFou0N4a/313l1usQFC6Y/G9AI+JKixPYjUkiwnkmHVSgv4NORkfdEnCSrd2N9QIQ
	5qwsY6+1ZJc4y/T/6cHPSH87P78mqlC3NKPjYVPUPsDrO4okCnBwLm/6cItnqI12fVoxp0x+1GG
	LU0+SioIZW/8dPU/L7N28AauHc05AZL5YQ16/Pe1gz90Y0nBKK3J4IVQbaF+TDUeRNUJu8Vm4Oe
	nxO/s4RLGhxynErt77LcMHvgGDPAQUV8Y3X0qawXffhDmYEDgJntkvbYAxkVJnDixhR75BczTGa
	Tx9PFWpPnNwA8L4FvVag5Qm6tQEnKt3bjvmTE1wVeOnZg9qg+oEBWlnsVkCH9sj5G9BAGgt5svx
	9fzZjltKuZSs8tfrUKMwmGRGoUFD1gnXMKIEy87Cc96/uYMKGw9ewYlIrpu1WLgl029Gj
X-Received: by 2002:a05:6214:cac:b0:91e:bcef:384f with SMTP id
 6a1803df08f44-91eef84d7d4mr6751636d6.46.1794246589654; Mon, 09 Nov 2026
 09:49:49 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109172144.1851173-1-hj351016@gmail.com> <sashiko-outbox-205332@kernel.org>
In-Reply-To: <sashiko-outbox-205332@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 02:49:37 +0900
X-Gm-Features: AclHuK8y_DcJwMMG1_6LrWdxW7usdoZIty8966dYKsKjCcGNp3DTuJhiAnq5thg
Message-ID: <CAGr5VtMuhPM+9dtTcsDLk3E5xyRXibvN=pY=ehT+AfuN4q030w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the thorough review - the points are all valid. The
jack_detect_work and calibrate_work handlers busy-wait for card
instantiation, so cancel_delayed_work_sync() on the teardown path can
hang, and calibrate_work needs the same handling. This needs the
reschedule rework the sibling drivers got (4c33de0673ce, a6d78661dc90)
before a cancel is safe, so please disregard this version.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 2:45, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] ASoC: rt5665: infinite hang in rt5665_i2c_shutdown() canceling
>   jack_detect_work
> - [High] ASoC: rt5665: uncanceled calibrate_work in
>   rt5665_i2c_shutdown() causes UAF
> - [Medium] ASoC: rt5665: unconditional disable_irq() in
>   rt5665_i2c_shutdown() on IRQ error
> - [Low] ASoC: rt5665: inaccurate handler name and queuing site in commit
>   message
> --
>
> commit 753d54cd6a5c4d1a6c0962dfc60f96a690d96477
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free
>
> This commit disables the client IRQ and cancels jack_detect_work and
> jd_check_work in rt5665_i2c_shutdown(), and wires up an I2C .remove callb=
ack
> that invokes rt5665_i2c_shutdown().
>
> > rt5665_jack_detect_work() runs from the delayed work jack_detect_work,
> > which is queued from the jack IRQ handler and from the jack-detect setu=
p,
> > and the jd_check_work polls button state; both dereference the driver
> > data via container_of().
>
> [Severity: Low]
> In sound/soc/codecs/rt5665.c, the handler for jack_detect_work is named
> rt5665_jack_detect_handler(), and it is only queued from rt5665_irq();
> rt5665_set_jack_detect() only configures registers and stores hs_jack.
>
> > diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
> > index 62b21092e352b..bce2fc8c9bc6b 100644
> > --- a/sound/soc/codecs/rt5665.c
> > +++ b/sound/soc/codecs/rt5665.c
> > @@ -4837,9 +4837,19 @@ static void rt5665_i2c_shutdown(struct i2c_clien=
t *client)
> >  {
> >       struct rt5665_priv *rt5665 =3D i2c_get_clientdata(client);
> >
> > +     if (client->irq)
> > +             disable_irq(client->irq);
>
> [Severity: Medium]
> Can this disable an IRQ that the driver never acquired?
>
> In rt5665_i2c_probe(), a failure in devm_request_threaded_irq() only logs=
 an
> error and lets probe succeed with client->irq still set:
>
> sound/soc/codecs/rt5665.c:rt5665_i2c_probe() {
>         if (i2c->irq) {
>                 ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NU=
LL,
>                         rt5665_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FA=
LLING
>                         | IRQF_ONESHOT, "rt5665", rt5665);
>                 if (ret)
>                         dev_err(&i2c->dev, "Failed to request IRQ: %d\n",=
 ret);
>
>         }
> }
>
> If that request fails, rt5665_i2c_shutdown() will still call
> disable_irq(client->irq) on remove or shutdown, leaving the IRQ disable d=
epth
> unbalanced.
>
> > +     cancel_delayed_work_sync(&rt5665->jack_detect_work);
>
> [Severity: High]
> Will cancel_delayed_work_sync(&rt5665->jack_detect_work) hang forever if =
the
> device is unbound or shut down before the sound card is instantiated or
> calibrated?
>
> rt5665_i2c_probe() requests the IRQ before registering the component, and
> rt5665_jack_detect_handler() spins inside the work callback waiting for t=
he
> component, card instantiation, and calibration:
>
> sound/soc/codecs/rt5665.c:rt5665_jack_detect_handler() {
>         while (!rt5665->component) {
>                 pr_debug("%s codec =3D null\n", __func__);
>                 usleep_range(10000, 15000);
>         }
>
>         while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
>                 pr_debug("%s\n", __func__);
>                 usleep_range(10000, 15000);
>         }
>
>         while (!rt5665->calibration_done) {
>                 pr_debug("%s calibration not ready\n", __func__);
>                 usleep_range(10000, 15000);
>         }
> }
>
> If an interrupt schedules jack_detect_work while any of those conditions =
is
> false and the device is then unbound or shut down, cancel_delayed_work_sy=
nc()
> waits indefinitely for a loop that will never make progress.  The sibling
> drivers fixed this by rescheduling the delayed work instead of looping in=
side
> the handler; see 4c33de0673ce ("ASoC: rt5682: do not block workqueue if c=
ard
> is unbound") and a6d78661dc90 ("ASoC: rt5668: do not block workqueue if c=
ard
> is unbound").
>
> > +     cancel_delayed_work_sync(&rt5665->jd_check_work);
>
> [Severity: High]
> Does rt5665->calibrate_work also need to be canceled here?
>
> Unlike rt5682, rt5665_probe() schedules rt5665->calibrate_work with a 100=
 ms
> delay, and rt5665_calibrate_handler() -> rt5665_calibrate() sleeps across
> polling loops while accessing rt5665, rt5665->component, and rt5665->regm=
ap.
> If the I2C device is unbound while calibrate_work is pending or running,
> devres frees rt5665_priv and the work handler accesses freed memory.  Not=
e
> that rt5665_calibrate_handler() also has an unbounded while
> (!snd_soc_card_is_instantiated(rt5665->component->card)) loop that would =
block
> cancel_delayed_work_sync() if not converted to reschedule.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172144.18=
51173-1-hj351016@gmail.com?part=3D1
