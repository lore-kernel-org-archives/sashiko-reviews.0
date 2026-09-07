Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7635751D532
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801101; cv=none; b=qSPdInmNQVfQcvBOXuuaD+yRM878Je0X2HPwp5syYCj4kxFX5CTsahVNZkwEHD28FGyn0a6ERv8qkWtiSLAIBNzPI8O8fga6ldNrob+M3aqNcGXf0PK5ACCQMzcRizLFB9fwFfJdPlg2Xn+hwmywjiqk2rejXLqgqLE9PdWBTYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801101; c=relaxed/simple;
	bh=VPCes/pYY8bxUmk6YNQvuVtULoRfSEjW4LyQg/Ls+Uo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NDtKWHghFvqKMyBTgMmUxKJd9McEGM9lTZ14wKz7RktarXzvXStkf04jTYnPy5uq+yWECzwlTh82XRp84c9pqdNrtyC17j9gWOf62udLPSvF425JKL33nrGv06JcT/fG4ew2K0oFCLWMVpuNZGIfJPJjcPQs87flMAyDmdmIcQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gclspJaD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gclspJaD"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484362f5c4aso4743894f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788801097; x=1789405897; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qbDexYd6+PKsSzsVWnrFCCOHf6ko5It3bTklp8wNC0Y=;
        b=gclspJaD5O8Mzj95HS0hvEtGRYo9oWgDwinutBmEAXLl/z4+SlWO5NU7EQE6ZddX/h
         lMQ2F4jrjcLvSwr/ydAxPJ+IbAIHCz6sTXeFkvh4jtQaSh9iMBDc50+7gbl3GRg6cJvT
         zOqVQ4IPSfJ9kz8nHBxNz8kph1ujLMvbMuo/3fim48zuN6AoNlQuuR4cjN2Dw/GsJpks
         QofwoM66KgYOnyU0AT8r2AW2glSGja10jrFeeQFuH1TRAnzm4rmRqUHdMSWXbByb7Rlx
         1SXBjj2IjuYCXhW0cPqWws8cTmKVdOrwHOX0IRyHHExWcghsHfO+ZtwWqvyWa9BYqAB4
         lAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801097; x=1789405897;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbDexYd6+PKsSzsVWnrFCCOHf6ko5It3bTklp8wNC0Y=;
        b=VhghMYSz1SR2wqBRZoXRduuGXV4TOv3ZYiPCd3/gyIeNIOay9OiZB6y0/w5MYX8+VM
         /oZwg6jXvRdcNO36Q1kkK2kWMvxf7oxh1DhddagUVtxknKqh074skVEzzsQ5ZooIqZpe
         NCQ9o4XmNAgKmTCwamWEdGCsnjB11XYuopADk2YI60YURxa63/O8fZj3TdLpJijxdqTZ
         vAsYJgm2xuXes6egk+TxijlxCDSOOu+iHDogN5u31H/vh6OGSu7KBNjFKJtwq2N2fq/s
         PCuECFol52vx8jBRj/SiU+42j/PhijyQ2Xf8wqAo2ncDUO06wrTl9mVVAz4iW5atN5vX
         A7aQ==
X-Gm-Message-State: AFuF++llfJI2Q9oA2NP/RTCTc08ZmDCeXS972EXT4eXlnwD6lRNGLOPm
	zYWGupS3tufJUvGKRLzSa/M2HJNLf88Tos9+mVoY3w2o2HrYZ9wxwy3V3yMzUA==
X-Gm-Gg: AYBFou2CJ8+yWsVv5UnExso9drtgtJmZHN4ticwB795bF9B/3LO3dKILjvSdXF2samy
	ck8BgqBKoBeHwd5LfTSI4Woqc7h6o1gDtux2PzsGPDbSqaLGn1jdCtVxQjGFtKzzPDKv4xwESDx
	mBgrhenx3CVSMDWrlX6ZBO1F3KawoJ6/hk5cJYmpHJSsapfazPzfikp/3rvuQM3n0EBKD9VdQPy
	dFRLBTiSgNMc2IixnWociBKRinBotxesvILwf5vNLFVcF3yJkjOT8v7g4hlatiKQsRoAyklg4Km
	tPAw9YxKGdYFB3eGijaBwevhZ/SVHiqXiLPVThFuoNee6wX7s81Q4qkLJUvIn73tGUxuo3NvjJQ
	+wJa+16kjxMzvtY5ksbDh15/qblxJ4dX40uMltCeZiCbJI4HEmDp6hAjWGzR1jy0wJjnYVq5BdF
	8KgwQnVKVRO61J1BlgA4v7VjgTgMvhtx3p/HFFMbFqBpMCNrJGf93bw6VIJzrzgUQEMr2BMgy/0
	Q==
