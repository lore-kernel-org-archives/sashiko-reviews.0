Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526C4A8A13
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784613; cv=none; b=i4F05/K52tbXXXTeimH1Xy/jqSIRy3lsnmUDmYyK+W6EssoL2B6kvcYJaRve724AQz3jWBYQnKGS0GIBhvKrg46DmTSSB515jPDXVQS5JphAZEX8reZvBp5Hr0/wn0NXG2ToWwUx9AQJXov975fHtxpR/IHQs09fuDEcsR79uiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784613; c=relaxed/simple;
	bh=bu12A3+EpnmTdHw1QaZSm0zyUiYnMnUVKdjWsD9Im+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UgWfrqCRCYSv55OnOOXS+t4yixv5lLSFz1oTwuFbYvzNw3iE30lgtm1VoRHyx6dbMVMHJGtVcKLVGGrR0toUb9hZhhs6YPStMHhBKpdTQfW73lbwN9tZPptFNlW6Z5GYRm8jDh40WMNnbVFSEDZua4ZaM9hZrUjFMZXOvo5sY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch8xaWUl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch8xaWUl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482dd6ee390so4000035f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784610; x=1789389410; darn=lists.linux.dev;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5mnzHFW7DMpvqoHj0dsJatnMDdH7eHxyBfA59/u8a6M=;
        b=Ch8xaWUltygHg++jl0HYhCKF2NQxl3nt2dtnkn5pN9nyLt1xVMCsA76YFttsf+cFQI
         SswAOE3kruLO55WALyKZkhqrWYuPU9LrN0nr+YlHV22IOBFm3mC564dTaqZPjY196fDC
         7uycoVrYsPEv+y1nuya3vn2ZoFoDCf/+s0ROcl8cukTJ0r8dYMegQnmHoqeHYOGcZp2r
         KQCz/ewOPNPLuOjXnwv86/3VOf7YmZmT4I9oZQliOWE+Kr64VjaQhIPLd1T4YMfbGxlq
         DL+cvKIAbheWeF54/TkdpI98xbDRdKbga7sUiNOmU9BFcf/9Cnc2zuMDj90Di4QHiBEJ
         hlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784610; x=1789389410;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mnzHFW7DMpvqoHj0dsJatnMDdH7eHxyBfA59/u8a6M=;
        b=huPSouL01ivguCQdqEnmA7914QwLCD9GgTQH7tj0GcsdOXnqEOdQyXvjc9Wcn65dwk
         QSts0f024sulG/c7mVWlXUTD+8OTt4pxADu7pA70DcfUpinKEP5Eoh2kI/zmhL7EE3xS
         12FkhyArFRQNteC+3idngwXz33F+FPJI6rjZlJtIMoA9ZgCblj4fRmo2NSo056qyYg88
         wxwtfmRKA2g+dgoXf2NxhJVJo9Mu5CvzHsqRmS/jzEGxUUZrGH6N3QQyllI5IDGeR5cd
         fn2488xOK0e+faHoIGjLRRu+qkjcYVlblj2tRBC3ozfkwl8zUw+rpa69DtVAGmZa0a4B
         5oOg==
X-Gm-Message-State: AFuF++m3xb2EwZmEBXFtMs/4MwKRG9jhCzNCQm0obfhj6FhBb50glaLF
	iBQK4mJJUuteFqr+yJAxyyqiHkiV5raXgXUVWjljypOje3yE+P7aVsq8FdC2Tw==
X-Gm-Gg: AYBFou2H+YbbncQ/G8XeGdVUB2CZunfRUNHHKNiQMTZohz/Phry5VEEPCfuhJ3lmD6o
	r5UMMwkBn8vgMyRPYcjqcOlbO/f8E2fBElt5SY/NNtob6ywxPR/SNPwIOBl7juCRTAUWB9/nVl8
	oxu7Lz9v/kNCp+zYikCuw1QsSlrT/I01PgRfnQBt6jfH5fOmwI5bbZFLvGWGWzPs1RXy1GKOi+J
	kqubUMdPUSzhG3pnyxxABZFUk03+0TCUUv5AHOazOA0JTnUB0dDrlCIdfUaz/gNt/bVy75ipgpY
	GWOCmnnrpxZXU427Zmwe/ZcWuShbSQ+6YBv3gTqie0LwGXNzf0sbG29ISGLzOP/bErGqSA3tCNd
	+7oj1xogzkJs+mLVRnuVCzlaJbNmvTQ/FTln6SIOjGqtLIX7+QOlFpYiI1vHI9Bp46opsTRSyLq
	foAYs/tt2xUG8WqYvWUpGST4reTdQ5DlVP+v/xzPts79fyfcOhuxA7pg0V04LPJTuNBMfk/1d+H
	g==
X-Received: by 2002:a5d:6f1e:0:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-4858c16a54fmr21799546f8f.34.1788784610004;
        Mon, 07 Sep 2026 05:36:50 -0700 (PDT)
