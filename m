Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795213632;
	b=A1ucT9vVmgZj7PdFI0Gmfrdn+lGd3YklLcqj1MB7UHEb6jD2P1TVJBmys8fq/S3KklcM
	 zhnSMth+oxw4yTUs8DjBiRuLmUayTvzM8NbFgi+a2pTM+BtplQefLkT9SpnDLPtQu1ho1
	 CT5TldHguWFAoMW0OL47hClYrNMxbzXjZMpnYWzI7L8JSTtMWb2IEf/y1jbYlnBVOuh0n
	 PYnZDrvIy590a8PlLXgPEQzo8qDE44amnA2gliEuN6vUJwWhSCdJVFBi4KIfe3l305Vuy
	 kA+EoZPNyVe/mm+r299DqcAZFjh/+ovQiMO6BLHk7zIjNvwa493/5Qm2ZywatxheH9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=sJC40Ryd2PolMbpdkwtiGQ16pRLfcNP+ySmcSLjXvR8=;
	b=MNp6Tp/StMZeSnsIrf30tvJ0PcTVrAgerWC7v/cvxf6zHw4yqvT+BBiILrpsbn4Psq8N
	 jWI2qDrVw+xjwDP3IqMZEMuuzwLndY0An4KzrcnarNzzn97pKG+R2cSKuljgZDs/Upg5s
	 Wl5lCiyOhSBqix9tekg523D2c5es1Q9HywRjqQumY6D53Z1nmAtXhFMSC7evnhSa2JdXw
	 J9x7acD6Ho4nn9sVKmdfvI0Ml2PMknsidrIPIVMcbrwC+TNHBpHu0XbfxpgMBUw+KPoFa
	 dre9eLf0pXjGnBTw06R9OL190dn8zbRnI7P4Pir5IMgGXtCkOYj/W13qeIsbxt0as5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rdmb8P0I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E73606A6B6
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 22:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E73606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rdmb8P0I
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso2249413d50.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 14:27:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795213630; cv=none;
        d=google.com; s=arc-20260327;
        b=lGZT+p/0CiwxAZm9RAs8woPhxHG3OFlKxAiR1gEeUgV6Ml2LmYl1UioEbdAtlR0Bg+
         jFzzaWY33wcNRDwEurG0LjExrZpRp7MwhdLAHImbN6uJSbnwiz1ne0FVyZB4uqJOO1jg
         UDTaDb3EIPwEnVNd8uSvmwlYovAqF4Syb1TSOBUnwm6npvYEYqkO+yWLbXaHLV6KqxWZ
         9gc9I4Q6ZwTl40W4ihLCOlwzMKQeynfrGH+4oU9ArbVT1V/W/ErS26BcBg1G0X/VvJx2
         nl62pfxyS1RofXfwm8w7dlw1dNF9K44dnvy6ZhJN0qmBfA90vXZQbKFDO3v6qO28GL8T
         zvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sJC40Ryd2PolMbpdkwtiGQ16pRLfcNP+ySmcSLjXvR8=;
        fh=osfj9leewLfc4MqIYaUjfG4KfpRUNqFnByXZRUnRoVs=;
        b=APYHt009K4r005QriAAcIUYdsrI10DXzaevaGUSNP5F+ji/S0YHDCzwT/tr4DDuWum
         osWWliB9+YTWvJOBeMAtXloGWP/fqixPbKZY+j4vzw7AzTHvJbZzZIBszindUBN+gwY3
         1x5vdhdyPTVXVly5pF0OsuQhBEFleBk1B0XzZnRkk1XobSE/tH3dEn04GDEo15sLPxlp
         9F+tH+fAWDohIbSxbIHWqtwC10e3c/wAO7reGDWQK7dWn5T7AL5gs+cC657poPps/ix5
         kgq2HkQVcHC4VbnJemSonSTwpciF5KNvChTPlIM2Fw1sfaHbxVDYo33y3boTm6Lud/D2
         XpdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795213630; x=1795818430; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJC40Ryd2PolMbpdkwtiGQ16pRLfcNP+ySmcSLjXvR8=;
        b=Rdmb8P0Ix4MWPdGhppW3G4SqsyhDap4GI5EqCPEM3qIwpj4BAtgzNcb+FbeVH7miE/
         WUzD7t20f9x98CEgYhWHaD3RTF6mJ0ppw7ZwUwz+ftdNsvzsKUsoUj/mHZJVegsTzOIY
         U4WOFZszrvnw+94K/16cd0YSr8tiozbHEGxNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213630; x=1795818430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJC40Ryd2PolMbpdkwtiGQ16pRLfcNP+ySmcSLjXvR8=;
        b=ot8EOeVK6IBWMC2Ria/enyaz5CCoOODWtEpleBzfdLrmdG6G7IHq7SrLEkMQI4XuBW
         6Qyc583nWn2GNkYe8w8sA+FedQYKGHqL4zT2h68KYPxvhxtSMIXw4IBIOYsLYzeF/Sg7
         b9e+Sg6iZGhjbR7GOrTNcAofb9mnrQNPLuzRLPwuL1vYE9TxV48cKjepJBvHudGb2UPp
         jlpRCjqWMKUrfmGfbHFKuxPQ7ERapS9GzA5Cexe7mRVcVznssWbO6+4y8MFlsg9m5C7E
         GtrV2EGXA4mgfTpEzyaowEBmIvBiJOUlU51h+QFdli8BVIG6z/i7nc2CF56RnBdl7DHD
         BrxQ==
