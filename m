Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325855C1B0
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 21:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926535; cv=pass; b=UYrvToF3PjgqFrJtyHKGsTqECH2jVKmFdMvS6rX7D7TROO4jlZClAv0l4yTho0U7j5mnrTwuvrfJGa/iljyLo8o6Ma4zK+Wi+HHyIdCtGaHktGu0QbC6DqJIQbpY/gaEAx/hLpAs4LRLRFeAa0aDFgtuPNOAFukiw3vZj/kyY7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926535; c=relaxed/simple;
	bh=sf30vAcaJ++DLttGm/TNinMSo0jN9WDVolmb3olSr0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnl7sUwOACTBPKVG7xnGz/jW1kcSIjHeYXXG97F7UiOUKPsQnf5ST4JhXOT2UhRqTsh46QuUqCOYEu1jSkwDmgzGQxXG/UVP8YZTqdI3fXpFehhFKQnl8jiEDWV5303hxvgjEGkty4Q5GK17t7oqkvjC3ipHg6ftxUxfYcyRdpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nGfZo48a; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nGfZo48a"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836c8bde2dcso22746267b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 14:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791926528; cv=none;
        d=google.com; s=arc-20260327;
        b=Av5cJ6035+Uasd+KUgHtlkuLjTPxqHBJxmrXTkQKwslpXdXfJ0J40D046z3IyiXt5S
         JOFo7UDuDYtxlphYjxxoZG37m3qHwYjfjgfw8uEM1LY/ZiJoc1wQWncSOggwg9JoNaOv
         qYaytmqSI1Lwe0AXqVd025zLmlzDuYYWnP/M1eZOnTVecOtsOl2jP5d2Qbc55eccJgaR
         TLmC5Xc1W/90zzLIkL7nsr2D7DhVI08g2LxOrEGwyidnJYaglfSdjspXJiata4RKGDNN
         hphCj49karGdhyFETq2JwGnxVTor9WK3lflVLLjxfnToAok1/nTiRTs2LoBkk2xkopz5
         4qNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tW1MH59A22+8G0RbZ3B3dj8ln/Mz2H51o5N7Shhczv4=;
        fh=uRbUWIF7UQoC4wlCZDqhIC9/I5L3d7Tjlt7qH4q9Mnc=;
        b=cLPl7XiyS1R3OsDzHLA3VYQjGjgswCQmk/XZrWRJJ24fk+PlDtinEas3VRX+FqZt8G
         btCrub0GODOOogr4LL4VFPgA4M+v2nGY9qB6jwe8SmFBC7iG/H8ro9A0srtpun0KZkY4
         28nZEPtWB8Y5iX93Y3GuyWyOdgoidUJTCUJWvhF+s7nM1pkj8yoKyc/p3XHeewBmXu09
         f0dx40SoR3IbLGjvuisd0rW8+2EUU+60fzaOtfww/GCeirsjY4kVAkLDccPoRLrhnNHn
         ebqs6P4CEzq7U4hXdBXEPbf1mOY/ntGRS8Rne6JhRfXSQuuJENqcbiSUe0LWpDB7D5Yt
         7Wmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791926528; x=1792531328; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tW1MH59A22+8G0RbZ3B3dj8ln/Mz2H51o5N7Shhczv4=;
        b=nGfZo48agiu6Bc7iCPt/XI4ZjbnajTuF1th+XaR/nVSGJ8zMQ08jr3OQtouXTwshJD
         SnngPLww8yD7JgCjPLodCczcZZqAXxsAup/zqD3nEQCl5W/Cug503PNKU+5KHAWghGiD
         2mvEkMcglveSAVQr4VDWvi+Hg73Za3qnXZdCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926528; x=1792531328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW1MH59A22+8G0RbZ3B3dj8ln/Mz2H51o5N7Shhczv4=;
        b=BdwDHnjomh5OQItxMFcbJK/pX7iMT7WYvUSswjiEctJXpWzEHb+a6YaZTBBV3wpFWc
         CdDr7DsimqGsOQRNWIBaG0WrA4F1hlLEY+Hn0GtP8PQYV+I2XkGlHfeDHuzqC3bICfaV
         EdugZx+X6wIUd4APjVU/grDFz1wY4KJEz4MnmvW8rKQbkiTMflej5f/T5Tv1irbDjMqI
         GuOkIbWZX8bVWhTd6IADVDzGaiJoo14E/ct//TMsIza3Q0/+Xvs45BXwqwMEvAfNGCSu
         221ARitGCMBopAC908oZXe3oV8CSU/Gf/mDGsNYftHvrxeg+3JCyt1P6ea5uZtqpc1ji
         mXBQ==
X-Gm-Message-State: AFq9FYI2tzpNNbO0gHzyufe9v65CUwFIWWLAHtdSG6NcKxq92nCt49dY
	bGOKBzkJ6M7qwFAe8YhkAkq6q7xAO/g221PV3HIe3OF3nrDeoSm/aibEAEfQD3JNM+EhSQxiF8d
	y8/fOVdDYTJWvWbqf3sQtuDCLrqBlCXYJsS1FEPTGv9km4LTnF2gUXA==
