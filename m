Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795214186;
	b=wUfVdV1o3GnAvHjFjMip4R9kdrGrkRD+uMqI7M1zQCx/g2cDQtEMV5rjqR12gUUKWJms
	 k9KyIlMPGEpciDDvBck6e4mPo/JthaBmM58mrfIVdA3Cwie8gDCcJhEmBRx4thNpHi9x0
	 rJ7b/KQDXCpH6GuGQHynr9j5vL2YXsryw1aRD9nHPD48oaX051w0M3+L1nw8TLjXlKB5U
	 HqoH/KlZ0xWH2EaOrN41UO7rxAhrIWM9Jk5RyhAzaKdGO0xdqGmtlMWaKDA0LOe0axaoE
	 2kznfgQp16+eoOo5y0j+rt3gFLdiWmOoQWAaWdBy9DT7pwPmH0Iu1lBG5luHgX3Xmbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
	b=dwQHrKmn3hsDKf1VxFuVucys1PXhqvRUsrjTvcSAZ2mhTMzkbQeB1vqwQJeF8lgkK7+U
	 XsZUAD3SZwvYlnxNTOgfC54Y10jd7aTV7odttCukKETPF8oCjzb3Yg3TRUI/xS7fXazRO
	 Abrxt7lVa1beGKmuTrATF65DC+UZISdnMfd5n4Oc+Bo4WgaSWVkfsSr/GmAXE/tsGPtnn
	 VNASL8xhChFqJ/LPVKXi0aRf57GT3mbvEELiRe4umejXQPilCVjCjcgHFhiiamvEOE31O
	 NhmPV38BToJPKBw7Sup2ABqOTAwI1tyDAkeuOTdvaM0LsslxMcg05kXoeo/Glcri41A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="C90u/51Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5BF606A690
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 22:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5BF606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C90u/51Q
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4d86f5328so10165147b3.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 14:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795214180; cv=none;
        d=google.com; s=arc-20260327;
        b=E3hiLKrkfuXqMOW0grqlV47X47qhjfxSG72Pt2lscnYZLISyjxbfU7ErIfoiFL0PuN
         o0C4YpKwCvKhmAmqCQl92R552BdFI7b8e7l+VTU5da6ZY2v/mMF35XmxPRVCj3wqIUe5
         uOAOGi+YOfm3SreACa7rL7/H4hpuvLbCJXwoVn8xwtZg3er5W2W0++JCpgf9BiGuMOkj
         4oc5P3Dv0wILvlqFv5OEvVxSfZUT4He2hDwty7gvI03ACN3lvZ8NLNVUZYm6UR0lSXLa
         Pq9ddXLb7PRmYLAvXGcn1sLstyQ1gKmcZHQb3z0YmpZA0FB/QooBNMB13j8g5DtC5KQI
         vDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
        fh=osfj9leewLfc4MqIYaUjfG4KfpRUNqFnByXZRUnRoVs=;
        b=GR7aicj+AVgTE/04JuMUqQZ/LV46Ha+zqk6djnO6/FRm7x+5S7FAtd2/omdwMzfz8c
         WGWgHCbcuAMH/n7tvGhOCDq89LZ3ZeORYL73Zka+QC2lMVCFK7tMWLLDegYOzmoHAF9Z
         HSG7FFEaTsUCQx7kCZS3bKS/kIi1+ROCMnP076qdfQ0yqU2XHGuMtojITzHmCSEQQEMF
         31AvX5WEJQ1ohz+yO0ZkD9AtwZQCiy5n6sz/sp+ilR1mKyO6TE0TEzYfFzk3KxOFRbmE
         FKUrfrM4XjC76rG+QMtYfaaEg5lzF1XP3fBniiXA4vr4AS4BUxBJ1OX1Rg2MuzijXMHE
         9m1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795214180; x=1795818980; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
        b=C90u/51Qhoz52bGlqnlXgorxUZ3h0m/dPQxvhZnvZmhC63JOcfSLWdKqNCY3qPve30
         Eo5fQnFCDRPr1qyImlc5LrDaKivJ0x+ILNTUCRFbfTZ1TFtI2O133Y5bzm56RTVoUIIr
         QgOZL92/HBQtP0A+4Qtldq1sS/sJZyrVhwnYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795214180; x=1795818980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LI62TlkKF7SE72mFPwGFMzusKh7ch0L+DlHxc/4ud2I=;
        b=eWa0uOcJzNXxxGIE04Nmf/xGkF7SJEW5grUaUknLwesFuH4tk1WyEWdf9hJ96zwRUW
         iWITuOUYIUCOLD3k2pI7Da0u8zzc1DNNhXIT5DVix+fSQbBaEjYZOILA6GMt0SnlW22h
         NlDizD5is7I2t+cpBj0hkeABOGMPmDo0aGjD6iUtQKA9nWbBWYnR+9rhd5bmwlpFprXF
         6IsPvgQQPSBsog6/RSpxYUG94+x+iaS61BSKDvmQBSTFsH18uI1I7YmH5G5lOuZ6ZGg2
         M3dZt/ar/sDZ9383MmhZFGq2Ik1hMAm2uaSAHR8a2Vax7xdH/ya8YShfT3u/6FGXCg5b
         ZS+A==