X-Received: by 2002:a05:600c:4f89:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49cf7f32d0amr374243735e9.0.1788801097274;
        Mon, 07 Sep 2026 10:11:37 -0700 (PDT)
Received: from localhost ([2001:4bb8:178:2f30:d3da:48f5:116c:5642])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm303360125e9.2.2026.09.07.10.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 10:11:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 19:11:34 +0200
Message-Id: <DL992E7Q18ZM.2PAM4UQKPJ1BQ@gmail.com>
Subject: Re: [PATCH v8 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <sashiko-reviews@lists.linux.dev>, <linux-iio@vger.kernel.org>
To: "Jonathan Cameron" <jic23@kernel.org>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260901-veml6031x00-v8-0-532cb4f2168a@gmail.com>
 <20260901-veml6031x00-v8-4-532cb4f2168a@gmail.com>
 <20260901132208.EE64C1F000E9@smtp.kernel.org>
 <DL49BADYC1U8.2N2F6YW5ZR5S2@gmail.com>
 <DL4X3IXEI8WK.OOFNRSU7FGRW@gmail.com>
 <20260907025826.414c570a@jic23-huawei>
In-Reply-To: <20260907025826.414c570a@jic23-huawei>

On Mon Sep 7, 2026 at 3:58 AM CEST, Jonathan Cameron wrote:
> On Wed, 02 Sep 2026 16:58:09 +0200
> "Javier Carrasco" <javier.carrasco.cruz@gmail.com> wrote:
>
>> On Tue Sep 1, 2026 at 10:19 PM CEST, Javier Carrasco wrote:
>> > On Tue Sep 1, 2026 at 3:22 PM CEST, sashiko-bot wrote:
>> >> Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
>> >> - [High] Use-After-Free of iio->pollfunc in IRQ handler during device=
 unbind or probe failure.
>> >> - [Medium] Unintended I2C read of configuration register when pushing=
 timestamp to buffer
>> >> - [Medium] The interrupt_users counter can permanently underflow duri=
ng error recovery, breaking hardware interrupt control.
>> >> --
>> >>
>> >> commit c87f3d48e1ee614fc184995b816c8f8679a6b774
>> >> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> >>
>> >> iio: light: veml6031x00: add support for events and trigger
>> >>
>> >> The device provides a shared interrupt line to notify events and data=
 ready.
>> >> Add support for configurations with and without an interrupt line, pr=
oviding
>> >> events and trigger support when an interrupt line is available.
>> >>
>> >>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/vem=
l6031x00.c
>> >>> index 3d5a27a0baaed..7bd7975eb1a76 100644
>> >>> --- a/drivers/iio/light/veml6031x00.c
>> >>> +++ b/drivers/iio/light/veml6031x00.c
>> >> [ ... ]
>> >>> +static int __veml6031x00_set_trigger_state(struct veml6031x00_data =
*data, bool state)
>> >>> +	__must_hold(&data->irq_lock)
>> >>> +{
>> >> [ ... ]
>> >>> +	data->trig_en =3D state;
>> >>> +
>> >>> +	return 0;
>> >>> +
>> >>> +clear_interrupt:
>> >>> +	veml6031x00_set_interrupt(data, !state);
>> >>> +
>> >>> +	return ret;
>> >>> +}
>> >>
>> >> [Severity: Medium]
>> >> Can data->interrupt_users permanently underflow here during error rec=
overy?
>> >>
>> >> If an I2C error occurs in __veml6031x00_set_trigger_state() while dis=
abling
>> >> the trigger, this error recovery path calls veml6031x00_set_interrupt=
() to
>> >> revert the counter, but fails to update the software state (data->tri=
g_en).
>> >>
>> >> If a subsequent successful disable happens later, the counter will be
>> >> decremented again, potentially underflowing to UINT_MAX and silently =
skipping
>> >> all future hardware writes.
>> >>
>> >> [ ... ]
>> >
>> > That is not true because the error path will *increment* the counter t=
o
>> > re-enable the IRQ and keept it consistent with data->trig_en. If an I2=
C
>> > operation fails, the trigger will stay enabled in the device registers=
,
>> > and therefore data-trig_en should stay enabled.
>> >
>> > I tested it by adding some hacks to force that situation, and what may
>> > actually happen is that if *on top* of that failure, the I2C operation
>> > in veml6031x00_set_interrupt() also fails, interrupt_users will be
>> > decremented (as it should, because the interrupt could not be
>> > re-enabled), and *then* a second call to disable the trigger will set
>> > interrupt_users to UINT_MAX.
>> >
>> > Although this is very unlikely, the fix seems to be trivial:
>> >
>> >  if (state) {
>> >  	data->interrupt_users++;
>> >  	if (data->interrupt_users > 1)
>> >  		return 0;
>> >  } else {
>> >  	+	if (!data->interrupt_users)
>> >  	+		return 0;
>> >
>> >  	data->interrupt_users--;
>> >  	if (data->interrupt_users > 0)
>> >  		return 0;
>> >  }
>> >
>> > Note that this fix is not a hack to just get rid of reaching UINT_MAX,=
 it
>> > reflects the fact that the previous failed operations lead to a disabl=
ed
>> > interrupt and an enabled trigger in the hardware, and there is no need
>> > to act on the interrupt again when trying to disable the trigger a
>> > second time.
>> >
>> > I will add it for V9 after testing it with some hacks to force that
>> > scenario.
>> >
>>
>> I am trying to reproduce that scenario with forced errors, and even if
>> those two errors happen during the first attempt to disable the trigger,
>> it's not really possible to reach interrupt_users =3D UINT_MAX.
>> The 'buffer/enable' attribute is set to 0 by the core even if
>> set_trigger_state() returns an error code, and the next time
>> 'buffer/enable' is set to 0, nothing really happens because
>> set_trigger_state() is not even called.
>
> I can't remember why we do that. Oh well. Seems it is useful here.
>

I instrumented some more code, including iio_trigger_attach/detach_poll_fun=
c()
and current_trigger_store(). When set_trigger_state(false) fails
(which I forced), iio_trigger_detach_poll_func() returns without releasing
the pollfunc IRQ from the trigger pool, but iio_disable_buffers()
continues disabling the buffer.

The next buffer enable adds another consumer to the pool without calling
set_trigger_state(true), since the trigger is already in use. The following
buffer disable removes that new consumer without calling set_trigger_state(=
false),
since there is still one consumer left in the pool.

So after the first failed disable, subsequent buffer enable/disable cycles =
do
not call set_trigger_state() and the original consumer remains in the pool.
That leaves the buffer/enable attribute in a meaningless state: it gets
updated from the userspace perspective, but nothing really happens behind
the scenes.

Is that intended? Maybe there are historical reasons for it, or maybe there
was no cleaner way to operate after an error in set_trigger_state(), or
maybe this should not work like that.

This is what it looks like after I instrumented the code:

# All good, the trigger was disabled, and now it gets enabled:
echo 1 > buffer/enable
[   50.590395] IIO trigger veml6031x00-drdy0: attach: before: pool users=3D=
0
[   50.596562] IIO trigger veml6031x00-drdy0: attach: pf->irq=3D188
[   50.602537] IIO trigger veml6031x00-drdy0: attach: after get_irq: pool u=
sers=3D1
[   50.622654] IIO trigger veml6031x00-drdy0: attach: set_trigger_state(1) =
returned 0

# Forced failure in veml6031x00_set_trigger_state(false):
echo 0 > buffer/enable
[   64.608971] IIO trigger veml6031x00-drdy0: detach: before: pool users=3D=
1
[   64.615267] IIO trigger veml6031x00-drdy0: detach: pf->irq=3D188
[   64.657138] IIO trigger veml6031x00-drdy0: detach: set_trigger_state(0) =
returned -13
[   64.664968] IIO trigger veml6031x00-drdy0: detach: callback failed: pool=
 users=3D1

# From now on, set_trigger_state() will not be called:
echo 1 > buffer/enable
[  104.047282] IIO trigger veml6031x00-drdy0: attach: before: pool users=3D=
1
[  104.053494] IIO trigger veml6031x00-drdy0: attach: pf->irq=3D189
[  104.059502] IIO trigger veml6031x00-drdy0: attach: after get_irq: pool u=
sers=3D2
[  104.067023] IIO trigger veml6031x00-drdy0: attach: NOT calling set_trigg=
er_state(1), notinuse=3D0

echo 0 > buffer/enable
[  117.354867] IIO trigger veml6031x00-drdy0: detach: before: pool users=3D=
2
[  117.361070] IIO trigger veml6031x00-drdy0: detach: pf->irq=3D189
[  117.366975] IIO trigger veml6031x00-drdy0: detach: NOT calling set_trigg=
er_state(0), no_other_users=3D0
[  117.376297] IIO trigger veml6031x00-drdy0: detach: after put_irq: pool u=
sers=3D1

Best regards,
Javier
