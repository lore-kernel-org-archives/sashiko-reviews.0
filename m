Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872257;
	b=t8SU5+6M+idEQyFUmF9ar2KvMbYEPWv84PmOyv+mCKEda1iHvwCBE7cSvwKL2mOsy8Xf
	 SNoyJNb4vk07aiSblh+hduwBUPEZcf5ifzQXNmBFhqFo8gnwGh85QUit3Ok5Id4W8dX28
	 WKMSHc8+f7AVTXHQSnsGTGmNk5tjKBUiBRFp+KvQ1469mCJKukptMPOaEQrkMhEu3Nyat
	 mX5JAa0dCw0nvm/g0ZlfxndnSbRph57w542mEmsld2SkbIRgmsHJE7UauKnSSl5sFjGZC
	 SmNiDY1sQL0K84hDUsWtqcrobTtawWqoXYu+i9477VyrmPxsEhQHPA1cVskvLpzkSzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
	b=LFMYDMOGWKTZV3zV9S268SkzKLfRRW5eE6uLpDIqgdB/5pkfTnjOn/PqU211dQyBO3Ij
	 HWcI0nq1C5Bs2tSKSY9GuqM0aKBoPVGuZAe3tY7AyCczieu855X/5FAOKJ02MLO99weAJ
	 OiXJ7GfjIKtO4z2nGaT8eo2iXRX90RajOmlMsL+qhGKUevzvf+/LqdpOg5brXnkfLUqiL
	 LWqihTaxf1trS7iB2kZJ0OcMqMoyKzcFSGvVsUkiNPBcrh25q3lBZ6YvGMJHoMLrrXDDg
	 kggfOznqiFmXelhMHBN7akopnzDy3pTemVWwT0mjVAUZR9X6tan+nTfj+9PiDZPzwFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXfKT1D4;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C60606D83A
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 09:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C60606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HXfKT1D4
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1002977f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 01:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793872256; x=1794477056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
        b=HXfKT1D4I/GPGDkLuWAKvd6GKTPM0HeIIb35oT/zTI0XSEKyCkXKgHm+Nt65mhZWv2
         as7fckLHYX/3C88Id5QCOGVxUcOeHbrgPRo83AKGgwNhq6qIj9ANB4xZFWvkTFU0BP/t
         EgKobQcwekAxlZ0U4HP9GVMcGaaMSdM7MULn55plUnYdEeSST8tZucB9Dd8UZ5nI27Cs
         9qFQBaCUlGKdwLmH4N/iQ5gsNCUm64OeVK6iuBsVGQ1eyK52YWd+sFiaUIE9DwmKhgZC
         YBy1SnHodq85WtVKZ5shG8jVi0XKN0gD9FGgGuk5vbz/4dR0Gly3qET9zy//mFs9Nz6q
         HUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872256; x=1794477056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
        b=Jy1y4iUXU5oPhhDWMpB8k//oCYbfr87dwM/VBa4Mv6S9OrqamSRdyDTxGopoDLYlnQ
         qrbNZNv3ZF80/xmBOLh4s8+5C2sgZxvSSR4+N4uuR6HIgEz5ISByc/ypTolI7kFScuHs
         cm1DXC6mnxMX46Gd7tHX8Y4bLtujLLdI0UEbhGVMBmJevSkA8zWcqWGPChbjmpr89EcL
         EVEmefL/coONCYKb6NAVnegkhiKrZ6wijr5YUdYg15Yu+mv0dZ+fBUNpwRSvg8HKkAuc
         wDUcE1jBMlHTewQReO5OJLZyXZtr6KxeGa+CLEGEpXSWKcP/bdZA7444Z8M7yNdgwmCq
         7rww==
X-Forwarded-Encrypted: i=1; AKwUvBytJzlhBU5H/JglpNnPX59RYdwG+GWl1hAhll7s7neJ8XZJngrkGjB5WQIRLg+JjQftbcE7vEWjOUOLU5PyAS0=@lists.linux.dev
X-Gm-Message-State: APuU4Z92WsuLt8kjt6p0NTeZNtAK4CVeVS4V4Pd59e6TU4UPNwLPFeW1
	WjcRU/tv478rse4PnSPx1TC30tREyVL5nCvKVfu+Zamp4VhVOZF6XpQp3Y597Zj42uM=
X-Gm-Gg: AYBFou06DXB262vzxzLaNo1acUBOMHQDzfncb/TZvxB0v1YF0QugubLdNKFj8Sk7XAO
	l9YQEFzDawKNGqAuPFw8ZIKOMlK7s6QmRo/ul/PTiS42bU6Gnf1l5j91mblOBwk9fvjnI+wXZPR
	VrrUvLUB5pID8Qn4tS2cXkWye+n0FwpTo5GmVO3Ns3FmEMgUdwqWjkbxSMJ2gbw8d1hk0eM/ol4
	gTf6nwjTZBosNBYK8vRzsSslm2ASdfVICRpgAswgPA4K7Du7nMeAop/NeMqom8W2az7ODgnzFHD
	EX+0gtUwpwQs6P2bn0YiEcaHgHA1hYTClzaxtxSbponeRDF/J6udUc7Dk8R+7XJ0xdGVmsvJ96x
	GCn2HJe6YduY0g6HOvMyo0YLpMCa94xc3dwSHI/hlSml2Tgm1fGKwiKNPlVuAyzz28THX5mcJhs
	gl94MgLKO9s++7INgErgqoQeJ9cFHRTOz5gc6DoaOIXIVuqo+FFG9K90LkZ/qDLAOQuvR/Z0Ryw
	YjwjPDaMrzJiUmS8ysCgoU9+GAvikuQ/vhqupN2rrx3a6jXxrNrfYz6+KOkYb0kFvEXMse6Vx4v
	B4u/ELDVbDTEr8izHxCL4fpEE6i51XfKlXwWYdW7Y3P4K3iWc0+zK4+TvBumwh9T0YRZeBToCFB
	SNxZPwMebfKxZci06wjx46ajPoUo=
X-Received: by 2002:a05:6000:2282:b0:48d:f14a:9188 with SMTP id ffacd0b85a97d-48e73851611mr39371636f8f.17.1793872255636;
        Thu, 05 Nov 2026 01:50:55 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:c87a:3b37:3ef1:5ced])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fe7189883sm9331056f8f.0.2026.11.05.01.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:50:55 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Thu,  5 Nov 2026 10:50:45 +0100
Message-ID: <20261105095054.117210-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105040526.26323-1-igor@reznichenko.net>
References: <20261103110524.2812831-5-romain.tisserand@gmail.com> <20261105040526.26323-1-igor@reznichenko.net>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Igor,

On Wed, Nov 04, 2026 at 08:05:26PM -0800, Igor Reznichenko wrote:
> Minor suggestion: please drop the implication that COLMOD 0x66 causes DSI to
> display at 6bpc; the datasheet doesn't establish that causality.
> I think COLMOD only applies to DPI and DBI, not DSI. The initialization
> sequence can remain unchanged. Non-blocking.

Thanks for the review. Agreed: the commit message should only say that the
init sequence keeps the stock COLMOD value, without claiming an effect on
the DSI path. If a v2 is needed I'll reword it there; otherwise maybe it can
be fixed up when applying.

Romain