X-Gm-Message-State: APuU4Z8XT5QkPwzuaYKLDQBxoWQmLvD0vxFGGamfn0jqKqoaZAkcsEjr
	VQLokXf8LorLuYj6JpjFXhiQ0xjghzFnljUUVosVk/Mtaducdh/aZaip+DHT5Cg/LtGB7FXdwO0
	bjhgoR9SA1XylZZe4N/e0qjSHoLF929xAHqJauWBxbP/x3mPB5X13pg==
X-Gm-Gg: AZFdTZd7JSLSe2k6MsVA+8clyquJOFMiCb4dyq2iMBvsdHpEqHtUayGJluXar3agTRF
	h8md4D48AInhqK0Wn5HmNKcPw1duEbRVtJ5SIf+W8+SfNUjw9lfHu+UTWokPt/iDGQkV5eJuQ2b
	jbJ/FafGB34fxEBSO1N8KaArkgmavpP+2ozm7FpQxYl4WUeYz2T90hQsRMzU0aS21orgh6pc2GH
	QZLG69Db7nEUarvRxEH1XVPb5wYNG2Cx0qaUsyuW1UE6u0kN9zcFfVR9lDowfRQ9//YkAZSNusY
	9dBhXmSpSC5Qhk+TpdkiFDU20rBBvMsfanFpiISPbHkKw7adVYBY/C1JKSGZBncl1uabWMh1Kv7
	05FWFPPzzlqnHmSpW7zSyGCoKAUrHg6jCcEaZDZChpBDQ60Mysq7vskTVD36MDIUkqrE=
X-Received: by 2002:a05:690e:e87:b0:677:c90f:46bf with SMTP id
 956f58d0204a3-67dec4202b0mr2356631d50.17.1795213629927; Fri, 20 Nov 2026
 14:27:09 -0800 (PST)
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
 <20261024-send-upstream-v7-5-abad13174b43@chromium.org> <sashiko-outbox-183485@kernel.org>
In-Reply-To: <sashiko-outbox-183485@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 14:26:58 -0800
X-Gm-Features: Aa3M54qZWOnlCO2Ri2HHPaWV1QD3dKmEZ7zroVjs3jsWx80nUbk_TphKVz5rLYk
Message-ID: <CAEe3GZH-+M+PJpSm7ML5AEbcz9Ti+EoFJhi7+L-=PK3L6+770w@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] HID: spi-hid: add HID SPI protocol implementation
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 6:13=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] HID: spi-hid: spi_hid_reset_work() runs pre-error work before =
SPI_HID_ERROR
> - [Medium] HID: spi-hid: sync requests not aborted or serialized on reset=
 in error path
