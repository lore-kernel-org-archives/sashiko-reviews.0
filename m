Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611483;
	b=B90zqbt1xXE/rqlhT3HEKmQ4QlsMmmPxpZcVxqYkxyEa1zjLF/BlLnCtJ3Yeg9SjKtJo
	 CcJgdKOW2rMM9sEX4/Fz9xrET/L+Rhb9WsVQGIzG2F+K4YEzwfuDT+Z+4DcWR8QtaXFIT
	 Dqs1kLgw+iDuHlVcpY1IWTK/s0A+EOkrKlBRvpx6FitT0STn/oEZxD4REksuJfSAjap40
	 a4gqsvDdaNbVNLqjUoXrlO/oypfvs52cN60NxAX88ol2SYqDOiB1TlqL4UjRYU8DJNprx
	 86yuunj3O+f28Ohrs4d+pFx+GGcbKGYUtCQZk6KmMsRvj8Y4ruJ8XntddiElbFWKZ6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FOKGiPhLWzMZA6RUtm5hBEIHlhphW7VCRIG+uLWfOxs=;
	b=Ihonjx6MQI2gcNN3W+LbnmtEBQiwEXF9e+EaGTcqAzAVoad6VXdd/3MqyAEa9ciIKX6E
	 DCIjMfZrJduRGw0eEqYgdYLsaTjp4j/9bxmSdofb9wSphPpA66ZTWkbH7g36ujVD9ZIpR
	 JMJwMv/S9nUQHBqEldKcT0oGQaJ0SN7R9b7dVuxSPeubXhccs5wQCMRAe1Y/YYR5NdC8M
	 6ufMcRBZxRTuc9GTTldquzMldvFFSKWF0YS7GqP9UfqZSjLu13tCx9mzQqCGmdRNtbdq8
	 9Q/qmSnA/w3cQds7h/xMSFgGqbliU6JBS65VWPWatthhXStBU000safLkp0xxg7pTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=HsXeaPU8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED28606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 12:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED28606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=HsXeaPU8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so50776225e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795611481; x=1796216281; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FOKGiPhLWzMZA6RUtm5hBEIHlhphW7VCRIG+uLWfOxs=;
        b=HsXeaPU8Z0lAOtEkoozbrMhS+WDvdN7odg4AKVsLv7ioOIvbVbOD9qAeY+DiHkdTUA
         jYHYH/VnIXMCR1uozN0DzNG5do4GDG8TZoFY+CqdGBMEqVwtJqJ1u3qE37rxAhGzUwR/
         1MZWyUp20wDAai4J5ByWbmdSf4iDS4k6A6V0RtQQwuhaVXSKOw1SVe4a2T1/2boJulOD
         9tMUPqG4PZ2/jBoWZoGT11QuujrFCy57bjX/yvYKEJq9m4pgvK1xvgv5jR33Vp5JYyVf
         fmSGLor1ecBy42Rky4i5mEAzxV2hNBwjOBySaRh/moUjUGS32QYqI1h6xPzQ6NL7rAZK
         lI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611481; x=1796216281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOKGiPhLWzMZA6RUtm5hBEIHlhphW7VCRIG+uLWfOxs=;
        b=k8wtkh7ef9kGSPbeoXuSEa7wmkseIwrcNr03nlyj/Hs/p+PSzcb4SzqIskx5sRrKHM
         dhc/BZn9igxkGWyTolxFOeOUlQNlnjfzqY2G45i6so+f5WvwsbubKJY1MwjefZ2bRXkn
         vZb45EiMHYpbdaJ609CCGa173p3PsdYRaZuLmJLiDLl+Xnv2xhX9hUMUh6Cavj/nyBfo
         pw7Drdvk3pn3v1UjCi3tq12DoH2C6g35QXiWfe9rSEzMD3PW0mpCY7Ueh+XIraX2kmP0
         jTP2MJf4/GJ3ddNG/tYi/87+ujaOg17DDsPd1UczhXlUth+Cvs7o8XYyP8A/bpytCVRx
         mpEg==
X-Gm-Message-State: APuU4Z/Mrpe2vZ/hcjPYBCbHj2YY7mmBZBpRehiSzU+3gZgGsJuL270K
	i41MopZaGnf5FxOwXaHZTJJbDNvCUmdJKXFz+5+AorOlJ65FeLN6N17+oBBBdSO4zSG93iGi+Ek
	1NbA16Tk=
X-Gm-Gg: AZFdTZdgzxiNuHpfHgBZFDN0mErpIIPX5RpVbhavtCOVi5nmNbNcc3iKNgxm+nXyr9w
	NKcNd76yDfA9sgHbsnnN8QdO/uBaqs/n2SroXPZ+P7h11E93PPthsEgq4UZZBZrIC+m0Q8+OjKh
	eZPj0RsjitIAnPdkAe/N5Cl9g2Wgp8TU3P81bWJamAVDA3ZIGpnILqMrGXHTHEgfiFM4ZjTRwis
	OzB6In5vUsbmcpAiSD2USSSUejYFCCLodjlLhiy9PRCxOx76ffwwWv/gMIQtXmsiEjyYjA1jzAZ
	Zd10wuEjopnoEmoNaqgYTzVhVfhQUB1iI3S0Ak+ZuBou+b/YFnJB426eR2yurmHsYj5zA2HhD/a
	KEjZ8IdLgLWoB2cxetq0jgwVmnHZVWkx7u8wm2e9qaiTv6c77rgsqngS7AERM/0YnbBCVrjmdPg
	GM6vCJjHyhaEyOiArddiWuhzS21/oFpBo7KRHQlMy5F7Zt2hEtxvrWjTW0BIf53pH2HmqS6NPPx
	L9CTdHbaJr/mPxCZwLEF7WSmjU+0A9HzunwuCXHdE7o5dkMTczPImX1dmLpRWezRlIOz8YT4qty
	DlQBbHMTQTtcR/qf3Ks=
X-Received: by 2002:a05:600c:6290:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb8882a21amr347767215e9.27.1795611480907;
        Wed, 25 Nov 2026 04:58:00 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm711211175e9.13.2026.11.25.04.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:58:00 -0800 (PST)
Date: Wed, 25 Nov 2026 15:57:57 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Drop a pending MMIO access when injecting an
 unmasked SError
Message-ID: <awbbVSeRRxHjvFYx@stanley.mountain>
References: <20261125-serror-drop-mmio-v1-1-48076f59608c@pereq.eu>
 <sashiko-outbox-233383@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-233383@kernel.org>

On Wed, Nov 25, 2026 at 12:40:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] KVM: arm64: nv: sleep in atomic in kvm_pmu_nested_transition()
>   during KVM_RUN [1]
> --

Already discussed.  I'll send the patch for this later.

regards,
dan carpenter

