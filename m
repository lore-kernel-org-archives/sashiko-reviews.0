Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424998;
	b=CHiWlSj68eeeLefC+fa7vjOvYqqRKl5iKhAaXtqYkbkCqSXobmGvxs9V9PEC4T2Ccg/I
	 fZSFKP+cayDyjcJmNCtaKNSP5JyK1T5wVksIvMPywfqaiEZ69Wt4fu1x04jE/yjxBuz9g
	 27QSgf7CR371BWSiLrJFzTTEks8zn4DY4bBiC0LHh0pI5YpkmhK+W4ERjka06LRTIYw6E
	 gYBDGK3aYAvfgXiU1g3cWzkfiHGkS+Xhz5w4y/Xl8hI98YASvzPwcTtzBBIMgzDFwDBaO
	 6v2ZC6kie0y3jzp85t4orX4duyejEb9lpItyBeMfzaYIfTQCSIExTXBee3VBlLBqXoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424998;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DswmWj38SvF+mrDzPS0ddFSFW59m+8lcqwF1axXK7uE=;
	b=FIthKKywzm/7amvn3XHBY05U3HhdXHNZTGGni8EE8i7j44JQVYv5guLRLrkte56mDuN+
	 nZv4F1kIRbYYaVigQACwY2UtNdgPEH/IVwyHeSKclB/dOJE/wuIVjS0XDWP13+bCibVYU
	 aJ94jBAaFQGoUbRaLQfnpxG/6uHkfaTLkXYFmulP7msnticuJ4k10ZjaIrdftqGbaHrk4
	 kjd1RK35iBRa6y+HGUpcClQh5ClR0nZWlSKpds+zDT7ftbcqD6gTO07ml5arTAANgOAjd
	 1j4DnSUcmhmr1uUJUwG09QTI9F5hgKMlYfF/1IOhfAx8sIdVoKEaiuNzApz/3w2lLug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpiZoUWw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DD6609A544;
	Mon, 19 Oct 2026 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpiZoUWw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D621F000C4;
	Mon, 19 Oct 2026 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792424997;
	bh=DswmWj38SvF+mrDzPS0ddFSFW59m+8lcqwF1axXK7uE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SpiZoUWw4IGZ95ffvLaDNVUnyWsXcPywK8C9pJ5isYTZJVdILSf+d4xCESFM1I7QQ
	 JAqqux0YR9YNH2Zo0u4Ep49YjvmPvP1IENosFxWqJm0fMXqCYzm+OwpEKfSYNH44nc
	 cR0Axr/8VKD751zi6R4/s6LJfpGPPkZTnxbkIT35z5cKZU7/hlKGnGRmAX6WwlG81s
	 krgwmf4bv/J50svJMUx9/B8viF3Y36JSg1jHg/0Mt/NORCn5x8Aj/FIMmMwPNn8Q4t
	 FEae+1Bh5wCEhk4ZjPh454f+n/kPbphFo+04yg+XHvMSEv6PcIgD4mqETWRNgkLw9G
	 3XuA3taa3AA3w==
Message-ID: <791c7eed-f0c2-47c3-9595-77be72f29771@kernel.org>
Date: Mon, 19 Oct 2026 16:49:54 +0100
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
Subject: Re: [RFC PATCH v2] phy: qcom-mipi-csi2: round the requested settle
 interval up
To: Jizhou Tong <fqwqf@fqwqf.xyz>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, sashiko-reviews@lists.linux.dev
References: <sashiko-outbox-168888@kernel.org>
 <gq57UstyL5YYIJxiym8K0_j1cLrB6u3f908v8Ar3hgadrJwRuof5w5VUh4zR_xQKTGHIPadU-wb7lFoMzWYsZA==@protonmail.internalid>
 <010601a154d83d84-0b2dea8c-14b7-477b-b1ec-3f44b0b55ad4-000000@ap-northeast-1.amazonses.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <010601a154d83d84-0b2dea8c-14b7-477b-b1ec-3f44b0b55ad4-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2026 16:47, Jizhou Tong wrote:
> Hi Bryan,
> 
> I checked the zero-count case raised by Sashiko against media-next
> (d7e7bca71698) and the rounding patch. Both the base driver and the
> patched driver return zero when the calculated interval is exactly
> six integer timer periods, and lanes_enable() rejects it with -ENODEV.
> 
> For example, link_freq = 600000000 Hz and timer_clk_rate = 66666666 Hz
> produce a 90000 ps interval and a 15000 ps integer timer period. The
> helper returns zero before and after the patch. This is a software
> boundary case, not a clock configuration I have tested on hardware.
> 
> Is a programmed settle count of zero valid on the supported PHYs, or
> is rejecting it intentional? If it is valid, the helper would need to
> distinguish it from an unrepresentable interval, with the caller checking
> for an error separately.
> 
> The rounding RFC preserves the existing zero-count handling. I would
> keep any change to that hardware policy separate from the rounding fix.
> 
> Best regards,
> Jizhou Tong

Zero is not a valid settle count so we should just pick a minimum value. 
For historical reasons six counts is it.

If the calculated settle_cnt < 6 => settle_cnt = 6;

I realise the LLM is in paroxysms about that but...

---
bod
