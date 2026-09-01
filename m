Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE4649C4C9
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287289; cv=none; b=B9Ab3bj8ZOGF+E1LDcapNGhuHHd3yKJL/CS0OQEDRboIUG1QvHZ5C1gGvFAlbiLsOlo7tu83u4N1X6xuxcJONmgnX+lXgaCLGQyz8hbt65gROT6+uoIqT0yAR8d5h+Ke1TdqscsIxtMOMIO0TRuh/yDR9bg02X/9jwzHlR1F0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287289; c=relaxed/simple;
	bh=eIv7sXQfukA3E9bNuBLSBpsgJZfia3N6dlr3sw++rMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7bwr9rfSdrzFJ6dDQQEBYgxy/mzeo8YHVHv0jOzfhmKIIB2f5R7j3Mutm0EofyxjwjFMLTMgoNQJaPf7v78UsDfmlK92D3wUvujD4tT8CXTig9R+3+NFQZD3VzddK/ZA3aPGI47kv3sGY2CvGXdJYW2zi6HPI+Zblq/Efnl718=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpg05cVb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpg05cVb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d032846c95so1210535ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287285; x=1788892085; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ou33Ickh4Vn8VVAaowrPfNfM6K+Q0yMcz8uPAbeqWEM=;
        b=Dpg05cVbL/i5ioFE4WLyb8CzPlJDtx787mVh38wZRTXTOP3v0OmwyYOBGkwQ38x4WD
         Qwnn/8Cmt9J261TwNoC01aQ5mUrc4+SWGDS9BFrNLQzsbh3Sua+sqmVVKa1FO841CQ6e
         FX2Cm5Z1gfbN3CbeYKPVEOt7ZWEjoqbsY7QGYkm2IPpJf/G53WADbe5Aw3AKpIvaSmg/
         ArIdsffhE7c8QrFo9mg1o/JPNLYZdmHVMufWgcwXHuGdYj0pwFc91zdBXLbz1cIZ1v+B
         pJghJrI1o+scwcoSwa6V7nfb5Z1PV84qGTjI2RFS/5yWS9xx1pWkNftyF01RVjCwNkmc
         EUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287285; x=1788892085;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ou33Ickh4Vn8VVAaowrPfNfM6K+Q0yMcz8uPAbeqWEM=;
        b=Y61IN5H/aEo6beH39PTZWn1P4/aQD5Z7mxXjtj6LnHaZ83XYdZno9PIuF9MrysnWaa
         oSLh2CPX9KwSczPxjpjzVroTzDK27jvg2aqZES7JbYypXzvuEQrflPws8+83+zTZyxC1
         TmSuwrlko45vC5/dpkt8AAzgZF9y8lz792XLqFvSV7LZGISYlBGXLl75pOsL+ZQjPUN8
         OGbC3yWZvmvo58tQCAc4DqRV8hNQeCW3yj3sLgWLVXfzDSRFa0a98pdqT63azZMXp7XH
         +wvKwjs793PUsvKawqB6Gj+YJb4BKwIbnKW38xwtp5AG4Gqi84dgDBWRqEEm/3DNtXaR
         1aPA==
X-Gm-Message-State: AFuF++lDcRLSoqYn9ICNpLSGKJuHih5l4y4cFUJ/FjCV8ccDj8f32Fqb
	zdP06St3NZzWntl8d6RcgXVA4+WtyfAUgghCjBE6qAyciMGL1512CsoDAhRsqA==
X-Gm-Gg: AYBFou0ayEwlwozlq+Uys49KPBGfj/P91AYp+CyuDZA2HoVErqk0/H7JUJ5fc6d4NHT
	/V9qgkrC+a7BQGkVJTB30Iwlvk/1nOx1z56zUtBCp4fdsiYsPGo74d3jnsbd3PKBdG13zmAH77Z
	kskHJbceORoCmRvzvhmiXQychtlK+mrCWVS7pPYNtjlXMEVf/GPVeVCTw8Pek4pR/k+sFxh8mza
	Pi9PNuUNzI/X+Jpuf89jkxxWbiyyJ3rVV0nI3iIyWGbljQvf3uNcGYTbyAmWCxDoIKdPrihA08v
	xzda9xsvJPo71orQrAk2rHWelq1K/P4PcJ3dOeY8eFjQnOluEjYrXtr3qidgHn8YAgeyYC56Xu4
	08+Q5G1/Uig8fy7m0ZQsR9s1YZFdBvrBCvFIyOYjnRHu5HXjghOy8qjiKlWnolQuGwkUG+MTYw7
	Xnn9QZ0esWRKZBMVEJrZZbmHA0RxFrJAU6FZjOi+sozjVosAp6cY7+1I1oP5g3J8CkZJ1SNaDof
	BPckOvXGGE/PYFgfh+KJEo7ODSDJXfYB2q9Bg==
X-Received: by 2002:a17:902:e948:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d94a8892fdmr161450535ad.9.1788287285440;
        Tue, 01 Sep 2026 11:28:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357facsm2468135ad.12.2026.09.01.11.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 11:28:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fbb88a92-02c4-48cb-93a2-678ee169e88e@roeck-us.net>
Date: Tue, 1 Sep 2026 11:28:04 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
To: sashiko-reviews@lists.linux.dev, Cong Nguyen <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260901155648.1538876-1-congnt264@gmail.com>
 <20260901160931.DD3811F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260901160931.DD3811F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 09:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] The interrupt handler unconditionally returns IRQ_HANDLED while registered as IRQF_SHARED, neutralizing spurious interrupt detection and risking a CPU lockup.
> 

As I suspected. This interrupt must not be configured as IRQF_SHARED.

Thanks,
Guenter

