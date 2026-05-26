Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5399C3CAE66
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789763; cv=none; b=cVXg11zWtV8ksIB8FA/cOJCLIOQs5cCjqHqGNi3AbMwoNdQ+ngE5pqVtfNMehabQMrssoEZUnb4B96gFINATHGDDOUjpXI4/d+C+tvaU/IMud5I6qyMEqW+D4995llaTCWR4ojDTKOOmd4LgsE01yefZMlo6xOaTO8pHlXW5STw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789763; c=relaxed/simple;
	bh=1WOWMSyv5ijDMTi+z3FvC6gxEI1E0lxP5EF3SlyMUHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kz/fcGkz4qYz+8wGaUIflI0gjREP/k/fy6+SSKneASZqBuHf3ZSjQxaTKH0EJwQJqgi8rGXA5V9ysjF1RRUqNvVAhK6BaXYxdTne5VbFx/Awjbqj7B8vMOj3Cbc8f1l78RPXyjMRa6iJsSDRkS/5hoVvuVfwAs7YeVKohfeCCU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ip6u1+ib; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ip6u1+ib"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44c350a5b87so6145872f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779789761; x=1780394561; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sR54CF7mjFzC0QGjIQLTwB3SyWd+B75zHF817dW71tk=;
        b=Ip6u1+ib+7xfwbTfxtFItQPNScbUsTg6NognCgv4y8pLeaQAxqVyklUfTSxvSpohSA
         uwkqDs33m7AY+djb+IWtfVtrNU7AGReiO7XxtM9AtUDuNyG4Luohl1MvuGSHK9QPVtZH
         CO9WKXEHu/iKPSafjbwmMpZWPHKksNl/aU77oDa1q1GBqQsbyTBBJvAIdp32EQQ4Bhcx
         SKKwZe6s3/QJC6z6uQhLl14pVgCWt9h+9KYTy3ANYJ5hBPoLf63y0pBVTnuHB0gbqLoM
         eHdunmUiXdR+GtGLRKPStL5z9lyxN7SDF0hMMqofE4YJ4CMCCR2WtNI3pWOS78D3atPP
         25eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789761; x=1780394561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR54CF7mjFzC0QGjIQLTwB3SyWd+B75zHF817dW71tk=;
        b=kl/PCvuxE1HxVJciwxMQqsKUkKoiWP5N7ajjCkAInv/5NA1PEbcWqBXItwvOO5gQls
         rpz2hsymLdW4m/djxsNhVERBpZ1DBx3U3I5n66rgoKhECpUWzjkTEU8w7fOU4329fTK+
         bR2DTDt5Y66LTQkSDV21enRJ76F0S9t+gTwxG0jkRCCBlt8lepA9K8xiJEbXyL/ePy9g
         86jTvFTc/L7Vk8bkVkbnauD+5CDvXv7oBDhw8W7dVoZHhgO+AUJHesWr9ssO2NdQ51fm
         BdeZNZjnAlYCx3QVbFNwj4H/T6e5zyaJtT5Ew5kYbLxDY8NdYU7HAdrwAw0L2UnqOBhD
         RYrw==
X-Gm-Message-State: AOJu0YycizfRrkz/v/Osbr0EmgKqP+cxH/r6yC8WRrktXB03BhHDko9M
	Oc9QsajpWOaMS/ohQJav7oWOIE/A4xJjcPst0WFrxigBNCZdNE0Mletm8H2vHSKzRZo=
X-Gm-Gg: Acq92OE7sDD0GuLBklwTwsKbxwMCfxG+xF4b6j2uBLevBkJIVxCl8U99Y+FFpiYNbUV
	IK1jtyXTUDutWHEc76ogG0DdnAI/CsOHjvpsMFyhIGMuzqaST/pELahDdz0qUdo8bvma/MeIPQG
	Ylh0cSxRqBc8ttyE8dCz6CkMgJU0IRaXz9xLbaw7OkfybS3xLHnAJuzBoRNSSlFYbp7eDu5jqFo
	A7zUxUYX2uuaSej8vHj6JqjZ+D5wOq90dSBjXN6oXDmkXPCdvSce6lw91y/OpaV/+srzMSOX2sJ
	MgruzY9MPUG5MqEhjAJ+C7XpKJL5iU929KZ5tNN6q193gftotqvdPll2zud+S3MS5eRyKahdL3l
	URO6PCmHhsBl+dtHLpkJTmyufo3WGgcmpWaSOmFF/QsLrmZkaqvbuDUmpOYowUv7fMcvRJZHZpD
	bCtRmbRngyJIWj4Xk64l4rrhhZvW4846M=
X-Received: by 2002:a05:600c:4ecc:b0:490:389:7644 with SMTP id 5b1f17b1804b1-490426d4d7fmr296727545e9.17.1779789760577;
        Tue, 26 May 2026 03:02:40 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d71688sm36206969f8f.33.2026.05.26.03.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 03:02:40 -0700 (PDT)
Message-ID: <08eba1cf-2df8-4f2f-a527-ee03ee792920@linaro.org>
Date: Tue, 26 May 2026 13:02:37 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
 <20260525125455.AF31A1F000E9@smtp.kernel.org>
 <4832a220-ace5-40ba-b85b-7c69b3aed869@linaro.org>
 <20260526-uptight-bustard-from-jupiter-291e59@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260526-uptight-bustard-from-jupiter-291e59@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/26/26 12:39 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:06:40PM +0300, Tudor Ambarus wrote:
>>>
>>> [Severity: Medium]
>>> Since the commit message and binding description indicate that the
>>> Application Processor relies entirely on the ACPM firmware for all
>>> functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
>>> required list?
>>>
>>
>> I disagree. The property remains optional because the ACPM firmware
>> can be bypassed entirely. The TMU IP is capable of handling thermal
>> management directly without IPC intervention, so the phandle is not
>> a strict hardware requirement.
> 
> I see your driver will fail probe without it, so something is not
> matching here.
> 


Yes, that's because plain TMU register access, without the ACPM, is not
currently implemented in the driver. The ACPM can be bypassed in theory,
which is why I left the phandle optional in the binding to reflect the
hardware.

I will amend the commit message to clarify this. Sashiko identified a
few other things in the driver as well, so I'll need to send a v2
anyway. If you still prefer I make the phandle required for now, just
let me know.

Cheers,
ta
