Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297D312831
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378763; cv=none; b=JZNkUkV5Aqk6jP+XTs9zFUODsHlJ3W3XbAo/zkoW8ZK9uz0FZVOsug4m5ouTvDXhJPEVheNrRpLSQtfWglLa8NA50i+g0KrCSZYHLIu2LXVprlSOXW2NwRNbUtmWE08dpo1BavSYDezh/ylcstK1jl5981qvS9lxUFTJgSJNNrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378763; c=relaxed/simple;
	bh=WBKw6qqj+rTH1HVKFfjax4XYGGOqi++Cd4qPgqpRtMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjT2YTlU6mNYFvcFi8JAbG6E6zMRMulq16MKPmAsnBAiRYBrzy0eDu+b+VYWtADn9VXfRUTK7ytBgxS5/MLZZx39l1XrYouV3vDwSAfBf5H56b1Hft6nx4ISXp++a2OxIqDlYMJZsGoUTns85DBachquFe3dY0ZvpFuMTPptH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Xn8V4iR+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Xn8V4iR+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso38878695e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779378759; x=1779983559; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0fd59xd2Em+FBe64KRflWpdgg6Qr9ICe9rTkp6Iams=;
        b=Xn8V4iR+M7ol+Snr12GkTthMvvjxKoWuj6UyN3Cr7AGcwwn8jTTRRXXJCtlg1cdZoi
         jU11M7cLIbhZXGIh89thQBWPjvQElkm/qUDEh+27T6988U95ZvBN3n4PAvsJfiZgWxv3
         R848yYel+b5NnTMP6eNt9jc0sDbb3MwJB470cVLgI/JevrGA9PeTUWsv09CNb1DdjVx5
         PwusYF5tQcdiapJBs7F+IayU2X04+fyDKmnst+ECiRVrP8VBsJMUpedheSBDiphytSpO
         KXA4Mg8At8apBXk1kJamQf3VoX8X1qjprMFpTvZ51HHvfrtXnhHF0Wf5X1XUIJYsRPI0
         CKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378759; x=1779983559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0fd59xd2Em+FBe64KRflWpdgg6Qr9ICe9rTkp6Iams=;
        b=Hukcn7fEIGvXWXf73IvP8EyLJegs+y1XHN7ggvS3vIu2WoRAOHlHLTAutwzeoURykx
         qTUK/OTdsC18dKWnXF99bHO+G6iGAXYdjEzmtr6ZCHaYTga2vys2Mlmlp2jUwdzL7TO+
         0MP0YhAn/SVm084qpqQzSiUnVlalK/8ilQfXcPafVJLox1IAZGESAljyaPn+JXe3bss0
         5EKzpzlPZ2GtqdaQ06p9mJtoQp3H5KuXkWITOY/zIcJICCbL7W35SsJyQuKivrJFnJ+8
         /59CfITsudFkE5YgMjHjmGAEMcByYU2KC2AhI6heryB/WmOGYW6N/wHCXEUGWDEXdYK6
         DiJQ==
X-Gm-Message-State: AOJu0YxAy3g7iUaxZ955GgEqzqz35+tw0twnjsrrbDl2mC3TDFmwvr3Q
	xY/WeBXlnAgqVGW9TphkN3R8w5stbMba3hkB0kq6V3iXXy1Olkg49UEnoF+MIangvDgPgVN4Iji
	VFyCF
X-Gm-Gg: Acq92OHDPkPnT+mDg5THF04FTJ0c2WwpJNzgBkjJFsekNarDPciDDgL/uvEOSrv4qVX
	mO78R5eCv3VaBrapukKghjTNBDPI7cfL0EXoG6v5L+5D7bws3b+DAEfD7UwR2d9sCavgy9Lae9s
	y6zunk4b//+jrcZnfOyiQvnGENI7BYdBGUF6KfkhZTMe1W2Qzevzsbv/YeiRPFxr39tQoYsuLeB
	0Mr1c99JQePsvoCvX9iS7D2V1sqTasciSlAHX5pAy2CuIhxEqwdZB+W7OMz6adG4nWsm8VWtidJ
	PVjbdRQDmx6du0OKMtikPsXrsyTi64bEFx5uXmQ2KcXtB5EQgiU+YFhcLe5yKgJ/6isbUK9RWKF
	MbcgUBGWev2NVXRbjli4wEgz/UwG85JrsW9ApicKYIK4ltzQnZk5lJu3lwAMPzs8VaCthyIOJVu
	fKxl6MFaA4EbwxXekmlwB4ZVbE7A==
X-Received: by 2002:a05:600c:4e87:b0:490:3b87:be0f with SMTP id 5b1f17b1804b1-4903b87bf47mr35860365e9.23.1779378758957;
        Thu, 21 May 2026 08:52:38 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.223.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c99cb43sm34383775e9.4.2026.05.21.08.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:52:38 -0700 (PDT)
Message-ID: <a2306afb-eacf-4132-9cd2-ef1bde8cd0a3@baylibre.com>
Date: Wed, 20 May 2026 18:05:18 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: meson: gx: add gx-formatter and gx-interface
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
References: <20260515-reshape-aiu-as-axg-v1-1-53b457784ff3@baylibre.com>
 <20260515153651.965F8C2BCB7@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260515153651.965F8C2BCB7@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> 
>> +int gx_stream_start(struct gx_stream *ts)
>> +{
>> +	struct gx_formatter *formatter;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&ts->lock);
>> +
>> +	/* Start all the formatters attached to the stream */
>> +	list_for_each_entry(formatter, &ts->formatter_list, list) {
>> +		ret = gx_formatter_enable(formatter);
>> +		if (ret) {
>> +			pr_err("failed to start tdm stream\n");
>> +			goto out;
> 
> Do we need to disable the formatters that were already successfully enabled
> in previous iterations of this loop before returning?
> 
> The ALSA core does not automatically invoke the STOP trigger when a START
> trigger fails. Returning an error here without rolling back the earlier
> formatters could leave the hardware clocks and registers permanently enabled,
> resulting in leaked resources.
> 

I don't mind adding this check, but I have a question for reviewers for 
sake of knowledge.
I just checked and it seemes to me that actually when 
"soc_pcm_trigger()" fails to SNDRV_PCM_TRIGGER_START it rolls back to 
SNDRV_PCM_TRIGGER_STOP. Sure I'm missing something that Sashiko found, 
but I cannot figure out what. Any help on this?

-- 
Valerio

