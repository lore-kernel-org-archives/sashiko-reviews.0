Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329D35A952
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784029681; cv=pass; b=XbP40Nn4nOikdzUaj7j3GkO+/bgNHkwW2kwZi2vixcgRJ/Yiktt5f3pTWp3210Ekux/W3nQTCsbzvjcxe8kjDIC7GkLpynWpivxCoD8zC10MfWjRnCwaMNil4sS0bxaqa2Nrxb527lMwPPgKh/r4KW0AljB28mQ48mgbxMgQF7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784029681; c=relaxed/simple;
	bh=f3TqkgRoXgFadJ3Zw5quD61+Nj3I+Wq9hEgD37F0W48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItQEVjaa8MtOzG91YzXTxgE2q+cV5vCamQ8/dkiEmqf8jOEmDwcJioUhDKNWyd4z/etaH818oA7cKioU5m9RyirrPX+gxjqlom1LSFZVZ1c2i77GauNzxJS7mBjzCWK4efV7bdArdZAuBJLdvUQkp1pLjFbITASQhTng7pPNtAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net; spf=fail smtp.mailfrom=hartkopp.net; dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=UlJn+NuA; dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b=7U4Hb6dC; arc=pass smtp.client-ip=85.215.255.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="UlJn+NuA";
	dkim=permerror (0-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.b="7U4Hb6dC"
ARC-Seal: i=1; a=rsa-sha256; t=1784029655; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NXMVUufWkfQ0ulRHtoPwlMEiSktyluEwLhxRPJFT2hIZZIK/agRBSj5/9qowc0wZHM
    AH2bkE6s1E+nq65apZEVTI8uJwiaweg1DNDYhxbA1nlwcyod2cVVMTwvlLe0yRsn+EkT
    rE89SjJ6LIDdbOS41Mt35Y8pZLPaxPJYkQG5q6wREFcqWXvbCK1G8gWr5BrMXr0LF0hA
    pVq/2nCLOpXLXRIhctZchaAd5l+VOT/rlK3eO7ZsRC0adjNYk3/WIFBaz/nGgfdZZMFC
    sH9xygtkYSsO7bCRyI9abKila1XIaqEl+PXTDTST+awn8ddyNJueI7VW3HQWtr1Z9GTc
    w4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1784029655;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ulGlExmyGIJwwDpR21HQW+x4M19jopiWKr2LjYr80os=;
    b=nOS2DsnYTuV2YR9ETCqrH0gIzE8jTQompGgorXKUW73PrRavQrfOoLJSkebpuI7+Qq
    te6FJvpIyKwNuq9rMdj7A8n25z7cQ0pOgjaimZIUWpNqhZr9EatVF4gVJlhLm79qdXnL
    USgTyR99VrAbPaKC+eEnLaFmxJ32BTmt1uUItdKlzvI4AT7FCvzORUh1dCl0xFW4tRns
    uNzYOkIbDjqajECmxwqaw4rUv4OlWbnoboqJbWcg2C8oH6es8Ddmca3RBLDDAk/mTkt6
    C9s2HsOq8PF2fp1y32FaIP1nzs9/EmEwTnYDkdfkH2QEy+Xfa53brtuv01tGsFkYjNxR
    81gA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1784029655;
    s=strato-dkim-0002; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ulGlExmyGIJwwDpR21HQW+x4M19jopiWKr2LjYr80os=;
    b=UlJn+NuAog3tTVNSgMUqyLnmydhrJ6p2iPOlFTjfNLlJ+UkdzxV+n0mVJZnuomdMUp
    Ht9smUIX445+E+DceGXBMUMv0hV07jnuQSQCNrzhJmEJgLZY5PqxD3bDiE+TnsF6m52U
    xdcuMvlQU2nsNvrrv5bduPTQWi0Lrhhv3Fm6lnfsgwUsWZh47/JRBeJh6uNaSOL1JeeO
    Q/eN95ROUTUEsEKOXFJDFXDas8v2vH1QzZrIMk4aw5Pp5j5tg1BzQjsTSjTrON/0IIZr
    KyK9D2Y2iK7gyWPCZkH57fLPhE2sxuqrCLx21K1wXSZpZaIdVZoyiKZvXj9RtYbvIxRw
    SVuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1784029655;
    s=strato-dkim-0003; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ulGlExmyGIJwwDpR21HQW+x4M19jopiWKr2LjYr80os=;
    b=7U4Hb6dC8FhHiK5r5xfadiuQgOGcmIP4HUixDU0avcF1NLUGVFhyW19LcUenWlkb9V
    VOYbLltWjKBqzQGFJgCA==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjH4JKvMdQv2tRkI16oOSW1Ti/f4PoH8="
Received: from [192.168.20.190]
    by smtp.strato.de (RZmta 55.5.6 DYNA|AUTH)
    with ESMTPSA id Ka9fdb26EBlZjt3
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 14 Jul 2026 13:47:35 +0200 (CEST)
Message-ID: <1a521f25-0aee-4eae-a0da-3eb7f0702e84@hartkopp.net>
Date: Tue, 14 Jul 2026 13:47:35 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/11] can: bcm: fix stale rx/tx ops after device
 removal
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Oleksij Rempel
 <o.rempel@pengutronix.de>, linux-can@vger.kernel.org,
 Vincent Mailhol <mailhol@kernel.org>
References: <20260714-bcm_fixes-v13-0-fd667c61099a@hartkopp.net>
 <20260714-bcm_fixes-v13-9-fd667c61099a@hartkopp.net>
 <20260714104431.65C751F000E9@smtp.kernel.org>
 <2c2bc659-fd26-4c48-a5f4-e9e6a3c43003@hartkopp.net>
 <20260714-towering-phenomenal-nyala-ad406f-mkl@pengutronix.de>
Content-Language: en-US
From: Oliver Hartkopp <socketcan@hartkopp.net>
In-Reply-To: <20260714-towering-phenomenal-nyala-ad406f-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.07.26 13:41, Marc Kleine-Budde wrote:
> On 14.07.2026 13:24:17, Oliver Hartkopp wrote:
>> On 14.07.26 12:44, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>
>>> Pre-existing issues:
>>> - [High] Unprotected concurrent access to op->rx_stamp and op->rx_ifindex in bcm_rx_handler causes data races and torn 64-bit reads on 32-bit architectures.
>>
>> Fixed in patch 10
> 
> Pre-existing issues are not a shot stopper, _new_ issues for a patch
> series are...usually are.
> 
> Hopefully upstream will accept that you fix issues in a later patch that
> sashiko claim to be introduced by a patch in the series.

Is it?

Patch 10 Fixes: ffd980f976e7 ("[CAN]: Add broadcast manager (bcm) protocol")

not anything in patch 9.

Best regards,
Oliver

