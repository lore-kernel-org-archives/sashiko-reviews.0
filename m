Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4D02737FC
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301867; cv=none; b=kU6ZH0ejaFFcIp785srVLa1fTO3ikXcC3MEqwfRuQ+UXUAg6S0omqG59/MW8lWZsQ5uSV0jA2Cmt419EI/WFXVZgPd98rZewCvo0TLQ9V1Iw56gXDrbNAtjBFzrxgYLps1KEX74w81LLCjUkO9BxJs0RxTWkPKhVpE2aJ6caeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301867; c=relaxed/simple;
	bh=Y9LL0Fu/tpANm8Xxd2LmShhq+R1OwHzE9TQi+rjTl1I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=OZLxBBpj1BwELiqhU/Y6fCKVgHTSu92o3an8Ju8P1wn5HC5yDEp9JxvWu/fyR4agltGEl693k0Iov+4v/cp5YC+/Vsl+G14+2HfsuowXFmwDM7fI2uDJkj+s8+n4Lpq6Df0daWIUV05TtCrw4MXJwX4glfpkX2hmYattc1rrtsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iu5+V2aA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu5+V2aA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48431648f33so1405687f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789301864; x=1789906664; darn=lists.linux.dev;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CkWo/t05zG04R8wfKifju0BHa5+PGuWZoa8LbZvniFY=;
        b=iu5+V2aAQKmQYEsXtx9ZLaGhisF7MIFGYViZRtlUBelZcFuV8qjDQFy0VTYlA5G/rY
         lMxDIiw6N22UCwvizrIKmK1R+lzdZpmNQMO/80PAfRPveUJK7MmalRLuLuoA8iiyqFMW
         3Mf1cWZBBhRzMXDUSHMjjfk7PfOm6qro5dxmQ/sVlatWDgwjHDe2W1afBW1bEm5m5o4i
         y/lwKw64JOqs2n3ruY9jVWc5z5rMG3RggVwPVNZZJH8cyaPe9kbMFjW2j3Ru7aqvMfZL
         PljoE5QyDNF3u2CkX/iKmKcfdQD0mVOwZxJHfSLMxb3Ap1cuRb/ncgJqP15mUv7m2QHD
         gGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789301864; x=1789906664;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CkWo/t05zG04R8wfKifju0BHa5+PGuWZoa8LbZvniFY=;
        b=lugMR4YXx82nBO/AnQp8WhYzakHVSQz+D5y53k+NMy7rcrTFKZderDdeUSDjNVpS6H
         vobvc3vtIQE+YLBPkb49twigeISH27KKYw76gmsOq8lHA57Cn4HPv1ZNoFFaoOJjz9EX
         mnq8ZqtCWk76m36hKLrZN7hp2vTgMZJKeJbqfGSB8NUUk4HR6SUIN4NixJFqZBZjhiI3
         iUxV987GzygfDiGGVWl+sQQIiq2od8bTMq+FXw3Q6HvYXPPhlRsRwqQQmvfFi6ShUwPS
         DfcTQ43cbsRkULM5wqoU6tD3oeefwk4awFz6+Do+eyb+qcnWnSC28lV6+kq6m5zEGAuJ
         /4Iw==
X-Gm-Message-State: AFuF++nzDqErwoAEHLc4kY5wR5H4Yh5ArIiTvzbXDyzXH1vmHrAeiFQG
	RsKYMthP1tCGmPEkmjQN7vcdN0dj/Ch3a08ZsKkm7qg3M5EnRwiuR7go
X-Gm-Gg: AYBFou04/8wBWlE0OaipgobhA4fKgdPZAyi2vSow94arxpewZVNCQRgfGM6UGpvALiB
	ITbszfuTGeLCwJNIsClG1fmpUvRJTFfsMQq9DLKkO/Nha9Rc+qO8HCoIoOkypFUj87keFadT3tf
	752Rin02GeVCpBj6U7wiqgpWFcoS6pJZ3BRq1nAAXhEao0419hvnSJlQaDWKNepAiIZtbcTQUQS
	k7VCm+V1ZDDf/0ZwXBwoRTPTCsaOqXg9M0/8pI9mLJSmdNBRT0ThO2WHJnN/5TOktOL82P+l3yJ
	mg7vWwbURFs/jSshBlzTaWhUVdAGqnairT7Lmpao56ruVp7EnulBK8fIGZkXHHcCdI5d5yeHRXc
	MAGo8Mh5eiLtJr34iR4Yn66lgO3rmrInkoi1lMrXWbmxJCaBjIrMIlsRSpID3as4KojdxG3qz2t
	mSTOTfWPaCIKONV6YKYG549Fs4Z09m/7f5Ly3pkEtSv2I8Zj+Xrqz7wS5sViQLGPYDAQQjjEauj
	WQwHVfen4wkDQ==
