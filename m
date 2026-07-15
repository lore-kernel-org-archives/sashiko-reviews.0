Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E331E841
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097754; cv=pass; b=FQPpzr5wWlqk49t6zLsw26n8u7SXKJHt3mrm5YOqcb1gsQNJQFc0udronuyI040WP1uVSaVWsGhDh4AKy5ZnB9D9br3APcmTv2H6joI+84rk4jcdtJ6MWf+ZmtSlUevnbVQhPHk/CLZjOrt6XzJYUgG7oLg7tMKLlAcWkSm+LlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097754; c=relaxed/simple;
	bh=2lATJlO+d4dX1ZGzZ6Ij2Thcx3Vi5FaF9agRcuMNiUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qef9DJxxwdHeZLpSPVKMDl6P1W1rHwAGTfSubCnXMcPWVqn6Z0Air8NiUD9bu1zCIMwGE+qq/b5Whw34kL83RrJFjMv6VxfEifhzjFXy5eYbRJvaPDXVSA91/PIz14bI3+Igbl53wGu4TVQuniRxOuIJ3bOIgWnypu3zDslJvio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGQuIssb; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGQuIssb"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664a5193741so645071d50.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 23:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784097752; cv=none;
        d=google.com; s=arc-20260327;
        b=Mo5ere0Wpptzo7viIXK3jco6jdlNyKxV/VjK2NY7pxsXOAm9RDuGrDClXeLFqXSejI
         Ig2SnxdHsM+uE57aci+W/NJz0/xcDuHgJalOqPZlVMrwjyJe9dr3o9rPEYX689Nc82uN
         6deQcjClCH80QPkan2us0hv20gNMwOb3HcGjThoaG+6tftiiSBBOKFRiPhP38Twt07EF
         tATPiyPIhhOH2eWBQIsT+oqi5EVlKMUkxpaUXU70ZjY86dMYrZ21BPrRYw4XXGmGpZVU
         JK3C5VYnkjYRoXGzET/LBhRLs0BDzKc+OtMrhxR3N2e8UwL6J6oTavzHtrV+zT3I+QP2
         SHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IC2NFXdk1sBeNCjIzes4BsGyhl+tCtt5hT8/Hup8Wto=;
        fh=xPpY1eJncIbZYzB1EwAwSnJKmF4AWv783JvkNJMI/QQ=;
        b=cXSrs/Ha/G+FmChz/nHGDehJdBtZOSSgKqga0eRcBG2hbs2I2m53rOeiIvhL6rEWO1
         k05Nh/Y6BYjKBfrNQFiGXm+OnxuzmHObC1OTOXzTV4kOQuEYhrslXXyhYR32c31f6he/
         c+2ndHDKFhypHWRGPfNwWB2gOTnWYZvgRBsA9Ir0NKnYAt7efeqTbJDnkXxsVmVuA5vq
         2uhXqEKLL8l32Ckjca4OsujpH3BpHmoav7Id0Odw3wG3YA9PV2u2epn/P9SWOmhkLRpD
         rs6ObBXyblA1eavlb77rFSc0cCkEzN8LHOFzmBbDfo5HfZUMqxuK7MGPkgQBmpsUM+uC
         DffQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784097752; x=1784702552; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IC2NFXdk1sBeNCjIzes4BsGyhl+tCtt5hT8/Hup8Wto=;
        b=IGQuIssbTxy1HauJauzTilviTkcifSKs+nvPZVXGT9PVXiNo+Bj4OZLRZ8ggCK2q76
         rIuUOf9icVavzrqllF6coIosj2OeOk/QanVwOAnXBZGsPfKHhZShRl/v0lf1PLiPe7Pq
         YlNWka5glmb/7aWneKwK7E6Tr01be77qGs/x2/vhytbEDXtAMszalv7iJ9wIjE2CvoaG
         xF7mOnbzwSQha2+kKqOkwCHgq9+HarNxEiJE1vmEiSFMA/uhr7tbqS7TDQKWCbth9K2W
         0oVqRkhQVtFdzDpCGyh43MT8o5Bz16DHZdzacyGm7zfLUTL2ZYMfe93R2zIXH0FBRpaG
         PnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784097752; x=1784702552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IC2NFXdk1sBeNCjIzes4BsGyhl+tCtt5hT8/Hup8Wto=;
        b=h5as+gDqths6SntGSetaTg3R02Sn5C9nRqiCQ75Dal+dnjixgqjqC+VVZOc3ptINND
         eLOerAsDieG615JPpbYYGKw5G9xCkzyI5XUnnfLG2DP+W8UBnA1cLpuu5iLo3f9+A3Ak
         9Ijj92UjJbL4TtjWvZplX5np3AYp6e92m+wupUPbRVE0T0x2b2+lD21uwBdMfcMv793v
         LEoo9JREos6EhIqCkurp2xNwUQSS6IpgGYrMiNwqO6gidwBX4SFHXMUAoEG6MjnaBagT
         OQKz/f8wx8Ifz03JDA/th4OLSGj6rPU0dnB+uCLgKrgrCBRg4+Ds9KdgPtxYDNzH7n40
         +aiQ==
