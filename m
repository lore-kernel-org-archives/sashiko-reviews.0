Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB533280309
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489393; cv=none; b=eGmhZFGaH/5qi09s4lhJl7aTQADLDTiPQwziDLKXsFoADQtV5905cgGwnCfLEaQhTyHBr+pHMWThFpmWKlx2GvTRHRk08T60pLEF2xooKFie3uuKntbFAwzbqpuoWvTIFZtTNWP1wncNMLavFPxvWcx3DAZii/DMCBpV4SPTwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489393; c=relaxed/simple;
	bh=jGrURUcFHDA0+GbueQInVLfJCt4hwt/v2A3U6hHZjXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiVurpmtsZ8xQU8vitrprFSiks+r1s+rtYsn0pA37nEoxtHi8wB8PndFZHI4FN8Rt7OKYlOwLejGC7DneO09mUpcy3jonAnVGR8+UZubftYxc9EaX56IKRRxGvVDezeK+OX+snkrecxZOKbowIMG+BlTJRH+1PPedE6AJyESAkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Mt4zpc0O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bEsqLIl3; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Mt4zpc0O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bEsqLIl3"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 14F3B14001AE
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 15:56:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 08 Oct 2026 15:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791489391;
	 x=1791575791; bh=N7SBK0vh3ULmPqqgzaG+2tmusZDnFNTt0FJGRL2fTag=; b=
	Mt4zpc0Ol5cLHdfk0AWhgfAPXAIXE+xy/qMjb/P3tz0E6uohm/bE+Il0Sz2NfEXi
	vD5zCf4hmryP6p9cAPgbPp6BtNJnvrOVNMq/VZO/jQhwSftVYrSdvn/7tG1kWj/2
	cTB/YDY3pCBsY1cYGE54uV8kfR39UEQNiiy4Zt40zPkczUNng4UWhP+zP6rafby1
	LjQA/YrQaIdZBiSOjJewAAXci1gGM0o87Drcibi4RBqWC1TkyPjW/K8tfswKaWzG
	fuF4AEkiE1WfZ266LhT/Kk+rT2pnJEv47YQc86RGeidDnczcNd71exOpuL/piI8T
	EOG85w1U5I++5eNdVS9J4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791489391; x=
	1791575791; bh=N7SBK0vh3ULmPqqgzaG+2tmusZDnFNTt0FJGRL2fTag=; b=b
	EsqLIl3V5ECJxNTTb3OedAqnm1Y1Q3aY/TJD/bedyHA3gKlhciYRR1lh4jp6Sp43
	+/5LiOmr3OpXQ2XQqvUFgeuFpxwDyfJr+8oJfhBi0kvzeDOyZznJXMxNmm7M0+BH
	hXCBSUVlDqkJn645mTQR9afDHcABvWLYyBgIKeJVJBthHOLeGIVw5dGEYgfZ8TiU
	W+EriJ8YFBYEozhgZh7Nx3RTP5kCIxTqBuB9v0KJKbLGPX1rga+918e0AhunKYj8
	CPYWSx3qUruBVbLdJZpSXu9HHM+uG/h67COvdcaLapTZf4ZnrOME1BY7E+ukvFN5
	fobeXg6OFLjBtVlJ5JScw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791489391; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm1:rsa-sha256:gtlavcJ1wpiPzfN6Kw8ZfDenzYIb26sXJK61lxuggdRPti4
	fWszrgV9qTri0tDKC/eCYjhSxsmt0HNq/sx1SDQLNYhR01AiwRJush73PTkVAfxq
	wOkmjo48nQgOQG/G71wE0j7nLeJa51WE9dLjkO0JHkPacLmaE0gtmzA7Ap2+91MM
	g2wOJo/gTDwDTOyNgHXDGXMbxwApd8IJQWomFowoEJEixdh0IHs8yFiRmH3kDBKC
	40j2Fgi/lMwuMx/E/xEbKNUQ/QNtTF9KOa8sFvORWsgSEGaf9B5FvKiNR4shE8Tf
	ZgiIWj4Sm1g4h4sDjOCATTzgjAtZkK1hBSD/CzA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4vLTtmz9no8NlirtoArdP6sjsXesZgvradwDROJyMj8=:jGrURUcFHDA0+GbueQInVLfJCt4hwt/v2A3U6hHZjXE=;
X-ME-Sender: <xms:bvXHanKjDQyfz2RffJZlpFlqgebs58aqBr2zUUSvWacmPZKHkHFCsg>
    <xme:bvXHasotYHH8uYJAqvB1NVc3-ErKkwvw7k6Lx-KpJBiHxlPm3wdHA0OvcGqAZnos0
    FQHDwDnrIlbshQHcIkbRMf8hJ6MKRDN3CfT8LZ513UpPpDaahLP49JX>
