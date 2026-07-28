Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1453FC5AA
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232895; cv=none; b=FnXRealgc9a221YyY8SsKvSIbJwYjPg5voYFJGd/UwrCiJZEDvutBO5QHpE3umfaJutNHfBwk/uWtMaJqV+UJ4WrFZ26W5XiyKmt/mOjin9XHMYtLdSgd0iruD4URkOl8VRsW1Ec2nMYOe2hWeTfEcjN3EtBOw1oFQMAR/DUIxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232895; c=relaxed/simple;
	bh=bKkaqAxKDslyY5tu1jBchfNPLRe2q1WdVkhkvOhTNs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWEmHbgqPpX6S7xQg6LI6k+E1IdES//VWlC/mmk3MG422xAF1o0yMkFohbtWkwzUX+mpT1+aAWoAVaJbHu8PQ8uvjfADd1DeLxveNGs1JhPCDtWxQGrS90Og2t+a+xPcjMj7sZqmShxbakHl80W4E81vhCFX1r8z+P7WRaekrYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJe6TQ5y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJe6TQ5y"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so5935841a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785232892; x=1785837692; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEeoUs3PfQSMgYTm929Uz2Dor8kEgnImRfKTABiu/ws=;
        b=AJe6TQ5ysVtEs+1VHDYNKLseQY7i1BBgB/sb7rQ6N6cJqznlcS18x0qRUfWhyniOyM
         mYGP7NAYA9y9Pw/J7i2qxjAl1IIxLmc5vm7Tez8apZ0o+0U2fKAV5wkEPlik0UxClW9N
         TkwuwwFAb4/zkTXHzOixrg8ufAyz8o7EowFPWty7LPujcpwtHUAdQliaDZLwEWj4tYfr
         xUe6PpXs62XET/QUL5qG9uYOrMXLk05gIltbfSmmVpyg9++TD7erZaEHZikqwLez46Jh
         WvdyAafb9NDWXAEbkTrrooJlxDuhbDvQRtE3MuCqy3Lz4/3CGP2Sjs8YXcExMWMEUCZk
         Ld2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232892; x=1785837692;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEeoUs3PfQSMgYTm929Uz2Dor8kEgnImRfKTABiu/ws=;
        b=lsPK9cppwMLo1H/OLt2iNVsmPEAfHt6d3UrjtqdrcCGJZFm5GObTSHXa8quXSSIdCt
         JUbo6GD2lLGiwGevlZWBENKGTsJsefDzl2x6PUJli9Ml14vh/V3v9lnmOQjQvAZ8ETsk
         5sFrLtXLzsPZtkdKYfTY0/bLyE6q88oPXso0Wm8KsqIiKhZ1tS2VSWosLoCadOC582WM
         BOebTtXsUqiwpMMfpTkTZEEckUar9Hc4W4TLwt6lW0x3V3/01zXzveOPxjpzftYtIzwc
         23RKX3PK1xunylFGfUKUB+yiqRlkXaBgQyEQ3PUsNJkNydLZjgHwWq3OVlD3htITyVlG
         0yAg==
X-Gm-Message-State: AOJu0YwkZ5h2N41KLokS5eCAy+OcI46CJ/nYOOlAEXUrYWQ26NmE9Bub
	FydfL4/9rZWpd1CESdzgAUy1WdnnWWBZumL1aUFToo6sMLDXDz3ImRelqJJ51+9RZOK7KNTT11W
	ivsTVhnQ=
X-Gm-Gg: AR+sD12IJh935aMK7YLdMdNiJFVOQh7E57LrNBP2C3y9KolnNfSjek9p9iXSTe4JdqW
	KAammh+NS8LmX4OshM3Kq/tVK7+LSUwyYeNKOrFlZBz6okZqknAOBa8q7Y3uuE2ZI8XREP4qp36
	u/TA2zkGrPRWd8HP4U0isUZu1ZyKcTaCSz85dLHGQ5Bes9wCmg53tXkqL5f9OaprHCFg6AfHNTp
	G+OrBKRcPDc+z0lqpJKlW4WebPwOCB38bhGDdnxzScNJ6wILpkrMnNAOJ3hkQ9YNCe5oZshqIuv
	3BAX2HX/RgXl0uZQBIKGcmfWW24gJqvZRkTHcMDOZmwEeWCIhSDiAeJuKaOmvbdMYaONqRvfsFO
	SV8yno28Uvz3VXu7yznY3Yk+2VdtJsxk9uEt29FWbBG3ktU8vZsFPKcoTBQ9j5b/QPpCn65RV/z
	VEK+e+n0E/d6pmBw==
X-Received: by 2002:a05:6402:5114:b0:6a0:33f6:13c2 with SMTP id 4fb4d7f45d1cf-6a034a5efc0mr809800a12.24.1785232892204;
        Tue, 28 Jul 2026 03:01:32 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.204.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb50bd467sm3697785a12.1.2026.07.28.03.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:01:31 -0700 (PDT)
Message-ID: <328f2c30-b43e-4ae4-b926-7375f5edd5a5@linaro.org>
Date: Tue, 28 Jul 2026 11:01:28 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/5] phy: core: Add phy_get_by_of_node()
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org,
 media-ci@linuxtv.org, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-1-ae811e2f0799@linaro.org>
 <20260728094619.830C91F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260728094619.830C91F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 10:46, sashiko-bot@kernel.org wrote:
> [Severity: High]
> If a caller uses the new phy_get_by_of_node() API on a device node compatible
> with "usb-nop-xceiv", will it bypass this check?

No it won't but, it is not _supposed_ to.

Literally just doing functional decomposition here. If someone misuses 
that decomp, that's on them, not part of this patch.

I don't see much point in moving that specific workaround into a 
lower-level boiler-plate but, its up to the PHY maintainers to decide.

---
bod
