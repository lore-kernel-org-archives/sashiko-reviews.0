Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F52433E90
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064053; cv=none; b=J6AMP1m/aGVLNbu2180/CnBLFeBshWEFd9/Rewif6rwHfBrBEBPVQDPtCfvjQs4nzHFW4zUW4jY0Cge3EDcOtRsalKtyo4GX2OVO9LZngeJtCJ3vhHttK5Ww3/dZW7d/eWDz2eNkmfjzzyf8Wv00due6hMgs7mhe46bMZgvHWlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064053; c=relaxed/simple;
	bh=Oz1nvhFoEr73wyE+dWpdHpS57rKQxBbUy+2SCV9yzGQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R3pmCPFjnR0p5mS7DOXSsI2ce/1Ug0a6csKqQYQ7S5be/Ufm1LJzLHzAsaG3mMtbTEksXSaeVlzfqp0nhB+AMKmv54Ewnf4HUxbli2eMVLZC8M0t2igx4AtBIOeCqIwHiQrogvNRurHi9OIgBwGenCgifTphv5yEkHi59JA0SAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HlUjaMZe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HlUjaMZe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so124289f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783064049; x=1783668849; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAsfvSrBGIqzpFkuFJjjn9IXNafmZWfPTPwqXB9KX7k=;
        b=HlUjaMZehooGYyU2C5Uv9xrNm2AxbIlHTN7WiM0KIQc+rdtdF4iC5DepXSnOCWYlXn
         o4FYTskxSyclLbp3naaqOxNlsdMwT30C9/j3e3JCBbY7qtXV+iPKFKrTlwWzuBee/oF1
         dJNqcYFIuiHQn2CZK0Aw3DvQDq1bT7Arj+xinuzhc3XKtgolWmt6yFBx+XsAIIoWIa3R
         diuwbcxyPt5kcTvLm6dxZz57hNI88br04ZyKK3Yq+70QnoDU/5ObKdylPBRsyB4GlUX6
         x65h2xLeOsnbRGlF84s937+YbDtDfXMlobD0XDCO3dbOuFNTNelyz7weN49F01W9TfR/
         m6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064049; x=1783668849;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YAsfvSrBGIqzpFkuFJjjn9IXNafmZWfPTPwqXB9KX7k=;
        b=Ek1ePttuoQo0AKiE8JgnQeC/8+pyzfjNqsDGEdYVZGZr/4dKPm7LGjFHUadHDyLTZx
         M0HExVGknM2TRtp1KE4YF99NfXyqw1j+ZKDkb+Ui6Fe9fUX28f46aa7segARX/pYP/hS
         TGruhra7mQqs0DoV8OuB449YGO1x4ca19Cb7LyIOw0ViDM2nwFl2PqZnqqzl/tL1eaPP
         a7C0sQ2u0TsUvrB5+M4cQEEhHDe+JSLytM+ffTbFo6vUl40h2p9aiaaXjBCsXKIKWnRa
         yN/M1q9xXyC8Yu33jBJ5d1OhcPK8KgII2KxgynCQ6xb4N4gHGB8MbH/yxoNoiybNpxB1
         2HVQ==
X-Gm-Message-State: AOJu0YyzFAFXwB7ciOS7HsHpMUZi1eIxMs31rsXnoIHPyIqrixrCwRyi
	BU7cSJLoFXtcsqQC+sM9OrmC7OekNd+lRLmm/o/THSwmGynsOTaxxsYXoI9glZ9tWL8=