X-ME-Received: <xmr:bvXHavy3ZEZi0RE-TVa1KZg63BCRBPYY1ZCWJ12kSU7H7hxbxiusBZ8nNbbqsU1djLYMGkk43azbtLAu1QLEjxjazN9TQ9o>
X-ME-Proxy-Cause: dmFkZTFFjWIW6/RUJWMYmeco20bLf3m00dfBRlgVLOq+QkzpXnRLihf2wO9KpbocSPGeCz
    uNr4EAbVC35KUTCAH49UiyN01U/YQqKAltiCVbZy/a94JHTFhYR1G2+w1Or7qYOYs1adiP
    b+sMA0DkE4TuU7Ja8lq1/OoARUzcb+X+U8E7YbnSZorGHE3CQz7lqGJ3L/+fpf1nOtnH+p
    tZHL8RqcLbBRN0HG9NuB0vePXBlUeGJcjfDLvE8If+shIhqL3iSHxADGhs8drjeIGVhYsD
    r6pnoXokzbWbJU9hV0/3foriGGm3xXIss25NSpMQ2qjCgFmFVBFtQh1M59sy6pS0lKj/dp
    ekMDyXVWGzOqFMBrBeQb6iaMFQE853FfpzAmuYcVfOekqta+U9tgPh0jwkCVc9MfaPuegc
    21x/JKpVGoMgv30gEkAUcIsXnQxSOm2x9sIttFrttV1MqO55m3by942OsCQh4aGHyfyfqz
    tdaemnHc7B7OeQPRiSxX4FPuFdVvm+M4E+BGcDjYpMgf3AfkJFwY9aT29RU6iZAaJzfo34
    xSjwNDeAnrDzxAHweG64xKDzsg2AdHJ+2YmsSCq0+SfpKXL2D+pHxLV3e5oDFIpAGHtDf/
    JGgRyVUutPXeAh3WXcWxG0R3CsM3c0TG8qPUSGZG2e0Wn2KTVRC1pQDqVxUw
X-ME-Proxy: <xmx:bvXHagMYe57Z186YAL8X61r_63NbszHGp3kRO2YYJvKRrcGGomhMMg>
    <xmx:bvXHak4z-SQEnZeaw3pajGn0YGnbZotOtjopldmz82cJxhjqHENWvw>
    <xmx:bvXHapktjInx_PmGQFtW9UvLl-0rriwIcwqpJzaBwvA2DLjjx9-Iog>
    <xmx:bvXHatQ6doEjbhLI-2GRfzb2AHsrrq6l8KOwUTnjEKTJ8DOBLNQdOw>
    <xmx:b_XHaiYFStlp2rUysNRjuveXp0qVbKSq4FdGnwS5PtX8jSxzSlwNbhy9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 15:56:30 -0400 (EDT)
Date: Thu, 8 Oct 2026 21:56:24 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next v7 1/3] dt-bindings: ptp:
 renesas,rcar-gen4-gptp: Add R-Car Gen4
Message-ID: <20261008195624.GA474315@ragnatech.se>
References: <20261007185920.4042783-1-niklas.soderlund+renesas@ragnatech.se>
 <20261007185920.4042783-2-niklas.soderlund+renesas@ragnatech.se>
 <sashiko-outbox-164484@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-164484@kernel.org>

On 2026-10-08 19:00:01 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ptp: devm_ioremap_resource() conflict with rtsn Ethernet driver
> --
> 
> commit 2999d29f8c3c04d8ff6cdf49a3fa0d43c2a42ee4
> Author: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> dt-bindings: ptp: renesas,rcar-gen4-gptp: Add R-Car Gen4
> 
> This commit adds device tree bindings for the R-Car Gen4 gPTP timer. The
> timer provides clock synchronization and is shared among different Ethernet
> devices across Gen4 platforms.
> 
> > diff --git a/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ptp/renesas,rcar-gen4-gptp.yaml
> 
> [ ... ]
> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a779g0-sysc.h>
> > +
> > +    ptp@e6449000 {
> > +            compatible = "renesas,r8a779g0-gptp", "renesas,rcar-gen4-gptp";
> > +            reg = <0xe6449000 0x500>;
> 
> [Severity: High]
> Does this new node's memory region conflict with the existing Ethernet TSN
> driver?

Yes it does, please read the cover letter to see why.

> 
> The existing renesas,ethertsn binding also claims this exact same memory
> region for the generalized Precision Time Protocol target.
> 
> During probe in drivers/net/ethernet/renesas/rtsn.c:rtsn_probe(), the
> existing Ethernet driver requests this region:
> 
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
>         ...
>         priv->gptp = devm_ioremap_resource(&pdev->dev, res);
> 
> Because both drivers use devm_ioremap_resource(), which attempts to acquire
> exclusive access to the underlying physical memory via
> devm_request_mem_region(), whichever driver probes second will fail with
> -EBUSY. This will cause a driver probe failure and make the device unusable.
> 
> How should this shared memory resource be managed so both drivers can probe
> successfully?
> 
> > +            clocks = <&cpg CPG_MOD 2723>;
> > +            power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +            resets = <&cpg 2723>;
> > +    };
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261007185920.4042783-1-niklas.soderlund+renesas@ragnatech.se?part=1

-- 
Kind Regards,
Niklas Söderlund