> - [Medium] HID: spi-hid: duplicate reset scheduled on timeout in spi_hid_=
get_request()
> --
>
> commit 921e27cc043191cc71704b14d2cdca05f5da7a1c
> Author: Jingyuan Liang <jingyliang@chromium.org>
>
> HID: spi-hid: add HID SPI protocol implementation
>
> This commit implements the HID over SPI protocol in spi-hid-core.c,
> adding interrupt handling, input report processing, synchronous output
> request/response tracking, and error recovery via device reset.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > index 54c278ac8803b..cd4d763840098 100644
> > --- a/drivers/hid/spi-hid/spi-hid-core.c
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> [ ... ]
> > @@ -172,17 +333,96 @@ static const char *spi_hid_power_mode_string(enum=
 hidspi_power_state power_state
> [ ... ]
> > +static void spi_hid_error_handler(struct spi_hid *shid)
> > +{
> > +     struct device *dev =3D &shid->spi->dev;
> > +     int error;
> > +
> > +     guard(mutex)(&shid->power_lock);
> > +     if (shid->power_state =3D=3D HIDSPI_OFF)
> > +             return;
> > +
> > +     disable_irq(shid->spi->irq);
> > +
> > +     if (shid->reset_attempts++ >=3D SPI_HID_MAX_RESET_ATTEMPTS) {
> > +             dev_err(dev, "unresponsive device, aborting\n");
> > +             spi_hid_stop_hid(shid);
> > +             shid->ops->assert_reset(shid->ops);
> > +             error =3D shid->ops->power_down(shid->ops);
> > +             if (error)
> > +                     dev_err(dev, "failed to disable regulator: %d\n",=
 error);
> > +             shid->power_state =3D HIDSPI_OFF;
> > +             /* Dead device: leave the IRQ permanently disabled. */
> > +             return;
> > +     }
> > +
> > +     clear_bit(SPI_HID_READY, &shid->flags);
> > +     set_bit(SPI_HID_RESET_PENDING, &shid->flags);
> > +
> > +     shid->ops->assert_reset(shid->ops);
> > +
> > +     shid->power_state =3D HIDSPI_OFF;
> > +
> > +     /*
> > +      * We want to cancel pending reset work as the device is being re=
set
> > +      * to recover from an error. cancel_work_sync will put us in a de=
adlock
> > +      * because this function is scheduled in 'reset_work' and we shou=
ld
> > +      * avoid waiting for itself.
> > +      */
> > +     cancel_work(&shid->reset_work);
> > +
> > +     /* Drop work requested before this reset. */
> > +     clear_bit(SPI_HID_RESET_RESPONSE, &shid->flags);
> > +     clear_bit(SPI_HID_CREATE_DEVICE, &shid->flags);
> > +     clear_bit(SPI_HID_ERROR, &shid->flags);
> > +
> > +     shid->ops->sleep_minimal_reset_delay(shid->ops);
> > +
> > +     shid->power_state =3D HIDSPI_ON;
> > +
> > +     shid->ops->deassert_reset(shid->ops);
> > +
> > +     enable_irq(shid->spi->irq);
> > +}
>
> [Severity: Medium]
> What happens if a synchronous request is waiting on shid->output_done in
> __spi_hid_sync_request() while an interrupt error in spi_hid_dev_irq() ->
> spi_hid_irq_error() or a spontaneous RESET_RESPONSE in
> spi_hid_process_input_report() triggers a reset?
>
> In __spi_hid_sync_request(), the caller holds shid->output_lock while
> waiting in wait_for_completion_timeout(&shid->output_done, ...). However,
> spi_hid_error_handler() only acquires shid->power_lock: it does not
> serialize with shid->output_lock or shid->io_lock, nor does it clear
> shid->expected_response or complete shid->output_done to abort an in-flig=
ht
> request.
>
> Because of this:
> 1. A thread in __spi_hid_send_output_report() that already passed the
>    test_bit(SPI_HID_READY, &shid->flags) check before acquiring
>    shid->io_lock can perform spi_hid_output() on the SPI bus while
>    spi_hid_error_handler() has asserted reset and set shid->power_state t=
o
>    HIDSPI_OFF.
> 2. When the device finishes resetting and sends RESET_RESPONSE,
>    spi_hid_reset_response() -> spi_hid_sync_request() blocks on
>    shid->output_lock until the pre-reset waiter's 1000 ms timeout expires=
.
> 3. Once wait_for_completion_timeout() in __spi_hid_sync_request() finally
>    times out, the pre-reset caller sets SPI_HID_ERROR and schedules
>    shid->reset_work again, triggering a second hardware reset after the
>    first recovery completes and incrementing shid->reset_attempts a secon=
d
>    time.
>
> Should the error and reset paths abort any in-flight request (or serializ=
e
> with shid->output_lock / shid->io_lock) so that pre-reset waiters do not
> stall recovery and schedule a stale reset on timeout?

The pending waiter times out and triggers one more reset, after which
the device recovers. I'll keep the current locking here.

>
> [ ... ]
> > @@ -324,13 +752,206 @@ static int spi_hid_create_device(struct spi_hid =
*shid)
> [ ... ]
> > +static void spi_hid_reset_work(struct work_struct *work)
> > +{
> > +     struct spi_hid *shid =3D
> > +             container_of(work, struct spi_hid, reset_work);
> > +     struct device *dev =3D &shid->spi->dev;
> > +     int error =3D 0;
> > +     bool resched =3D false;
> > +
> > +     if (test_and_clear_bit(SPI_HID_RESET_RESPONSE, &shid->flags)) {
> > +             spi_hid_reset_response(shid);
> > +             resched =3D true;
> > +     } else if (test_and_clear_bit(SPI_HID_CREATE_DEVICE, &shid->flags=
)) {
> > +             guard(mutex)(&shid->power_lock);
> > +             if (shid->power_state !=3D HIDSPI_OFF) {
> > +                     if (!shid->hid) {
> > +                             error =3D spi_hid_create_device(shid);
> > +                             if (error) {
> > +                                     dev_err(dev, "%s: Failed to creat=
e hid device: %d\n",
> > +                                             __func__, error);
> > +                             }
> > +                     } else {
> > +                             spi_hid_refresh_device(shid);
> > +                     }
> > +             } else {
> > +                     dev_err(dev, "%s: Powered off, returning\n", __fu=
nc__);
> > +             }
> > +             resched =3D true;
> > +     } else if (test_and_clear_bit(SPI_HID_ERROR, &shid->flags)) {
> > +             spi_hid_error_handler(shid);
> > +     }
>
> [Severity: Medium]
> Should spi_hid_reset_work() check SPI_HID_ERROR before
> SPI_HID_RESET_RESPONSE and SPI_HID_CREATE_DEVICE?
>
> In spi_hid_error_handler(), the code clears SPI_HID_RESET_RESPONSE and
> SPI_HID_CREATE_DEVICE with the comment:
>
>         /* Drop work requested before this reset. */
>         clear_bit(SPI_HID_RESET_RESPONSE, &shid->flags);
>         clear_bit(SPI_HID_CREATE_DEVICE, &shid->flags);
>         clear_bit(SPI_HID_ERROR, &shid->flags);
>
> However, because spi_hid_error_handler() is only called from the final
> else-if branch in spi_hid_reset_work(), it cannot run while
> SPI_HID_RESET_RESPONSE or SPI_HID_CREATE_DEVICE is set. If an error sets
> SPI_HID_ERROR while either of those bits is pending (for example, an IRQ
> error in spi_hid_dev_irq() -> spi_hid_irq_error() after
> spi_hid_dev_desc_response() sets SPI_HID_CREATE_DEVICE),
> spi_hid_reset_work() will first execute spi_hid_reset_response() or
> spi_hid_create_device() / spi_hid_refresh_device(), reschedule itself, an=
d
> only then run spi_hid_error_handler() to immediately reset the newly
> created or refreshed HID device.

This results in one extra descriptor request before the reset. The
HID device is kept since the report descriptor CRC is unchanged.

>
> [ ... ]
> > @@ -355,6 +976,15 @@ static int spi_hid_get_request(struct spi_hid *shi=
d, u8 content_id,
> >               dev_err(dev,
> >                       "Expected get request response not received! Erro=
r %d\n",
> >                       error);
> > +             /*
> > +              * -ENODEV: the device is not ready (e.g. a reset is in
> > +              * progress), so the GET_FEATURE request was not sent.
> > +              * Don't start another reset on top of the one already ru=
nning.
> > +              */
> > +             if (error !=3D -ENODEV) {
> > +                     set_bit(SPI_HID_ERROR, &shid->flags);
> > +                     schedule_work(&shid->reset_work);
> > +             }
> >               return error;
> >       }
>
> [Severity: Medium]
> Won't a timed-out request in spi_hid_get_request() schedule a duplicate
> reset?
>
> When __spi_hid_sync_request() times out waiting on shid->output_done, it
> already sets SPI_HID_ERROR and schedules shid->reset_work before returnin=
g
> -ETIMEDOUT:
>
>         dev_err(dev, "Response timed out\n");
>         /* The device may still answer later: resync it with a reset. */
>         set_bit(SPI_HID_ERROR, &shid->flags);
>         schedule_work(&shid->reset_work);
>         return -ETIMEDOUT;
>
> Because spi_hid_reset_work() -> spi_hid_error_handler() does not take
> shid->output_lock, the worker thread on another CPU can immediately begin
> running spi_hid_reset_work() and clear SPI_HID_ERROR while
> spi_hid_get_request() (and similarly spi_hid_report_descriptor_request()
> and spi_hid_reset_response()) receives -ETIMEDOUT and sets SPI_HID_ERROR
> and schedules shid->reset_work a second time. This triggers two
> back-to-back hardware resets and increments shid->reset_attempts twice fo=
r
> a single timeout.

__spi_hid_sync_request() already schedules the reset on timeout, so
the second set_bit()/schedule_work() is a no-op while the work is
pending.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-send-ups=
tream-v7-0-abad13174b43@chromium.org?part=3D5
