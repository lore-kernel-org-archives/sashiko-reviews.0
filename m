Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002480;
	b=xMy/KpjqJXx4vaXBaDvsCCvQc4uduOLxD4kGgvPQ7id4GckDYnEOzpsc+u3pC3jWAVKh
	 vyBYl6q5TCke4DcPpKfPhU943hffVZOFLVpAmUHI8vgRyMh/FqF5r0GI9ChFEP7ucwGmM
	 GwQg77/4tDY0l7WpDtH7D/qpz4RuY0Go34vK79e1uLR1juI16/HP+i+6gzDyyYZ2L6SKF
	 AHFc7/OeoCkgVo6mnw1/9xgl7hScYPkHkanmwfyJnlAZmIYO3TW1Po8emjyMpIpYXZpod
	 j1r89y+5kUQ57oOsl8E5MPRQMzbffBXzaDiadIvtyUDXvz4gkxoK5xFzTVzj0eE/0XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nMnb5Mjf0h9nzGDSWN8FC/0AlVDe4mx+4VWYIJz3fcQ=;
	b=xhtiFeaWeqkXIBZmLX0ZLyUgSER+s7f0YqOdsr6PVmMAosrGn/TCpFc0ccaWG641defq
	 POSGxqzURs6xFwahs3mw3I/fPuO3tCnIBgdVhfmsBuqhNMrfI0rlBn39aiHPgDOJat0RC
	 OhcifkZyM0ntRafjmR/+ewdwLOhlCjAb9G9pL+3r4k+hAENW1VlEPUN0Pkq5IBSLoVV1f
	 /roubU24VXTztNLXXofBZ9z0ptyy80BJ8M5tOiLQi/laLbA/34SbTYffuRkC3dZW3U0kW
	 xofVnLuMi7OKf4DORRDSpgaC50D+e2fSwiga2id4FrZ7wiWgsR1rWaG9knr8XeH0POg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qJ74RZR/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3B5606A32C
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 22:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD3B5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qJ74RZR/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso48269f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 06 Nov 2026 14:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794002478; x=1794607278; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMnb5Mjf0h9nzGDSWN8FC/0AlVDe4mx+4VWYIJz3fcQ=;
        b=qJ74RZR/8aQyeR/oPvcTiEM6nmBWtSDlMxvWXd48Nl9fG7anaOR3/dkf2cjDBqF6fH
         vXpraUvlQ7ppm3aSMKcgDJfHGm5C48ZVmvIu7Rd19kDmgdrDi5KJN17q6/hBVw90pwFg
         a3fLTouvfBUJuOsVQFo5QkQpe2EPE0l60oU80TM9neLOflA+Jecy8FcHfU1hnYEs6uCe
         nEcwHo114ifd+6RDY9l+ta0zgOQsNii+CNugkLZdnIpr7376RKps7KUbsAXZeg/yxq1K
         35NaBOW8XMuTem0x3XcYLHkIMq8WVx2zR1pG/e5z4m9MB8skiyfDWRUNXg3g6IBDf1xr
         Vm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002478; x=1794607278;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMnb5Mjf0h9nzGDSWN8FC/0AlVDe4mx+4VWYIJz3fcQ=;
        b=RMiaBiRf/FJJi6Y7H5NHbfG1QOo/LEeJj/chsGFDl4Nr1eo6wdxNK40tjAdSP+ZyNt
         DRdqZm5jbV1tNtNZIn6Tvd6G7XEw1pQAh+kkXbMRs9xKLQ+Nbsk/DaBM616jl+qB74dS
         klMGgFMRbe9ZmK11zPjbQlcvO9Xd1SiwhTnYCidDd3D8rqZpa3RT46Ob/pw45yfjomFs
         TQnMrwCHf9XeQPTvq25V62D+xY41NjtqQVafTtXHZcBOpjfy7oWVUk8DheeRfPCieVr6
         T4p4FK0Pfj83pkhPnW97ttArh2esgYUHrYJOkFUngmuPv3bRix5012C1cMR+xyHg/t4e
         NtNA==
X-Gm-Message-State: APuU4Z8yHu09IBDZDHMcNUONwXjhPlz0+qNFiFbXfKiBqDR+3eIOe3+8
	2latcaFoYOo5rSGMJwKO3rkl1F4VosbNlPn41Y6afqeqGX+IEtFFi4V+K7tD/LST