X-Gm-Message-State: AOJu0YyuteyQJimuJZwiitY5EmiP+I/+nLOrbG+0mTmR/+rTx7/nVvKX
	jU5K4Ti5VA2MGXA9IlJ8Fr/M6vhygzqSso8pB9dkAVaRsNpGNVDg4kGXZS1bG+Y6xgcKPtR3qon
	yiIsgGKl/S+Wrn6eZW8dZjY86GaggK1ZTLCXta8c=
X-Gm-Gg: AfdE7cmudp1dBpp3VJdGBWo9Jf5lJ8KHzNKFWh9cLKgIk9KaILyQNkCIRT3eCi4feBJ
	tuBlbwPhCM0zgBSgUpMbu69q7n8SL8THRewVYhNwNdE7Poj9WfHRASRNN53exa3RFdaqPYKf7hH
	T5MJzN1PZ0Xg15GeXJE8tnoxpUIZjIO7KTBTyU/Wa/zY3MzworCxSeWilR2ZgayOX/simPHL8yp
	FnztUWGIEgmr3YphmPfS9z9graKIaKBqVQgQgG2ZoJjXuklIo30xej6cD/3jfywbRCenIe8esx6
	XcBmEOpqImsyyBZwYMWOQ4lgbvF9Ye5CCBfLooDsRg==
X-Received: by 2002:a05:690e:450c:20b0:664:aa85:a7c0 with SMTP id
 956f58d0204a3-667d7f18d23mr8030795d50.7.1784097751826; Tue, 14 Jul 2026
 23:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-3-royalnet026@gmail.com>
 <20260715054820.E992E1F000E9@smtp.kernel.org>
In-Reply-To: <20260715054820.E992E1F000E9@smtp.kernel.org>
From: Royal Net <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 08:42:19 +0200
X-Gm-Features: AUfX_myD8dUZJn8UTdwbwOxs0r4AyRD-gaAa80tNslmI0JKUudkW6-nC1ipiUy0
Message-ID: <CAEWPSH6FTku9cY2i=R=v6saVP+uFJrNmb0dGFvTB9rPuata+EQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio capture support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the thorough pass -- all five are in the new code, so all
five are mine to fix. Ack on each:

> - [High] Passing an ERR_PTR to platform_device_unregister() causes
> a kernel panic during module removal.

Confirmed. hdmirx_register_audio_device() leaves the ERR_PTR in
audio_pdev when registration fails (probe intentionally only warns),
and the NULL check in hdmirx_remove() doesn't catch an ERR_PTR. Will
store NULL on failure so the existing check works.

> - [High] Flawed teardown ordering and failure to clear the
> audio_streaming flag in hdmirx_remove() allows the delayed work
> to re-arm, leading to a Use-After-Free.

Confirmed. The self-rearm guard was added for audio_shutdown() but
remove() never clears audio_streaming, so a worker instance running
at removal time can re-arm after cancel_delayed_work_sync() returns.
Will clear the flag first, unregister the codec device (tearing down
the stream), and cancel the work last.

> - [High] Concurrent unprotected access to shared audio state
> variables between ALSA `hw_params` and the background worker.

Confirmed. A repeated hw_params without an intervening shutdown can
race the worker over audio_fs/audio_clkrate/audio_pre_state. Plan is
to stop the worker (clear the flag + cancel_delayed_work_sync) at the
top of hw_params before touching shared state, which keeps the worker
the only writer while it is armed and avoids introducing a lock.
> - [Medium] Unconditional access to `clks[1]` causes an
> out-of-bounds read if the Device Tree specifies only one clock.

