Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E33EC2EA
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946929; cv=none; b=d4PkGEUWfCNh928xL5+IvrnEDzSpHPLaI9SAjyXXX2wUFynpxcUi58yLu9FFaskin60WB5BRR01cQaSirn3d+AxdGL0a92W/aCy09tZlz+ZR1wZUY6I1xQVSPYQlm8Hkl/N/QloLUCu3BsDKPKswU5l83OuBGg6CsLMQg/n1J24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946929; c=relaxed/simple;
	bh=Y2pSW1BeeeALOcK3SHNmAQVg4yi0DNPRpdDIbdNcTkU=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=faK3NgOOmlnGJ1SXAHSwtNqaJczZjo4EtOdrKKcb0lbCM9nUC/CyY2Zk4hpROXYaGE8sXFWRjQkMu1iW7TaOJS2tojOz6J+DTJplWs/G6wQL77oi8sep7I7nyUWIO2nbwsXMdP3fG2/pLLKAPnhVY+pitr/9/oPRUGH8/H+YRAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD5UlHXk; arc=none smtp.client-ip=74.125.231.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD5UlHXk"
Received: by mail-oo2-f3.google.com with SMTP id 006d021491bc7-69ec1535b38so230879eaf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 05:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783946926; x=1784551726; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2pSW1BeeeALOcK3SHNmAQVg4yi0DNPRpdDIbdNcTkU=;
        b=WD5UlHXknyQjVs/4cEAbABKirlMRJNcXd3ieVEJ+2tDMxagKe7rh3+S9EFzlY3wImN
         FDu2T7LsFXYW+XRw5TfZWnKHEXC3QysfcLiv77Jas4S0ZBpCSPxIKc7EcOVB8i0baEE4
         hJDq3PVePYggvTZWWAdqzAdHDNc5YGVJk632bsoO6blNOdChCO2k7wKYCZyXQC2ZJ3RP
         zkINvo46j6oiOcb83I9FOC75dvIb0EMlGIroQUBzddo4ivcbemNOz7MzkodpPXZkLcNG
         wym31dO/df/uLvTsZx+HyDOXOzbud3HfroMHyF8XcpRkVl6ETyBuCEAcDgbn7yVakq4S
         SwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946926; x=1784551726;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2pSW1BeeeALOcK3SHNmAQVg4yi0DNPRpdDIbdNcTkU=;
        b=rzjncsdr/CdD2i7E7NIma552nFpj0np1JKWdps2AqqqggiReDJ18EM5i594y3RphLe
         mI8dMZA7yFjx+5nhrbfJU8VeAk1+4OiRhg3uphYd8+56gAfYKQ+iqSTwzvszoELnIsID
         h8gTbuivG7pjC5ChWjcsmSOutYphrCMS4zWnwA6r+1duWFr7QAiDqdEzEq6VPSDTgAiy
         /E4MuBBddzmrZYgFid56Y4s/2rEFAZ6UBogjeEm0zIs2V8pqgvNg4fXRwV3nsq41FQ+y
         r42kPUSf/b1txW9jNnXOD4G0+eGBO1hhM9TdDclkyYQ1tr27J+uXIxn2cbb1cCBFebpQ
         rsJg==
X-Forwarded-Encrypted: i=1; AFNElJ9UrftktvvIlAg+S4c/zrV6LFoqkHsfyo2bSzf7jWjOBGhCBGOnTtzfzxFpkEgvpE69uwEF95GSFY6oueqEnvQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUm3Zam+psVqMWHzMTKKortrwba+q03LroDVnVmeNrXmHV5+E7
	/XbB4JYdsP5O1YLiyfg0G9rZV703Ct5LzenuQLt/8Cvwa05/jUp/MunH
X-Gm-Gg: AfdE7cnPMq0E6aIqhjG7r2/E2m2G/H6Ys1pmk+uhmH5q8NzkpsUn25H+NzbQ6OQ1hek
	pzpuN9jBy4q16fhTsmZhGDf/IFSNXtaHJKrRf7GJ2ZGSe1W35Vzqp0gr0U6wi+JdFma/wgMTOc9
	bPaXu7WP/I3ZsBH9p1PDrnMUDESMQhQQjqMWRcQYQDeYi0+h5WZXUvKOQSxf8VsZRd1nSjs5Bcp
	MaxzXjEIrdlq7o/8RxQ8/dxA04mesSO6JqhWV3o9HRsWUAXS3zSZ9IJf7Z0/CL4idfpTg66hrP2
	keLtCv2FkHZ0dNkAihATgEWZ/PWBCP2VKux4a9itPnkCXEPDA1w3t0PAS1OGnAwjr1jlYCE8RbB
	lVzjPIFQAgBcNaPYDdMpJlgBWzv9KgWkFBabCCi27WxmZCXVfFLNzjtMibRI2smFNOvuU2uaYzB
	lrJOQwm1cN+D80H3aSEAFDKJIZ
X-Received: by 2002:a05:6820:4b8c:b0:6a1:55f8:6bcb with SMTP id 006d021491bc7-6a39a6ceee5mr5256977eaf.38.1783946926553;
        Mon, 13 Jul 2026 05:48:46 -0700 (PDT)
Received: from [192.168.101.143] ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a377bd9cb1sm9677041eaf.15.2026.07.13.05.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:48:46 -0700 (PDT)
Message-ID: <b72a8cc8-219a-46ab-8bf6-8a6d3e142429@gmail.com>
Date: Mon, 13 Jul 2026 17:48:38 +0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sashiko-bot@kernel.org
Cc: alitariq45892@gmail.com, linux-pci@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
References: <20260712180440.423421F000E9@smtp.kernel.org>
Subject: Re: [PATCH] PCI: starfive: Fix unchecked pm_runtime_get_sync() in
 probe
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <20260712180440.423421F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the review. These are all pre-existing issues separate from
this patch, but worth fixing. I'll send a follow-up series addressing
each of them separately.
