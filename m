Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748577;
	b=hB7fpk9UPlifTfke6DfR3ZQk17zfU46f+K/zndCKqtAXN1uSoUaudn0zWMVxQUBQ3CHJ
	 HBqSIZJ/WLvtaAkqrKxiRZkKq4K5vQamBqRZCyHr8th2/mnaYwA9tOS+XWOPcS5g+sZei
	 6cfwfeErXpwVFxFsJ3pBXRd342UOK4V9TNJNs81a156Bjsjdjk8UvQOaMtyCVQIRMYYJu
	 UbVCT43aTHs32Uqp2h5RrBhKApdEAJCeyVBoQEygrVuJEaH/3UI6uV1MpvbEOpfvh0YUJ
	 1jFGUrENGq7x7rZKzS2Q2EezzRs/G3Vey7ZeF9FBo/H1ABIA0Q6FUa11HWHKsdr+DzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tcwmxSswG0osb2wNIvi7vyPmUBBn7sZKQt8Rdp+1bek=;
	b=nd8YAon3WCXNJRhACmsaKBDGWliaK2FgP7ZLvZNnr89TTbCorHMHTOYC/7r6PZyDMvEr
	 1pLmMsH0ia+AasTaxu9AIKqBULTyQG1bH9020ocaUbfAa6aIpxUJ5aCw4TyIi6WrBZAbm
	 rq73ec2uLeK5VwQSZcjeNyMz6NNkM2Ui2CVP36jAsd8SG5+vNk9VY9CgpblAiIf5eLLhm
	 uGTL8qoBy8lekdeZB/iSA4IKWmh12vo3KZHuelI4PGPrCY4xQEilJ5+faujI0qB7ceTkt
	 yeYRK+brOPmOGWZETfdzYbsVZxXGuQn8r/jEr4npB8ygfbynwOAA4iBrUPo3gKJ9POQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0brr07R8;
	arc=none smtp.remote-ip=74.125.231.139
Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04A7606A32C
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 23:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04A7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0brr07R8
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-828c0b569f6so56241a34.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 15:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793748575; x=1794353375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcwmxSswG0osb2wNIvi7vyPmUBBn7sZKQt8Rdp+1bek=;
        b=0brr07R8Gu6YI3pSwUrEd+NzBWhKjTeNT5SOcm/G7LbohnzYYtyb5eBFgXPHoPGARt
         tsNUZcQEHcf8m8hyEFUYGEDIdI5E8gVp456FtM+2u6E6rCrjAoOfV44phTw66X8m+dWP
         JwaQ824Rln4g+ozBXNeeesU1eX5qeKBakdgb8uOq9avrpqW2G0JwKnhOcDf/eCuw72aR
         vHci9yb3aMPWhXaoAqk8CuADHxKNlV/nHBxbsQNLqdsImAQGQ0fpGe5AJcFIfin4DXq1
         NmVE5+RAKmlWQ/gfpeIjOryMqYws2Q9IEUOpOjrW23/qCjxb7ocPyAkvIY3PE9AruTQT
         TsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748575; x=1794353375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcwmxSswG0osb2wNIvi7vyPmUBBn7sZKQt8Rdp+1bek=;
        b=XZg11F4YW7yVQ9S+T9578YrMdpt+fpzO3eDNi/zbBzUi1p684gpe9W5x7L2D5V72Ea
         01+Gi8Llh0ZEjqex1XNTbEH7cq2CLrrFSiNJPIwJRjAzNEYgWxZRT6Pi+ZmBDGL8YvBK
         aus6o6AveEdk4cPbQ+mRS+lTUQkWn+4fXXCLH/MPHsEpvY7jFu+OgKJKDlHKFcwP8e7x
         ff1WCk6itRq140M6wdff5dcxmVRUxNJSpVoBO1R/xAyjR9i2imgZ4N1jAK7p38C7utuG
         TLlJt9iqQUHR+vB8eEs34iHy6c75LxzDe4wE1Zb3goVYi5xt2IF+oEf3WbCdePqIkDwH
         3mbg==
X-Gm-Message-State: APuU4Z8uESBskTnK1a5HxlBMEkDV8CqxOJbGk4hBCjNDrlMa/R10G8ps
	Cxd/DXWGMG2GWGppmT0o/A9pVIk/AajGrMzinXAA6vEBaBHLYBdZK8ydNrktrd4mt+E=
X-Gm-Gg: AYBFou1Ts3Q7Ga5S0RP9uQ2lNuvefXr9yQaTRPNcnoiYXon6u4hj6OpfLEtWNmSKo0d
	saqLaJgATwE6Tkf9hPPWxtUfPZUG4JKcHm96lIBCdzPaEeI60mfbFNVcdiJs6/BCl27b9qVrVcF
	xc08tyY0V1lq1ZivrA1BSqGvQLrZNfTkdbWK4s20V2Np17c7UUQJj6QHAQnXqiPDpzlWef0E8jv
	CVwkPR5s+GQfT8GhFBD8ouPZ7FrKRDBqM4bsnEac6/vmeOrHVe0tD/YTXMDr8H9jISLaPgUEvTf
	4DiQOLdhltN2CqgD9arRJM/lMbhss7bPW1EYHaAqTCmvAbE/g4e6U6zUyJcgfIioVeRI2VTmcSc
	ugxJUAq/pA4A+73NRy1CyCxhUJId1inUVbrLtunIVbFhuhFVD+jLu9NmsJT/6blgtzmHbknakBX
	1YsdpANVGjuFOWKgWqL8JyUxoo+qKZREdMBEgKBe+5Nl4lMyyJiacDlvqo8GwiA+YadLLP24cgz
	f0uag8+BzlfiKWrPeBfpoY9cVgqTKMQ4uIcVlyJwk/72v9SYUe38v65SrmozOpZQOVIcJ9vy9B+
	/87xtMp4awAIHpYZx5eLQBVIB7TMHbim2xuUtxYs+7Cu
X-Received: by 2002:a05:6820:806:b0:713:de08:b031 with SMTP id 006d021491bc7-714f24820f6mr8660525eaf.53.1793748575581;
        Tue, 03 Nov 2026 15:29:35 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c1317c7dsm409153eaf.13.2026.11.03.15.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 15:29:34 -0800 (PST)
Message-ID: <56615102-0fad-4591-bee1-04d1efbd87b5@gmail.com>
Date: Tue, 3 Nov 2026 17:29:32 -0600
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
 <sashiko-outbox-193807@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-193807@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 11:10 AM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does replacing spin_lock_irqsave() with spin_lock_bh() in mtu3_irq() break
> the USB gadget completion contract and risk a hardirq deadlock?
>
> [...]
>
> Should mtu3_irq() wrap spin_lock_irqsave() and spin_unlock_irqrestore()
> with local_bh_disable() and local_bh_enable() instead of using
> spin_lock_bh()?

Yes. With spin_lock_bh() the completion callbacks run with interrupts 
enabled, which usb_request's @complete doesn't allow.

I'll send a v2 that keeps spin_lock_irqsave() in mtu3_irq() and disables 
bottom halves around it, like dwc3 does in commit 84918a89d6ef ("usb: 
dwc3: gadget: Let the
interrupt handler disable bottom halves.").

Thanks bot :)
Ryan
