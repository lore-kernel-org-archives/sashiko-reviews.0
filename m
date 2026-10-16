Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667E4582E1
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141086; cv=none; b=WSmeUYAbb7GbIlpwr4P52cOqIh8EW7qnHoWZ5FT55K1+tFKN2u//W8+30qGEm4hgCe0cW+Wh3jMNIiDC7wIeVq7Czdb9Ro9k/H7UL6A/3EKLxCf07adjVRQluZD8RXufFGKyiurbolejWmkx36Fk3ulvU5AXj++nipykTomrQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141086; c=relaxed/simple;
	bh=ddwXXS94V1hYrv1+iJwdR5Vr6S9+vc+haoqBYE6HjBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ES7fPOumjbVBo9JcyFA384J2f8dVkpV+x4E9hY0zUy1FERVw7jIFYmci2gNwSP7NU8QoijX7ckM/sptNEPenstHf+o5YVQNuaq22RyY7NpbPd3k134y0V0/jIuQIe70jHN8vYHP2it0CbuNZ8vWB2skeXL5krkrEM4PKtbcCIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyTEVUcn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyTEVUcn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so26469225e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141083; x=1792745883; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iCpWI4gds7IUpWviVdywbLiMJoOXNKnvhlY7AZVvYE=;
        b=AyTEVUcnc3KijcjvdhbX93xnf86X0HtBmMz9zJMViHcKL7x1MPLFgEClZr/2o0AutM
         6UP4HaTRsSFoCH/o8sG1l5YfdcX91bRC1dY6aDxHHiNtsGhlry9LSFYtw/7PNcjeXGjg
         DK4FhNAje0hn7Njk3q/Dz2teSzOMNJcDLROuJ2MPtv3ZA76OsKVzh80hhI3n4NGauAkU
         2sDK288DHa4rMtY/Emmo+Yab+BbeErxBfM3LDnB4bsOfkmRXY6WUib8wr9iirNxFA5Ow
         ltYAXZCGd5qtWnZjU79FrCWAZ6Nzxhx0RlBjvUwozigPsQzpR9be7AU81a9BudVaz8KU
         DiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141083; x=1792745883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1iCpWI4gds7IUpWviVdywbLiMJoOXNKnvhlY7AZVvYE=;
        b=DM6JZC0SBGTMTrOBpDCcbc6qfb2XYqLpgif533ns1GLMPoVP+/oChbFCOVNJ+gi+EH
         wGXmVSSiccx2ZYLtV8TzkjYwfdX52eYd79BGmFjPanoa0YfuiEc7Hdaid1/ucLZdI5x0
         KlcK7cJtuSm1avq7U9J5tilFa0ExPuz+QJd4XJCQ6dCDTcBiJMnpmi1Z/K9gxKkN+hMj
         aPnjJPaGKPZD/gcJQ5PD+hkiRN4MkkrdpPDCzIYP6ylGdDnNcnreg7NQ3hQxE0fUg3bC
         ZipuB4sjebIdfTOvt7KUz8ZqHcUutkWX5IWvoBMkJM0WYmymtPMO8D7KyPyLVzGpChzj
         6uPQ==
X-Gm-Message-State: AFq9FYKSDdij4nGHc/gDugSMPOPFFbAn4xJfUJ/CklqL/5UFDOLG6/Yh
	iKZOsFkgt6wJzoWD/1todM3yWzMTRPyW5CARH6RoUUj6GG8mMXKgaFehFXEvJg==
X-Gm-Gg: AYBFou2C8eN48hoBVsUYzLMVvBk9ntcYwkHIAhbbARk+gmZtrIRYEaqpWZqjYBxfeB7
	zRl1cSDlXiJasEGK7ft/ksxu+jYFQv+HZtwi/9vyTZsFxPxWMpAZDUx7983M8W2DHWyhM/GY/XW
	Hl3JLytrQ1YySWOufM06m4x1GJ2NGeTNwRogm+RDGmr2p7hLSrHuu3YFfXViibaltas7/CeTYDu
	Op2iuPIRvqonsjbg40VzAHV47wEGZXIMnG0eu1CKmqklBcUfzdDYJFsoV6fwGkSI5wwhFX/VIaC
	b7ZjY4bSsvxTdWXX+GTK0AqsvDb9/SRBrqt7HIuy2MbhXLhT54vm42pbJEPglusCp8d2Xp+yfBn
	suOpvefaJ412woOLjIG3UYAogqI54537h2sWq1pSxB/XmJ8Er5ORbwM/2CzhbFdOyCfWwc/ECpI
	SX53GrXAdoEh24hDqAHJKSHCf0uFbWDCRlZ/Ca9Nu0XghphuGr1CU1y38MCF75+d2SrX/wAXBDs
	Fbf6d0DlG4CJyEL0962ydhC2hdjxxY8jL18jn8cfbSlrCYqkoCjkq3QhVcYJHav89rwcbmJLTBK
	RWzYZBTRloqtcSvmSeeJWfGzFrpK
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr454263055e9.35.1792141082627;
        Fri, 16 Oct 2026 01:58:02 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm27971455e9.1.2026.10.16.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:57:58 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC
 input
Message-ID: <atHnFpMVpoumQ4UX@Lord-Beerus.station>
References: <cover.1792139809.git.stefano.r@variscite.com>
 <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
 <sashiko-outbox-174034@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-174034@kernel.org>

On Fri, Oct 16, 2026 at 08:49:52AM +0000, sashiko-bot@kernel.org wrote:
> 
> [Severity: Medium]
> Does this patch also need to update the simple-audio-card,routing array in
> the sound-wm8904 node?
> 
> Currently, the routing in arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> still maps IN1L to "Microphone Jack":
> 
> 	sound-wm8904 {
> 		...
> 		simple-audio-card,routing =
> 			...
> 			"IN1L", "Microphone Jack",
> 			"IN1R", "Microphone Jack";
> 		...
> 	}
> 
> Exposing an onboard digital microphone (DMIC) as a "Microphone Jack" causes
> semantic confusion in ALSA userspace. Audio routing daemons like PulseAudio
> and PipeWire use widget names to distinguish between built-in microphones and
> external pluggable headsets.
> 
> Leaving the newly configured digital IN1L input tied to an external analog
> jack breaks userspace jack detection logic and presents incorrect routing
> options.
> 

“Microphone Jack” is the existing DAPM widget name; it does not select
analog operation or enable jack detection.
This board does not configure microphone jack detection through
simple-audio-card, so I do not see how retaining this name would cause
the reported userspace jack detection failure.

This patch adds the missing IN1L DMIC configuration.
The same configuration, including the existing widget name and routing,
is also used on the Variscite DART-MX91, DART-MX93 and DART-MX95.

A more descriptive widget name could be considered separately.
I would prefer to keep this patch focused on the missing DMIC property.

Stefano
