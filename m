Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A84A8A06
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 14:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361101; cv=none; b=Z1/CuP1KwSq7tnzFXYPZT9+i04dmAiiK6qKORVLn+XpM5O9FSsndPXw8jDtU2XitbZcGyidW5fts/RLMQloENVa4ZkoHsiGYPorT9vRNv+itqrWxtB0MPrCHDIu9hxgQZDGBFDHI7EHHLXfSJ98jqhsEawzhlJ4lUA+tSDf0Sq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361101; c=relaxed/simple;
	bh=Ike3RXWaxfkiCBcUa9n8zGSdiMZUjyJh/tkpIiCsRQQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=CR1mGNIDEoT+K3jpqILZGsgfcpxvKxMpGdWU2oHkaDtie6urt5K4A8OrPibIoKUZsERsYihkxVJTt/+iJSnzvXxStrM666ZWgxQnGoSeroBSW+kM50gwHFngVvLNIte/AL0+pfCpCxxO2ZER56wzfSYg3ozADoRE0o8HmEmUALg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3siLPf1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3siLPf1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49954b88fffso8742515e9.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361097; x=1788965897; darn=lists.linux.dev;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ut6WTLtprFfdFmADZkEnMEMmA93KZj0r2cZvBQ9PeRQ=;
        b=E3siLPf1Cxi3Ygj+KwqA3ixf8lPE6bI1HcyMWCGW+sfBaR5JKGlU5f6tSHRHMqJ07k
         gsVDc2m0++bPTzh4g7zSQ7naYtfmqLUcMP726TvpuR4ny0Ip+zqDrwO2gxhR+BgDcSM0
         Q4RjbGSFJe5/koLjOrRBapNyW+SbrsoubQ1iP2s1igBKqWe0XjkvUGi/cw1IRifrGDYb
         hfv0A3yS5g0sQGKl40fkalNstMlyfjBZrds8o6679bUXb8Ou56pOPlfEF9fkSsigqXEY
         WWcY1UJ2WULn7XTz77tkStmuhstKOG9HeYcdFN/H3qbZh3LsqeYlrSMXAF4Dy5TJJnVm
         1TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361097; x=1788965897;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ut6WTLtprFfdFmADZkEnMEMmA93KZj0r2cZvBQ9PeRQ=;
        b=YnTV9KCL1DtP/4141lVawyznl//oGXYeqF/R2ztjb+Gc+czZZo3o8t+5lXaxa4mhPm
         IcK+EF2s+xWCdl9nbRjMRBpK7iW0m9q+VeUdUdw9kNACuwYRDtFya226z/rA20EXAjPm
         fn5j5NOCPooP8WVrnL9XiCiw3Yt3ZWFc39qNLvfc0jn2cTLmrI5s5CVn15OUMZ+yztEO
         1o4xvfInt1Gll9rQYmzGbuwFR4zFcdqgl0TelT4TaXDa+IxBxLgWKyABAKcxRBUVNAGY
         dYsTaIEFea4EK/zweRLaIoEgZ9dAc4ICug0SMhO7nsng0ELYO2emh0xuY9aTsGr4XUDk
         xRzQ==
X-Forwarded-Encrypted: i=1; AKwUvBznAvH2FJYYBWDawB72pVtAovgpshhb/v8eTlR4yQYtMjJogos96nZF2CePt2KQX3LFusO7ti7ZKTVjrocoFaE=@lists.linux.dev
X-Gm-Message-State: AFuF++n3seU3qfXzRCRuImfhbxZSwj1/xNjGuC6KyD+X81ChErPlldBX
	EEJO+diiFMnaBa6HpH0lcm2zOtfgRtqdrhfWyFtxRgaRBNFXfJSv+Y72zCCYow==
X-Gm-Gg: AR+sD11V8ILX88K4pI86SCOPc7uylYtWwi3ADG2fQnDyfFK/RVAYVAaHLgJ72f3jTv4
	N3iQYQmM/x7ZOMz7HdJkVigz9qjP3lffGyqqE4FBllj8qIPX2SjPeADjyDKVw/wCSs35FV/GPBX
	igRvuq51YaOaBOC2D4nmQZ43RVZJWkqrBPHx17EcJnEUyb76eIdnG0D3m8t3TJ39W8xz0oWqKeZ
	LNOmdY1D8N2D913CWmF24CNFex2pK4zO4wpL7S0rzA4hjHQcAd5JV06S+Fpis7rRGs9azDCV0K/
	frCOfo8fT0RF8/0phQZFo6gcgPEsuvuprz/YlsXIK1VNKN83MGCxIaFCJuoVILor0Noh7tSBp7U
	84qxb1E57KSr8urGTLJzC/BIf/nK3ibggsiTeTsGNplAxMXgFRmOGUKbJyJKnvmqGAZBom7x7t7
	MxExrUFrzihQB10Gi0py+3hqVf0XUDK1RGeQFOTrKr0DCpUmbLF6uPVpqQpSlQ1cJYw/8BXC37/
	WzLKqt3h6Nm