X-Gm-Gg: AfdE7cmrM1wboQYbpvKha3i5vjtbUOe6YhmRFqvygykkoNmxwJk25tEOkYnt0EC0iSo
	ZY30LNvZWOxMBdpqxN4jM5eStnUHL7S4UEaOzWPpCwNV5xRK9qjEI9SiPOD1Iek+RK9DJPOypHB
	yeRg9e4aDA/EtnT5V+dB7oxgJ4H6uPrWiRRUT+ns2NT66UnWmeq9pVpkdatKLCy0I/LaAHthmys
	Hc8rukIxESA2kL5bS7DW+YxmKOO4OZHF/2RtJRwphMO2X7NSiKt3qRAAZO+MTUhnUuOudG14LWV
	nzPbWbOFsag4ixDvdyttbQl/AyM8hE8HlL2G+dP5V0Yh/caWGYIaTYT2AphvgzdBfpHb37HaJia
	qv7ZU+/uALsCZG849HcOUJRGcw8cXrBZel4GoZUV2f+V7swxnXrJML36xSfMfr6i0k9Hq8kVQsG
	QoklwnsuGvf70ZjX4EzzeFXQ==
X-Received: by 2002:a05:6000:2dc9:b0:475:f0f0:9eef with SMTP id ffacd0b85a97d-4775b176b60mr14465264f8f.52.1783064049008;
        Fri, 03 Jul 2026 00:34:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fb6a:cb8b:b7f7:bb42])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477ddf0fb15sm13999054f8f.29.2026.07.03.00.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:34:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: sashiko-reviews@lists.linux.dev,  neil.armstrong@linaro.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: meson: gx-formatter: prepare on attach
In-Reply-To: <b1a0a7de-c5b1-4325-8159-d5a0bad1668e@baylibre.com> (Valerio
	Setti's message of "Thu, 2 Jul 2026 22:34:52 +0200")
References: <20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com>
	<20260702-fix-24-bit-i2s-playback-v1-1-bcd3a43fe32a@baylibre.com>
	<20260702111021.2CCDC1F00A3A@smtp.kernel.org>
	<b1a0a7de-c5b1-4325-8159-d5a0bad1668e@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 03 Jul 2026 09:34:06 +0200
Message-ID: <1jo6goil1t.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 02 juil. 2026 at 22:34, Valerio Setti <vsetti@baylibre.com> wrote:

> On 7/2/26 1:10 PM, sashiko-bot@kernel.org wrote:
>>> diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
>>> index 311e63affb239..c7333f624b155 100644
>>> --- a/sound/soc/meson/gx-formatter.c
>>> +++ b/sound/soc/meson/gx-formatter.c
>> [ ... ]
>> 
>>> -static int gx_formatter_enable(struct gx_formatter *formatter)
>>> +static int gx_formatter_prepare(struct gx_formatter *formatter)
>>>   {
>>>   	int ret;
>>>   -	/* Do nothing if the formatter is already enabled */
>>> -	if (formatter->enabled)
>>> +	if (formatter->prepared)
>>>   		return 0;
>> [Severity: High]
>> Will this prevent hardware reconfiguration for back-to-back playbacks?
>> Because the ALSA core utilizes pmdown_time (delayed power down), the DAPM
>> widget remains in the powered-on state for a short time after playback
>> stops.
>> If a new stream with different parameters (e.g., changing from 16-bit to
>> 24-bit) starts rapidly before the power-down occurs, dapm_power_widgets()
>> will not detect a power state change and will not emit a new
>> SND_SOC_DAPM_PRE_PMU event.
>> Since the widget wasn't powered down, gx_formatter_detach() hasn't
>> cleared
>> formatter->prepared. This check will return early and skip updating the
>> hardware for the new sample format, causing the new stream to play through
>> incorrectly configured hardware.
>> 
>
> Uh, this seems right, but with a caveat. When I tested this series I
> launched 'speaker-test' with 16-bits and 24-bits in sequence and it worked
> perfectly.
> To generate the problem described here I had to create a custom binary that
> played the two sine tones, one at 16-bits and the one at 24-bits, without
> closing the PCM in the middle (as the 'speaker-test' case was doing
> instead). This way I was able to recreate the problem. I don't know how
> common it is for an application to switch sample width "on the fly", but
> it's worth fixing it.

You'd have to go through through .hw_params at least. I would expect it
go through .shutdown()/.startup() too but I'm not sure about this.

>
> For the records, I just tried removing this commit and both test scenarios
> work just fine so I'm inclined in sending a v2 with this commit
> dropped.

+1

-- 
Jerome