X-Gm-Message-State: APuU4Z8ByldhwsntJ5PasHitVAwIqvFI9H5hku44y9nwG60snmissWAN
	yt4JPafBHqVr1OUa7Ee9BFaHdWODFtHEdbaArAhWyunLByaG8BSEn0DAoG+xSvyYZB7KGLCST1Q
	Twam8tcx4bILBNNqEkrt4FEtfV6SsXu4V5Z1YOfnM4Dsgi5uYHDXi2g==
X-Gm-Gg: AZFdTZfRPDUVegX2YDKTssu17VUaqwmH522bZgKKzjL07H4dU5d2KS2k9/uwSb4wcMr
	8Q7q3bL4rHpRDmAQkO4qBNFqiPAJFPdj1hdjwmePTyxjM2QLacSYfH13wYQgjcoer8cVKGvXSW4
	cMPWP9XL1+1he4zmBZT0UnwffFXluQ2I6vPg5HdY9eppy6aydqfx/mOFBxyBoJX5E3mG2OxKRCQ
	8C12fCMg1VYLEVgkIHmGKAgoPNxYx+Z6n0gX/XiLTp9oQYT593f7/L6oq7G6nb8PXcJWJbw1b3R
	/AOkunlpxyuIZ4TzQsORQeRZQRZYV4nJ8S8COzkDS3MvrNI8JcT/qtjAKwSjVMNRuX474L2YGGR
	zN4WuM1Q9o9mOtoRxa0//wCs1lp2F4c7MXxyZoDct5t2/2dJ3nzUEpvnUfVcAF+OWAYo=
X-Received: by 2002:a05:690c:6b09:b0:8b3:33cf:1fd6 with SMTP id
 00721157ae682-8b5204da8cbmr22654577b3.46.1795214180401; Fri, 20 Nov 2026
 14:36:20 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
 <20261024-send-upstream-v7-10-abad13174b43@chromium.org> <sashiko-outbox-183486@kernel.org>