X-Received: by 2002:a05:600d:4:b0:49c:e9c1:25ca with SMTP id 5b1f17b1804b1-49ce9c12778mr51716185e9.3.1788361096158;
        Wed, 02 Sep 2026 07:58:16 -0700 (PDT)
Received: from localhost ([2001:4bb8:16d:f647:c3b0:727e:b1fd:6610])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b425sm154136445e9.1.2026.09.02.07.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 16:58:09 +0200
Message-Id: <DL4X3IXEI8WK.OOFNRSU7FGRW@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH v8 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <linux-iio@vger.kernel.org>
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 <sashiko-reviews@lists.linux.dev>, "Jonathan Cameron" <jic23@kernel.org>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260901-veml6031x00-v8-0-532cb4f2168a@gmail.com>
 <20260901-veml6031x00-v8-4-532cb4f2168a@gmail.com>
 <20260901132208.EE64C1F000E9@smtp.kernel.org>
 <DL49BADYC1U8.2N2F6YW5ZR5S2@gmail.com>
In-Reply-To: <DL49BADYC1U8.2N2F6YW5ZR5S2@gmail.com>

On Tue Sep 1, 2026 at 10:19 PM CEST, Javier Carrasco wrote:
> On Tue Sep 1, 2026 at 3:22 PM CEST, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>> - [High] Use-After-Free of iio->pollfunc in IRQ handler during device un=
bind or probe failure.
>> - [Medium] Unintended I2C read of configuration register when pushing ti=
mestamp to buffer
>> - [Medium] The interrupt_users counter can permanently underflow during =
error recovery, breaking hardware interrupt control.
>> --
>>
>> commit c87f3d48e1ee614fc184995b816c8f8679a6b774
>> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>
>> iio: light: veml6031x00: add support for events and trigger
>>
>> The device provides a shared interrupt line to notify events and data re=
ady.
>> Add support for configurations with and without an interrupt line, provi=
ding
>> events and trigger support when an interrupt line is available.
>>
>>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml60=
31x00.c
>>> index 3d5a27a0baaed..7bd7975eb1a76 100644
>>> --- a/drivers/iio/light/veml6031x00.c
>>> +++ b/drivers/iio/light/veml6031x00.c
>> [ ... ]
>>> +static int __veml6031x00_set_trigger_state(struct veml6031x00_data *da=
ta, bool state)
>>> +	__must_hold(&data->irq_lock)
>>> +{
>> [ ... ]
>>> +	data->trig_en =3D state;
>>> +
>>> +	return 0;
>>> +
>>> +clear_interrupt:
>>> +	veml6031x00_set_interrupt(data, !state);
>>> +
>>> +	return ret;
>>> +}
>>
>> [Severity: Medium]
>> Can data->interrupt_users permanently underflow here during error recove=
ry?
>>
>> If an I2C error occurs in __veml6031x00_set_trigger_state() while disabl=
ing
>> the trigger, this error recovery path calls veml6031x00_set_interrupt() =
to
>> revert the counter, but fails to update the software state (data->trig_e=
n).
>>
>> If a subsequent successful disable happens later, the counter will be
>> decremented again, potentially underflowing to UINT_MAX and silently ski=
pping
>> all future hardware writes.
>>
>> [ ... ]
>
> That is not true because the error path will *increment* the counter to
> re-enable the IRQ and keept it consistent with data->trig_en. If an I2C
> operation fails, the trigger will stay enabled in the device registers,
> and therefore data-trig_en should stay enabled.
>
> I tested it by adding some hacks to force that situation, and what may
> actually happen is that if *on top* of that failure, the I2C operation
> in veml6031x00_set_interrupt() also fails, interrupt_users will be
> decremented (as it should, because the interrupt could not be
> re-enabled), and *then* a second call to disable the trigger will set
> interrupt_users to UINT_MAX.
>
> Although this is very unlikely, the fix seems to be trivial:
>
>  if (state) {
>  	data->interrupt_users++;
>  	if (data->interrupt_users > 1)
>  		return 0;
>  } else {
>  	+	if (!data->interrupt_users)
>  	+		return 0;
>
>  	data->interrupt_users--;
>  	if (data->interrupt_users > 0)
>  		return 0;
>  }
>
> Note that this fix is not a hack to just get rid of reaching UINT_MAX, it
> reflects the fact that the previous failed operations lead to a disabled
> interrupt and an enabled trigger in the hardware, and there is no need
> to act on the interrupt again when trying to disable the trigger a
> second time.
>
> I will add it for V9 after testing it with some hacks to force that
> scenario.
>

I am trying to reproduce that scenario with forced errors, and even if
those two errors happen during the first attempt to disable the trigger,
it's not really possible to reach interrupt_users =3D UINT_MAX.
The 'buffer/enable' attribute is set to 0 by the core even if
set_trigger_state() returns an error code, and the next time
'buffer/enable' is set to 0, nothing really happens because
set_trigger_state() is not even called.

I could still add the check I suggested in V9 and avoid future issues,
but I don't see how to reproduce this in the current state of the core
and driver, even forcing those failed I2C operations.

Best regards,
Javier