Agreed -- index-based access is fragile even though the binding lists
the audio clock. Will resolve the "audio" clock by name from the bulk
clock data once at probe time and cache the pointer.
> - [Low] The audio worker item silently migrates from an unbound
> workqueue to the default CPU-bound workqueue after its first
> execution.

Confirmed; the re-arm path uses schedule_delayed_work() while the
initial queueing uses system_unbound_wq. Will use
queue_delayed_work(system_unbound_wq, ...) consistently.

All five will be addressed in the next revision, together with any
design-level feedback on the RFC itself.

Igor

On Wed, Jul 15, 2026 at 7:48=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] Passing an ERR_PTR to platform_device_unregister() causes a kern=
el panic during module removal.
> - [High] Flawed teardown ordering and failure to clear the audio_streamin=
g flag in hdmirx_remove() allows the delayed work to re-arm, leading to a U=
se-After-Free.
> - [High] Concurrent unprotected access to shared audio state variables be=
tween ALSA `hw_params` and the background worker.
> - [Medium] Unconditional access to `clks[1]` causes an out-of-bounds read=
 if the Device Tree specifies only one clock.
> - [Low] The audio worker item silently migrates from an unbound workqueue=
 to the default CPU-bound workqueue after its first execution.
> --
>
> --- Patch [2]: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio ca=
pture support ---
> commit a0cbe815be5692f1b4e770ef5f613ff1fa0b7862
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> media: synopsys: hdmirx: add HDMI audio capture support
>
> The Synopsys DesignWare HDMI RX controller extracts the audio stream
> embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> controller. Expose it as an ALSA capture device by registering the
> generic hdmi-codec as a child of the controller.
>
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/dri=
vers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>
> [ ... ]
>
> > +static void hdmirx_audio_clk_ppm_inc(struct snps_hdmirx_dev *hdmirx_de=
v, int ppm)
> > +{
> > +     int delta, inc;
> > +     long rate =3D hdmirx_dev->audio_clkrate;
> > +
> > +     if (ppm < 0) {
> > +             ppm =3D -ppm;
> > +             inc =3D -1;
> > +     } else {
> > +             inc =3D 1;
> > +     }
> > +     delta =3D (int)div64_u64((u64)rate * ppm + 500000, 1000000);
> > +     delta *=3D inc;
> > +     rate =3D hdmirx_dev->audio_clkrate + delta;
> > +     clk_set_rate(hdmirx_dev->clks[1].clk, rate);
>
> [Severity: Medium]
> Does this code access the clock array out of bounds if the device tree on=
ly
> provides one clock?
>
> The probe function uses devm_clk_bulk_get_all() which only guarantees
> num_clks >=3D 1, but this unconditionally accesses index 1.
>
> > +     hdmirx_dev->audio_clkrate =3D rate;
> > +}
>
> [ ... ]
>
> > +static void hdmirx_audio_work(struct work_struct *work)
> > +{
>
> [ ... ]
>
> > +     /* Only re-arm while streaming; avoids a self-reschedule race wit=
h
> > +      * cancel_delayed_work_sync() in audio_shutdown().
> > +      */
> > +     if (READ_ONCE(hdmirx_dev->audio_streaming))
> > +             schedule_delayed_work(&hdmirx_dev->audio_work,
> > +                                   msecs_to_jiffies(delay));
>
> [Severity: Low]
> Does this cause the worker to silently migrate to the default system_wq?
>
> The worker is initially queued on system_unbound_wq using mod_delayed_wor=
k(),
> but schedule_delayed_work() implicitly targets the default CPU-bound
> workqueue.
>
> > +}
> > +
> > +static int hdmirx_audio_hw_params(struct device *dev, void *data,
> > +                               struct hdmi_codec_daifmt *fmt,
> > +                               struct hdmi_codec_params *hparms)
> > +{
> > +     struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> > +     u32 fs;
> > +
> > +     fs =3D hdmirx_audio_fs(hdmirx_dev);
> > +     if (!fs)
> > +             fs =3D hparms ? hparms->sample_rate : 48000;
> > +     if (!fs)
> > +             fs =3D 48000;
> > +
> > +     hdmirx_dev->audio_fs =3D fs;
> > +     hdmirx_dev->audio_clkrate =3D fs * 128;
>
> [Severity: High]
> Can concurrent ALSA hw_params ioctl calls race with the background worker=
 here?
>
> ALSA allows consecutive hw_params calls, which could modify audio_fs,
> audio_clkrate, and audio_pre_state locklessly while the worker is already
> executing on another CPU.
>
> Could this concurrent access result in an invalid clock frequency calcula=
tion?
>
> > +     clk_set_rate(hdmirx_dev->clks[1].clk, fs * 128);
> > +
> > +     hdmirx_audio_fifo_reinit(hdmirx_dev);
> > +     hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR_PASS, HDMIRX_AUDIO_INIT_=
FIFO_STATE);
> > +     hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR,
> > +                   AFIFO_THR_LOW_QST(0x20) | AFIFO_THR_HIGH_QST(0x160)=
);
> > +     hdmirx_writel(hdmirx_dev, AUDIO_FIFO_MUTE_THR,
> > +                   AFIFO_THR_MUTE_LOW_QST(0x8) | AFIFO_THR_MUTE_HIGH_Q=
ST(0x178));
> > +
> > +     hdmirx_update_bits(hdmirx_dev, AUDIO_PROC_CONFIG0, I2S_EN, I2S_EN=
);
> > +     hdmirx_update_bits(hdmirx_dev, GLOBAL_SWENABLE, AUDIO_ENABLE, AUD=
IO_ENABLE);
> > +
> > +     hdmirx_dev->audio_pre_state =3D 0;
> > +     WRITE_ONCE(hdmirx_dev->audio_streaming, true);
> > +     mod_delayed_work(system_unbound_wq, &hdmirx_dev->audio_work,
> > +                      msecs_to_jiffies(200));
> > +
> > +     dev_dbg(dev, "audio hw_params: fs=3D%u\n", fs);
> > +     return 0;
> > +}
>
> [ ... ]
>
> > @@ -2765,6 +3001,10 @@ static int hdmirx_probe(struct platform_device *=
pdev)
> >                                                      V4L2_DEBUGFS_IF_AV=
I, hdmirx_dev,
> >                                                      hdmirx_debugfs_if_=
read);
> >
> > +     ret =3D hdmirx_register_audio_device(hdmirx_dev);
> > +     if (ret)
> > +             dev_warn(dev, "failed to register HDMI audio codec: %d\n"=
, ret);
> > +
>
> [Severity: High]
> If platform_device_register_full() fails in hdmirx_register_audio_device(=
),
> it returns an ERR_PTR which is stored in hdmirx_dev->audio_pdev.
>
> Since this failure only logs a warning and allows the probe to succeed, w=
on't
> the check in hdmirx_remove() evaluate to true?
>
> if (hdmirx_dev->audio_pdev)
>     platform_device_unregister(hdmirx_dev->audio_pdev);
>
> Will this cause a kernel panic when platform_device_unregister() attempts=
 to
> dereference the ERR_PTR?
>
> >       return 0;
> >
> >  err_unreg_video_dev:
> > @@ -2784,6 +3024,10 @@ static void hdmirx_remove(struct platform_device=
 *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> >
> > +     cancel_delayed_work_sync(&hdmirx_dev->audio_work);
> > +     if (hdmirx_dev->audio_pdev)
> > +             platform_device_unregister(hdmirx_dev->audio_pdev);
> > +
>
> [Severity: High]
> Could the worker re-arm itself after this cancelation?
>
> If the worker is running during removal, cancel_delayed_work_sync() waits=
 for
> it to finish. However, because audio_streaming is not set to false prior =
to
> this call, the worker will see audio_streaming =3D=3D true and re-arm its=
elf.
>
> Additionally, since platform_device_unregister() is called after the time=
r
> cancelation, could userspace trigger a concurrent hw_params ioctl and re-=
arm
> the timer through that path?
>
> Will the re-armed timer execute on freed memory after the device is remov=
ed?
>
> >       v4l2_debugfs_if_free(hdmirx_dev->infoframes);
> >       debugfs_remove_recursive(hdmirx_dev->debugfs_dir);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.64=
652-1-royalnet026@gmail.com?part=3D2
