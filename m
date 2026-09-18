Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960783AAF4A
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725392; cv=none; b=WdFjs9il9scT+v81bSiprte6NpNiNhKjOvKLvIaHA+tq7w0a6qq+gRtnUqfa9OqmUDzYxwGGvlta8DHtmhZpPYIsno5IinsLUqCurFYC+2V74hMLXOfnzSzEqLPidKnnyQTgEZVkmRuO4FH7ZsTcfWb3hzamdtu5V1dGrnx30U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725392; c=relaxed/simple;
	bh=zqlWQDmwaIOgQkR91IuTGpH5Px5j9vUjOg0+ay+C7Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBePwYCsamBKXVj9KHcZtbLxgT0Uh0KT+IIQK7x7D7coTaTucHSIoh744M6PGHWNxoxsY7eM7D1uj4VTGme8Oj3sgjC7xZoCskKOgs+VcTTKO87NrVV/6xOyrhXKDvNkEjDfreKlbzU2P3QauKz1p11alIAvP503OrHBFthR+wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I4ooS23K; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I4ooS23K"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so357244f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 02:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789725388; x=1790330188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pwt6VmdbigODlTJ+4GTZarReJSK6366BuVdXf1H3UUQ=;
        b=I4ooS23K9UevHtEcDKZQuR74OMqNLzBkjkz89Tf+w2GqYZcCZNQaDhOx7KeEnwVnTI
         MxUiizb+Wb6CMOptMiu4wNmv0xb1pGkOGuSRT6c/gw4HYYemxKzuIL3IMN62aGtkxQEx
         BcKI9tMKGvGhSWCZJD0UGdvX87OwSfMvApzpk8xJQahe5MJ24AJWzlnb8gXnN/7krjmh
         VFGwQcFXrBVT24Pm3W0Iv4mXh1FNDUoIoh2Ec1n2OfltsTl4LRMa5FzM6MrTFrb70+S2
         sRPKJ9/dsNgWg0/R4LW7EU2d5Tjj+5oQf57PmdpYgOumyPegOXOtkyyBxDThH2UvYW1E
         6ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725388; x=1790330188;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pwt6VmdbigODlTJ+4GTZarReJSK6366BuVdXf1H3UUQ=;
        b=VeFTBVFPicWIvJVcZuksinKxEz1zcnl1IYbQZZlahtjfBk0zOhQ/NJcwI3pKDN9doc
         HDXvUzVh9Qe8H5IegquDuqw6fT1LSOtFQch+K+wOotpcM2cRtCvvjQxOGtPAcwMdyPCA
         +qLSa9gvOyORCodp+K80yQVKIkgLHjKRT9FKF4Wq53bU3sTKgY+HieVX02+ONm7kq6sD
         qlnZX0sqCWqq9ZzPnrN5wvL+1hCtmunP4AcVSVh3wsVft8LC5cJtN/3dGR/Y5sXjd7B/
         QW2k7fd4FQKDTtqrB2FjDbgAWKdQCugyD6wdix8uj2CfhUkG5Wvmn5IjtaaNlrxILOYP
         qUPw==
X-Gm-Message-State: AFuF++k3XKp4viZUrKKnPgTe94oDUggSvFoGnfn8HMLnzflZZ6vBUFaB
	7ghlrnC2qUvoqa9U/5obD4U/DkfVqFq8QtyYEN+K4+86c04VeufcrxHvjxqIZa5fCrGrtU0UYaV
	ZOEpRIrkBnw==
X-Gm-Gg: AYBFou1khi2kp69lwr7hzyQ3AMPcR+Itrvr9CR8xdFbn1vL05Qy4EVJf0O7As+A6Y4b
	ZEbkan85M0OPcsXkcKwtNfQcG3zsXMpewkBks2U0o16+cQuOE1yDnkLJlS2u3aXLwH6KdLLCAaY
	gHZoxYTUBsJY4nF5Jckno6VstSz/Vj6wSx7jUkx65jXgbvRQ6yUSLo9fQPQtbdxlS1NdxYlPii5
	jsznN0WmZhcvrE0szNtwtINUDKdy2POfPZPT671w+IEQsFMUGCyt+ASJ04QNCFq/NOIy/qJy/yk
	D4jivrQGbSEff2T36AhOAEmnnnKYdCQ2Zf5sAelXyg+fs0FhYyr4oZVERKOGIXmYATb9PTMDo4V
	0kZ54Copr9gofunUBu9a7jtU+xUY1QLxThM02DMIFlW3dbCstBz8QtoYQbl1lixRIWHBuAw5XSj
	flVj21+7DG3Ec+QnBHYBFgKNhoh4znX+WGwt6AsAVcBXT5nfk6Ehs8udZMtuiCgUwmlHZYhQE=
X-Received: by 2002:adf:e011:0:20b0:487:219e:5e20 with SMTP id ffacd0b85a97d-487219e5fe1mr667041f8f.51.1789725387833;
        Fri, 18 Sep 2026 02:56:27 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008fe3csm2829597f8f.37.2026.09.18.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:56:27 -0700 (PDT)
Message-ID: <7da24c37-3f6a-4a85-a06c-3d587f6ed4e5@baylibre.com>
Date: Fri, 18 Sep 2026 11:56:26 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org,
 neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
 <20260917212019.4ECE61F00893@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260917212019.4ECE61F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> 
> [Severity: High]
> Does adding this capture stream introduce a permanent clock divider leak when
> hw_free is explicitly called?
> 
> Now that both playback and capture streams can be active simultaneously,
> snd_soc_dai_active(dai) can evaluate to 2.
> 
> In sound/soc/meson/aiu-encoder-i2s.c:aiu_encoder_i2s_hw_free():
> 
>      if (snd_soc_dai_active(dai) <= 1)
>          aiu_encoder_i2s_divider_enable(component, 0);
> 
> If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2, and
> explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
> snd_soc_dai_active(dai) remains 2. This skips disabling the clock divider.
> 
> When the streams are subsequently closed, the ALSA core skips invoking hw_free
> again because the state was already changed to SNDRV_PCM_STATE_OPEN. This
> would leave the clock divider permanently enabled, potentially draining battery
> or blocking system suspend.
> 

Oh, this seems to be a right claim. I can use 'ts->clk_enabled' for this 
and gate the call to 'aiu_encoder_i2s_divider_enable' based on what both 
streams are doing.

Let's wait a bit for other comments (if any) to show up, then I can 
prepare a v3 to fix this.

-- 
Valerio