X-Received: by 2002:a05:6000:29d2:b0:486:fdd9:a0d9 with SMTP id ffacd0b85a97d-486fdd9a116mr1270200f8f.20.1789301863853;
        Sun, 13 Sep 2026 05:17:43 -0700 (PDT)
Received: from localhost ([2001:4bb8:107:bfd1:de2c:7b4b:8652:b761])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm19634464f8f.32.2026.09.13.05.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 05:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 13 Sep 2026 14:17:41 +0200
Message-Id: <DLE6KNHW0RF1.3H6DFD1V3AYMQ@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v8 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <sashiko-reviews@lists.linux.dev>, <linux-iio@vger.kernel.org>
To: "Jonathan Cameron" <jic23@kernel.org>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260901-veml6031x00-v8-0-532cb4f2168a@gmail.com>
 <20260901-veml6031x00-v8-4-532cb4f2168a@gmail.com>
 <20260901132208.EE64C1F000E9@smtp.kernel.org>
 <DL49BADYC1U8.2N2F6YW5ZR5S2@gmail.com>
 <DL4X3IXEI8WK.OOFNRSU7FGRW@gmail.com>
 <20260907025826.414c570a@jic23-huawei>
 <DL992E7Q18ZM.2PAM4UQKPJ1BQ@gmail.com>
 <20260910035653.6b133652@jic23-hlaptop>
In-Reply-To: <20260910035653.6b133652@jic23-hlaptop>

On Thu Sep 10, 2026 at 4:56 AM CEST, Jonathan Cameron wrote:
> On Mon, 07 Sep 2026 19:11:34 +0200
> "Javier Carrasco" <javier.carrasco.cruz@gmail.com> wrote:
>
>> On Mon Sep 7, 2026 at 3:58 AM CEST, Jonathan Cameron wrote:
>> > On Wed, 02 Sep 2026 16:58:09 +0200
>> > "Javier Carrasco" <javier.carrasco.cruz@gmail.com> wrote:
>> >
>> >> On Tue Sep 1, 2026 at 10:19 PM CEST, Javier Carrasco wrote:
>> >> > On Tue Sep 1, 2026 at 3:22 PM CEST, sashiko-bot wrote:
>> >> >> Thank you for your contribution! Sashiko AI review found 3 potenti=
al issue(s) to consider:
>> >> >> - [High] Use-After-Free of iio->pollfunc in IRQ handler during dev=
ice unbind or probe failure.
>> >> >> - [Medium] Unintended I2C read of configuration register when push=
ing timestamp to buffer
>> >> >> - [Medium] The interrupt_users counter can permanently underflow d=
uring error recovery, breaking hardware interrupt control.
>> >> >> --
>> >> >>
>> >> >> commit c87f3d48e1ee614fc184995b816c8f8679a6b774
>> >> >> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> >> >>
>> >> >> iio: light: veml6031x00: add support for events and trigger
>> >> >>
>> >> >> The device provides a shared interrupt line to notify events and d=
ata ready.
>> >> >> Add support for configurations with and without an interrupt line,=
 providing
>> >> >> events and trigger support when an interrupt line is available.
>> >> >>
>> >> >>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/=
veml6031x00.c
>> >> >>> index 3d5a27a0baaed..7bd7975eb1a76 100644
>> >> >>> --- a/drivers/iio/light/veml6031x00.c
>> >> >>> +++ b/drivers/iio/light/veml6031x00.c
>> >> >> [ ... ]
>> >> >>> +static int __veml6031x00_set_trigger_state(struct veml6031x00_da=
ta *data, bool state)
>> >> >>> +	__must_hold(&data->irq_lock)
>> >> >>> +{
>> >> >> [ ... ]
>> >> >>> +	data->trig_en =3D state;
>> >> >>> +
>> >> >>> +	return 0;
>> >> >>> +
>> >> >>> +clear_interrupt:
>> >> >>> +	veml6031x00_set_interrupt(data, !state);
>> >> >>> +
>> >> >>> +	return ret;
>> >> >>> +}
>> >> >>
>> >> >> [Severity: Medium]
>> >> >> Can data->interrupt_users permanently underflow here during error =
recovery?
>> >> >>
>> >> >> If an I2C error occurs in __veml6031x00_set_trigger_state() while =
disabling
>> >> >> the trigger, this error recovery path calls veml6031x00_set_interr=
upt() to
>> >> >> revert the counter, but fails to update the software state (data->=
trig_en).
>> >> >>
>> >> >> If a subsequent successful disable happens later, the counter will=
 be
>> >> >> decremented again, potentially underflowing to UINT_MAX and silent=
ly skipping
>> >> >> all future hardware writes.
>> >> >>
>> >> >> [ ... ]
>> >> >
>> >> > That is not true because the error path will *increment* the counte=
r to
>> >> > re-enable the IRQ and keept it consistent with data->trig_en. If an=
 I2C