X-Gm-Gg: AYBFou1KatyrxBo/gcmVboAGfwQsLPb1tgqejOtUsv1ifVE8Qzf4vUflerpDxpnfRdy
	aXdDVgVE4508ILL6tIDfAMahKYXoquU4fhodux+U0KlgL//RdlnJU8kYZkpBYD+34GFOqpuvyaJ
	6sxU06SXasd9iwr4CaBvL23ppzzNZa39GDYMwRtv75ugx4XFlx56ITAueUIXjOdYezzNaKznzjX
	Uh5gNoPNZHdCLk3svKyBrQNtwn1tLAKkrzvjmhh2e+Qhc0Y7BOOkjSwWwlE3atmFHA67htc2RYI
	nhK48D7BxW0LswoOpVda3cfCFToXcNT7rioD3sFRcFlWuY6Raek9pwr7FUghkxcgFPXQwfNzzkX
	R/skhj/WErDuLSFPKrAnN+jDgbJSFJF/Stt8Hfsgd39B91LRdpD/vhZnrdIsRlTKrYcktU5Mtgm
	VmzXWHkiEg8aA+TXfl9q6cL/pw4uUzTmKrsa/AG4VVCCtczZEm/n/F58PFpI5rQdIm4/KNxUaVy
	njlVjU2o2SNUGrXjx/8PRMERk3o3GJGmb9uqJKrctaHb4h+2QFeReg+VX1OIhDOMcIkCLIUee8o
	Xnio4GzWb99FJFta9aOKSJEEL0tTLoMu57cAzvE=
X-Received: by 2002:a05:600c:3487:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4b8190f41a5mr5245105e9.5.1794002477885;
        Fri, 06 Nov 2026 14:01:17 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm13568375e9.4.2026.11.06.14.01.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 06 Nov 2026 14:01:17 -0800 (PST)
Date: Fri, 6 Nov 2026 23:01:13 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: "Pengfei Lv" <lvpengfei20@huawei.com>
Cc: sashiko-reviews@lists.linux.dev, linux-usb@vger.kernel.org, Alan Stern
 <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v2] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <20261106230113.7d2b8eae.michal.pecio@gmail.com>
In-Reply-To: <sashiko-outbox-200650@kernel.org>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
	<20261106031625.1824732-1-lvpengfei20@huawei.com>
	<sashiko-outbox-200650@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 06 Nov 2026 03:34:55 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can calling usb_ep0_reinit(udev) here before hub_enable_device() or
> hub_set_address() trigger an invalid Evaluate Context command when
> the xHCI slot has been new

Okay, I stand corrected. Omitting the "if (!initial)" check in this
patch would cause even more warnings about failed xHCI commands.

usb_ep0_reinit() after alloc_dev() or certain reset_device() cases,
but before enable_device() or address_device(), causes xhci-hcd to
attempt some pointless nonsense, a known issue never fixed because
things still work despite the warnings.

You can work around it by adding usb_ep0_reinit() calls before the
two get_bMaxPacketSize0() calls which need them; by that time enough
setup has been done that xhci-hcd works right.

I will also look into fixing the xHCI bug because it's already being
triggered by "old scheme" enumeration on full-speed devices and it's
just lame. If the patch won't be too scary maybe we could get it to
stable and then this code would work unchanged.

> Furthermore, if a previous attempt in xhci_setup_device() failed with
> COMP_USB_TRANSACTION_ERROR, it reallocates the slot via xhci_alloc_dev() and
> calls xhci_setup_addressable_virt_dev(xhci, udev), which populates
> vdev->in_ctx (including setting slot_ctx->dev_info and initializing in_ctx
> ep0) while vdev->out_ctx remains zeroed. If hub_port_init() retries and calls
> usb_ep0_reinit(udev) before the next xhci_setup_device(),
> xhci_check_ep0_maxpacket() overwrites vdev->in_ctx ep0 from the zeroed
> vdev->out_ctx while leaving slot_ctx->dev_info non-zero:
> 
> drivers/usb/host/xhci.c:xhci_setup_device() {
> 	...
> 	if (!slot_ctx->dev_info)
> 		xhci_setup_addressable_virt_dev(xhci, udev);
> 	/* Otherwise, update the control endpoint ring enqueue pointer. */
> 	else
> 		xhci_copy_ep0_dequeue_into_input_ctx(xhci, udev);
> 	...
> }
> 
> Wouldn't xhci_setup_device() then skip xhci_setup_addressable_virt_dev() and
> submit Address Device with a zeroed ep0 context (EP_TYPE == 0)?

And this here looks like another related bug which may cause real
functional failure if it can be triggered.

Regards,
Michal