Received: from localhost ([2001:4bb8:178:2f30:d3da:48f5:116c:5642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm21920109f8f.11.2026.09.07.05.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 14:36:47 +0200
Message-Id: <DL93804A11S1.38XDEBTR8ORSH@gmail.com>
Subject: Re: [PATCH v9 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260907-veml6031x00-v9-0-8c93a6c66a4d@gmail.com>
 <20260907-veml6031x00-v9-4-8c93a6c66a4d@gmail.com>
 <20260907120455.7D4801F00A3A@smtp.kernel.org>
In-Reply-To: <20260907120455.7D4801F00A3A@smtp.kernel.org>

On Mon Sep 7, 2026 at 2:04 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Device left in Active Force (AF) mode causes stale data in singl=
e_read
> - [Medium] Spurious I2C read from device configuration register caused by=
 iterating over the timestamp channel
> - [Medium] Software state machine desynchronization leaks interrupt user =
reference on rollback failure
> --
>
> commit 20d504b87ca25179c583e1df1a78eee06d4b1837
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> iio: light: veml6031x00: add support for events and trigger
>
> The device provides a shared interrupt line to notify events and
> data ready.
>
>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml603=
1x00.c
>> index 3d5a27a0baaed..110f59625a5b1 100644
>> --- a/drivers/iio/light/veml6031x00.c
>> +++ b/drivers/iio/light/veml6031x00.c
> [ ... ]
>> @@ -551,11 +976,83 @@ static int veml6031x00_buffer_postdisable(struct i=
io_dev *iio)
>>  	return 0;
>>  }
>>
>> +static int __veml6031x00_set_trigger_state(struct veml6031x00_data *dat=
a, bool state)
>> +	__must_hold(&data->irq_lock)
>> +{
>> +	int ret;
>> +
>> +	lockdep_assert_held(&data->irq_lock);
>> +
>> +	ret =3D veml6031x00_set_interrupt(data, state);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* The AF bit must be updated before updating AF_TRIG */
>> +	ret =3D regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF, state);
>> +	if (ret)
>> +		goto clear_interrupt;
>> +
>> +	ret =3D regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF_TRIG, state);
>> +	if (ret) {
>> +		regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				   VEML6031X00_CONF0_AF, !state);
>> +		goto clear_interrupt;
>> +	}
>> +
>> +	data->trig_en =3D state;
>> +
>> +	return 0;
>> +
>> +clear_interrupt:
>> +	veml6031x00_set_interrupt(data, !state);
>
> [Severity: Medium]
> Does this rollback path cause a state desynchronization if the I2C write =
in
> veml6031x00_set_interrupt() fails?
>
> If the rollback fails, interrupt_users is incremented back to match the
> hardware state, but trig_en remains false. This leaves the software count=
er
> orphaned relative to trig_en, which can permanently prevent the driver fr=
om
> disabling the hardware interrupt in the future.
>
> Can we handle this failure so the interrupt_users count stays synchronize=
d?
>

trig_en does not become desynchronized in this case. It is only updated aft=
er
the complete trigger state transition succeeds. Therefore, when disabling
the trigger fails, it remains true, matching the hardware state. If it
does not fail, then there is no rollback.

...

>> +			if (ret)
>> +				goto done;
>> +		}
>> +	}
>> +
>> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
>> +
>> +done:
>> +	iio_trigger_notify_done(iio->trig);
>> +
>> +	return IRQ_HANDLED;
>> +}
> [ ... ]
>> +static int veml6031x00_hw_init(struct veml6031x00_data *data)
>> +{
>> +	struct regmap *map =3D data->regmap;
>> +	struct device *dev =3D regmap_get_device(map);
>> +	unsigned int val;
>> +	__le16 regval;
>> +	int ret;
>> +
>> +	regval =3D 0;
>> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WL_L, &regval, sizeof(r=
egval));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to set low threshold\n");
>> +
>> +	regval =3D cpu_to_le16(U16_MAX);
>> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WH_L, &regval, sizeof(r=
egval));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to set high threshold\n");
>> +
>> +	ret =3D regmap_field_write(data->rf.int_en, 0);
>
> [Severity: High]
> Does this initialization sequence leave the device stuck in Active Force =
(AF)
> mode?
>
> If the driver is unloaded after using triggered buffers (which sets the A=
F bit
> to 1) and then reloaded, or if a warm reboot occurs with an always-on
> regulator, the hardware retains AF=3D1. Because veml6031x00_hw_init() doe=
s not
> explicitly reset the VEML6031X00_CONF0_AF bit to 0, the device remains in
> Active Force mode.
>
> Subsequent calls to veml6031x00_single_read() do not assert the AF_TRIG b=
it,
> causing the sensor to never execute a new conversion and indefinitely ret=
urn
> stale data.
>
> Should we explicitly reset the AF bit during hardware initialization?
>

I will reset both AF *and* AF_TRIG, because I can see it coming. In
principle, that will be the only change for V10 unless something comes
from other reviewers.

>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D regmap_read(map, VEML6031X00_REG_INT, &val);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to clear interrupts\n");
>> +
>> +	return 0;
>> +}

Best regards,
Javier