>> >> > operation fails, the trigger will stay enabled in the device regist=
ers,
>> >> > and therefore data-trig_en should stay enabled.
>> >> >
>> >> > I tested it by adding some hacks to force that situation, and what =
may
>> >> > actually happen is that if *on top* of that failure, the I2C operat=
ion
>> >> > in veml6031x00_set_interrupt() also fails, interrupt_users will be
>> >> > decremented (as it should, because the interrupt could not be
>> >> > re-enabled), and *then* a second call to disable the trigger will s=
et
>> >> > interrupt_users to UINT_MAX.
>> >> >
>> >> > Although this is very unlikely, the fix seems to be trivial:
>> >> >
>> >> >  if (state) {
>> >> >  	data->interrupt_users++;
>> >> >  	if (data->interrupt_users > 1)
>> >> >  		return 0;
>> >> >  } else {
>> >> >  	+	if (!data->interrupt_users)
>> >> >  	+		return 0;
>> >> >
>> >> >  	data->interrupt_users--;
>> >> >  	if (data->interrupt_users > 0)
>> >> >  		return 0;
>> >> >  }
>> >> >
>> >> > Note that this fix is not a hack to just get rid of reaching UINT_M=
AX, it
>> >> > reflects the fact that the previous failed operations lead to a dis=
abled
>> >> > interrupt and an enabled trigger in the hardware, and there is no n=
eed
>> >> > to act on the interrupt again when trying to disable the trigger a
>> >> > second time.
>> >> >
>> >> > I will add it for V9 after testing it with some hacks to force that
>> >> > scenario.
>> >> >
>> >>
>> >> I am trying to reproduce that scenario with forced errors, and even i=
f
>> >> those two errors happen during the first attempt to disable the trigg=
er,
>> >> it's not really possible to reach interrupt_users =3D UINT_MAX.
>> >> The 'buffer/enable' attribute is set to 0 by the core even if
>> >> set_trigger_state() returns an error code, and the next time
>> >> 'buffer/enable' is set to 0, nothing really happens because
>> >> set_trigger_state() is not even called.
>> >
>> > I can't remember why we do that. Oh well. Seems it is useful here.
>> >
>>
>> I instrumented some more code, including iio_trigger_attach/detach_poll_=
func()
>> and current_trigger_store(). When set_trigger_state(false) fails
>> (which I forced), iio_trigger_detach_poll_func() returns without releasi=
ng
>> the pollfunc IRQ from the trigger pool, but iio_disable_buffers()
>> continues disabling the buffer.
>>
>> The next buffer enable adds another consumer to the pool without calling
>> set_trigger_state(true), since the trigger is already in use. The follow=
ing
>> buffer disable removes that new consumer without calling set_trigger_sta=
te(false),
>> since there is still one consumer left in the pool.
>
> So do you get two hits on each trigger? Definitely bad as they can be in =
threads
> running at the same time and we assume that doesn't happen in most driver=
s.
>
>>
>> So after the first failed disable, subsequent buffer enable/disable cycl=
es do
>> not call set_trigger_state() and the original consumer remains in the po=
ol.
>> That leaves the buffer/enable attribute in a meaningless state: it gets
>> updated from the userspace perspective, but nothing really happens behin=
d
>> the scenes.
>>
>> Is that intended? Maybe there are historical reasons for it, or maybe th=
ere
>> was no cleaner way to operate after an error in set_trigger_state(), or
>> maybe this should not work like that.
>
> I'd go with "probably not the intended result" as if it were I 'think'
> I'd have left a comment.
>
> That's not to say I have an immediate answer to how to resolve it.
> If you still have your test set up, can you try just carrying on and
> not returning after the set_trigger_state(trig, false) fails - making
> sure that your injected failure leaves the trigger actually enabled
> and still firing.  That might leave us in a recoverable state as
> next set_triggers_state(trig, true) should work as normal. In meantime
> we will have a bunch of irqs firing but resulting in nothing happening.
>
> Not great and may well leave some drivers stuck because they are
> tightly couple trigger / data readback and need that to happen to
> not get wedged.  Those should have the validate callbacks set but
> will still be stuck.  In theory we could make all triggers that
> have this property do a clear in the reenable but that is a bit
> nasty as we would probably want it conditional so each driver would
> need a 'have I already cleared this' flag set in their buffer
> read and cleared in the reenable.
>
> Thanks for digging into this btw!
>
> Jonathan
>

I still have my test set up, and I will get back to this once I am done
with the driver that triggered the issue. It looks like some action
should be taken if set_trigger_state() fails, but I need to invest more
time on this.

Best regards,
Javier