X-Gm-Gg: AYBFou2+PUAEVyGNGzgbQqWsY/ISRWjXvM5Xc34EyxPvHrxUFUrMD+x0ekVwt093Yu+
	pU9AIFvGVeWBXCwRA9BWM2blxLym4mcxEHufOd7QgbUAhPM7du1frshWoYSJGndQ9U9xFY74Acu
	XNsolhS1s4jW99hfuJKkkyuENmmrb/+NyNNItV+naowKOqDbjuFtXQiVlO+QJXHJCJdCVDHbeOO
	wk0Iy6/ZMKDYp78GnewFOIp+L4xpKyzX178my9icGSRI4+1seuzhTSg1byfp5PCtvPeKFYlgqmi
	1ju1Gk5TZC6r2XsSLF9o+E826cGgJwmWSGPgbOfpoPjcWCOW5pJyx5CpD4i4uDJNsHo7d4dQCMJ
	2h1ynU/M6tg==
X-Received: by 2002:a05:690c:4d4a:b0:887:f4fc:ee35 with SMTP id
 00721157ae682-8b07ed1fb6cmr47618147b3.19.1791926528330; Tue, 13 Oct 2026
 14:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-4-384af01da3ee@chromium.org> <sashiko-outbox-166154@kernel.org>
In-Reply-To: <sashiko-outbox-166154@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 14:21:57 -0700
X-Gm-Features: AclHuK8vj_2CnW3lS7fdTlkJRR8RuhSwUE7H_CFag_-G2v-URCUG4IFSzD-lQgw
Message-ID: <CAEe3GZH-QD4vj71c2AR6Y0VFhchBARBctYtfmur07nrgK5xBWQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] HID: spi-hid: add spi-hid driver HID layer
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] hid: output_report callback sleeps in atomic context
> --
>
> commit 954a3684cea1bad33a85c00ff6725f7553c75027
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
>     HID: spi-hid: add spi-hid driver HID layer
>
>     Add HID low level driver callbacks to register SPI as a HID driver, a=
nd
>     an external touch device as a HID device.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 02a7608c4b882..fca7a44eeb9f9 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > +static int spi_hid_send_output_report(struct spi_hid *shid,
> > +                                   struct spi_hid_output_report *repor=
t)
> > +{
> > +     guard(mutex)(&shid->output_lock);
> > +     return __spi_hid_send_output_report(shid, report);
> > +}
> > +
> > +static int __spi_hid_sync_request(struct spi_hid *shid,
> > +                               struct spi_hid_output_report *report)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +     int error;
> > +
> > +     reinit_completion(&shid->output_done);
> > +
> > +     error =3D __spi_hid_send_output_report(shid, report);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D wait_for_completion_interruptible_timeout(&shid->output=
_done,
> > +                                                       msecs_to_jiffie=
s(SPI_HID_RESP_TIMEOUT));
> > +     if (error =3D=3D 0) {
> > +             dev_err(dev, "Response timed out\n");
> > +             return -ETIMEDOUT;
> > +     }
> > +     if (error < 0)
> > +             return error;
> > +
> > +     return 0;
> > +}
> > +
> > +static int spi_hid_sync_request(struct spi_hid *shid,
> > +                             struct spi_hid_output_report *report)
> > +{
> > +     guard(mutex)(&shid->output_lock);
> > +     return __spi_hid_sync_request(shid, report);
> > +}
> [ ... ]
> > +static int spi_hid_ll_output_report(struct hid_device *hid, __u8 *buf,
> > +                                 size_t len)
> > +{
> > +     struct spi_device *spi =3D hid->driver_data;
> > +     struct spi_hid *shid =3D spi_get_drvdata(spi);
> > +     struct device *dev =3D &spi->dev;
> > +     struct spi_hid_output_report report =3D {
> > +             .report_type =3D OUTPUT_REPORT,
> > +             .content_length =3D len - 1,
> > +             .content_id =3D buf[0],
> > +             .content =3D &buf[1],
> > +     };
> > +     int error;
> > +
> > +     if (!test_bit(SPI_HID_READY, &shid->flags)) {
> > +             dev_err(dev, "%s called in unready state\n", __func__);
> > +             return -ENODEV;
> > +     }
> > +
> > +     if (shid->desc.no_output_report_ack)
> > +             error =3D spi_hid_send_output_report(shid, &report);
> > +     else
> > +             error =3D spi_hid_sync_request(shid, &report);
>
> [Severity: High]
> Can this code sleep in an atomic context?
>
> The HID subsystem requires the output_report callback to be asynchronous =
because
> it can be invoked from atomic contexts, such as softirqs for LED triggers=
 or
> force feedback.
>
> Both spi_hid_send_output_report() and spi_hid_sync_request() acquire a mu=
tex,
> which will sleep. Furthermore, spi_hid_sync_request() blocks by calling
> wait_for_completion_interruptible_timeout() in __spi_hid_sync_request() w=
hile
> waiting for the response.
>
> Will calling these synchronous primitives from the output_report callback=
 lead
> to a scheduling while atomic BUG and cause a kernel panic?
>
> > +
> > +     if (error) {
> > +             dev_err(dev, "failed to send output report\n");
> > +             return error;
> > +     }
> > +
> > +     return len;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D4

Not really. HID core doesn't call ->output_report() from atomic context
(LED updates are sent from a workqueue), and as noted in my reply
on the documentation patch, USB-HID and I2C-HID already sleep in
this callback too.