In-Reply-To: <sashiko-outbox-183486@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 14:36:09 -0800
X-Gm-Features: AclHuK-uqG9_uXU3EVhPHyRTDXChIzvp0O_bkgQvn7hhRNcrLduMWOI_Cxiv4hw
Message-ID: <CAEe3GZGLP5PtW1HD1R_wm6+WeUf=7pVbCb3iKbihorEKy-4VkA@mail.gmail.com>
Subject: Re: [PATCH v7 10/11] HID: spi-hid: add power management implementation
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:19=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] hid: spi-hid: unhandled deassert_reset() failure in spi_hid_resu=
me()
> - [Medium] HID: spi-hid: race and missed hid_driver_reset_resume() in spi=
_hid_resume()
> --
>
> commit 9bd51942caad3c04cffc9fdd14002340e1980586
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add power management implementation
>
> This patch adds system sleep power management callbacks to the HID over S=
PI
> transport driver, handling device power down, reset synchronization, and =
wake
> IRQ setup across suspend and resume.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 4ff93d22715cd..3b8874ca0e1cc 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
>
> [ ... ]
>
> > @@ -231,6 +239,147 @@ static const char *spi_hid_power_mode_string(enum=
 hidspi_power_state power_state
> >       }
> >  }
> >
> > +/*
> > + * Wait for the device descriptor response after reset; the device the=
n takes
> > + * requests. Set READY here: the report descriptor check that normally=
 sets it
> > + * needs power_lock, which callers hold.
> > + */
> > +static int spi_hid_wait_for_reset(struct spi_hid *shid)
> > +{
> > +     unsigned long timeout =3D msecs_to_jiffies(SPI_HID_RESET_TIMEOUT =
+
> > +                                              SPI_HID_RESP_TIMEOUT);
> > +
> > +     if (!wait_for_completion_timeout(&shid->reset_done, timeout)) {
> > +             dev_warn(&shid->spi->dev,
> > +                      "Device descriptor not received after reset\n");
> > +             return -ETIMEDOUT;
> > +     }
> > +
> > +     set_bit(SPI_HID_READY, &shid->flags);
> > +     return 0;
> > +}
> > +
> > +static int spi_hid_suspend(struct spi_hid *shid)
> > +{
> > +     int error;
> > +     struct device *dev =3D &shid->spi->dev;
> > +
> > +     /*
> > +      * Stop reset_work until resume; pending steps keep their flags. =
The
> > +      * IRQ stays on so a request in flight gets its response.
> > +      */
> > +     disable_work_sync(&shid->reset_work);
> > +
> > +     /* HID driver suspend may talk to the device; responses need the =
IRQ. */
> > +     scoped_guard(mutex, &shid->power_lock) {
> > +             if (shid->power_state !=3D HIDSPI_OFF && shid->hid) {
> > +                     error =3D hid_driver_suspend(shid->hid, PMSG_SUSP=
END);
> > +                     if (error) {
> > +                             dev_err(dev, "%s failed to suspend hid dr=
iver: %d\n",
> > +                                     __func__, error);
> > +                             enable_work(&shid->reset_work);
> > +                             /* Redo a schedule_work() dropped while d=
isabled. */
> > +                             schedule_work(&shid->reset_work);
> > +                             return error;
> > +                     }
> > +             }
> > +     }
> > +
> > +     /* disable_irq() waits for a running IRQ thread. */
> > +     disable_irq(shid->spi->irq);
> > +
> > +     guard(mutex)(&shid->power_lock);
> > +     if (!device_may_wakeup(dev)) {
> > +             if (shid->power_state !=3D HIDSPI_OFF) {
> > +                     /* Device is fully reset on resume; drop stale st=
ate. */
> > +                     clear_bit(SPI_HID_READY, &shid->flags);
> > +                     clear_bit(SPI_HID_RESET_RESPONSE, &shid->flags);
> > +                     clear_bit(SPI_HID_CREATE_DEVICE, &shid->flags);
> > +                     clear_bit(SPI_HID_ERROR, &shid->flags);
> > +                     set_bit(SPI_HID_RESET_PENDING, &shid->flags);
> > +
> > +                     shid->ops->assert_reset(shid->ops);
> > +
> > +                     error =3D shid->ops->power_down(shid->ops);
> > +                     if (error)
> > +                             dev_err(dev, "%s: could not power down: %=
d\n", __func__, error);
> > +
> > +                     /* Held in reset either way; resume resets it. */
> > +                     shid->power_state =3D HIDSPI_OFF;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int spi_hid_resume(struct spi_hid *shid)
> > +{
> > +     int error;
> > +     struct device *dev =3D &shid->spi->dev;
> > +     bool was_reset =3D false;
> > +
> > +     guard(mutex)(&shid->power_lock);
> > +     enable_work(&shid->reset_work);
> > +     if (test_bit(SPI_HID_DEAD, &shid->flags)) {
> > +             /* Stay off; only balance disable_*() in suspend. */
> > +             enable_irq(shid->spi->irq);
> > +             return 0;
> > +     }
> > +
> > +     if (!device_may_wakeup(dev)) {
> > +             if (shid->power_state =3D=3D HIDSPI_OFF) {
> > +                     shid->ops->assert_reset(shid->ops);
> > +
> > +                     shid->ops->sleep_minimal_reset_delay(shid->ops);
> > +
> > +                     error =3D shid->ops->power_up(shid->ops);
> > +                     if (error) {
> > +                             dev_err(dev, "%s: could not power up: %d\=
n", __func__, error);
> > +                             /* Suspend runs next even if resume fails=
. */
> > +                             enable_irq(shid->spi->irq);
> > +                             return error;
> > +                     }
> > +                     shid->power_state =3D HIDSPI_ON;
> > +                     reinit_completion(&shid->reset_done);
> > +                     error =3D shid->ops->deassert_reset(shid->ops);
> > +                     if (error)
> > +                             dev_err(dev, "%s: failed to deassert rese=
t: %d\n",
> > +                                     __func__, error);
> > +                     else
> > +                             was_reset =3D true;
> > +             }
> > +     }
>
> [Severity: High]
> What happens in spi_hid_resume() if shid->ops->deassert_reset(shid->ops)
> fails (or if was_reset is true while shid->hid is still NULL and the rese=
t
> times out)?
>
> When deassert_reset() fails in spi_hid_error_handler(), the driver sets
> SPI_HID_ERROR and schedules shid->reset_work because a device held in res=
et
> will not assert a reset-response IRQ:
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_error_handler() {
>         ...
>         error =3D shid->ops->deassert_reset(shid->ops);
>         if (error) {
>                 dev_err(dev, "failed to deassert reset: %d\n", error);
>                 set_bit(SPI_HID_ERROR, &shid->flags);
>                 schedule_work(&shid->reset_work);
>         }
> }
>
> In spi_hid_resume(), however, a deassert_reset() failure only logs the er=
ror
> and leaves was_reset false. Because spi_hid_suspend() cleared SPI_HID_REA=
DY,
> SPI_HID_RESET_RESPONSE, SPI_HID_CREATE_DEVICE, and SPI_HID_ERROR before
> powering down, shid->reset_work is not scheduled, spi_hid_wait_for_reset(=
) is
> skipped, and spi_hid_resume() returns 0 when !test_bit(SPI_HID_READY,
> &shid->flags).
>
> Similarly, because spi_hid_wait_for_reset() is gated inside if (shid->hid=
), if
> shid->hid was not yet created before suspend and the post-resume reset ti=
mes
> out, nothing sets SPI_HID_ERROR or schedules shid->reset_work.
>
> Could this leave the device permanently held in reset with its regulator
> enabled in HIDSPI_ON and no recovery work queued?

No. The next suspend powers the device down and the following resume
retries the reset.

>
> > +
> > +     enable_irq(shid->spi->irq);
> > +
> > +     /*
> > +      * For devices that may wake up, process work that was pending wh=
ile
> > +      * suspend had reset_work disabled. Otherwise suspend already dro=
pped it.
> > +      */
> > +     if (test_bit(SPI_HID_RESET_RESPONSE, &shid->flags) ||
> > +         test_bit(SPI_HID_CREATE_DEVICE, &shid->flags) ||
> > +         test_bit(SPI_HID_ERROR, &shid->flags))
> > +             schedule_work(&shid->reset_work);
> > +
> > +     if (shid->hid) {
> > +             if (was_reset && spi_hid_wait_for_reset(shid)) {
> > +                     /* No reset response: let recovery retry. */
> > +                     set_bit(SPI_HID_ERROR, &shid->flags);
> > +                     schedule_work(&shid->reset_work);
> > +                     return -ETIMEDOUT;
> > +             }
> > +             /* HID requests would fail while the device is not ready.=
 */
> > +             if (!test_bit(SPI_HID_READY, &shid->flags))
> > +                     return 0;
> > +             error =3D hid_driver_reset_resume(shid->hid);
> > +             if (error) {
> > +                     dev_err(dev, "%s: failed to reset resume hid driv=
er: %d\n",
> > +                             __func__, error);
> > +                     return error;
> > +             }
> > +     }
> > +     return 0;
> > +}
>
> [Severity: Medium]
> On the wakeup path (when device_may_wakeup(dev) is true and was_reset is
> false), how does hid_driver_reset_resume(shid->hid) interact with a pendi=
ng
> reset_work?
>
> When spi_hid_irq_error() sets SPI_HID_ERROR or spi_hid_process_input_repo=
rt()
> sets SPI_HID_RESET_RESPONSE in the IRQ thread, SPI_HID_READY is not clear=
ed
> immediately. Instead, SPI_HID_READY is cleared later when shid->reset_wor=
k
> runs spi_hid_error_handler() (which must first acquire shid->power_lock) =
or
> spi_hid_reset_response().
>
> Because spi_hid_resume() holds shid->power_lock across the entire functio=
n,
> scheduling shid->reset_work and immediately checking test_bit(SPI_HID_REA=
DY,
> &shid->flags) means:
>
> 1. If SPI_HID_ERROR or SPI_HID_RESET_RESPONSE was set while SPI_HID_READY=
 is
> still set, spi_hid_resume() sees SPI_HID_READY set and calls
> hid_driver_reset_resume(shid->hid) right before shid->reset_work runs and
> resets the device.
>
> 2. Conversely, if SPI_HID_READY was already cleared (for example, after a=
 sync
> request timeout or while SPI_HID_CREATE_DEVICE is pending), spi_hid_resum=
e()
> returns 0 early at !test_bit(SPI_HID_READY, &shid->flags). Once
> shid->reset_work later completes in spi_hid_refresh_device():
>
> drivers/hid/spi-hid/spi-hid-core.c:spi_hid_refresh_device() {
>         ...
>         /* Same report descriptor, so no need to create a new hid device.=
 */
>         if (new_crc32 =3D=3D shid->report_descriptor_crc32) {
>                 shid->reset_attempts =3D 0;
>                 set_bit(SPI_HID_READY, &shid->flags);
>                 return;
>         }
> }
>
> it sets SPI_HID_READY and returns without calling
> hid_driver_reset_resume(shid->hid), leaving the HID driver in the suspend=
ed
> state set by spi_hid_suspend().
>
> Should spi_hid_resume() coordinate with pending reset work on the wakeup =
path
> so hid_driver_reset_resume() runs after the reset completes?

This requires an error or reset response to be pending at resume on a
wakeup-enabled device. Waiting for reset_work here would need
restructuring resume, since reset_work also takes power_lock. Leaving
it as is for this series.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-send-ups=
tream-v7-0-abad13174b43@chromium.org?part=3D10
