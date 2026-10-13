Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E160048D890
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913076; cv=none; b=KMVdJoBAW11t1Z6Oqr+CJWQ9VUg1vmRRC3g2bdtBDE1A+KqJqHkZPyH+U4ghQMib0vtsHsUcLvTYyrrjdEIYNvB4KGk5NEHdsxg6VIYvDLMq+tnDaGMgm2PsyNVC748/bfqCLphCA/vvnbAmgIMP1sssT+lxMcAyjdqFnH/kXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913076; c=relaxed/simple;
	bh=IBWm8OoDuOOoK6QNsoCkV6oJjvsDZlll7v/MDvILjss=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=alC0+IgmaH9X2t60/IgKrEOSsRTG+SAL1jW27+aR0KNBHtGtFqpcGnrsIKSHw/c9MCamuiBEXJP4c+n4aT/gqEoCmL1ZD2Y2iN8UufaAgDRw7I2znFx8r+iZ2lCTuihBSb+bIrQoxwYlGiiApGgC780tMJ+wBnFMnk02a6qqpwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=D4Yj/Tdp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="D4Yj/Tdp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c399641so32668855e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791913073; x=1792517873; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwog7Istc+fIBrJkEcS1h+8HETAF7LvLAVFr6xgg7kM=;
        b=D4Yj/Tdp49q4zwwBnkIfVvttZt3Y24s2MgjagP2C6Bz3xllZk6sGaNpXAhurxwKhVa
         S15zHvbMDuNWF2r6CDNZ1r5cZf0WWf+Du1UIu+sGerHSAWLfQSg534sYvcAVInZ3wmab
         Dh+Sbg0fgG3QPcSKMyJd/cuVhguiUsJ3kC2g1Ino40eSHQ5hwdfPDuWVUSVwuNvUxp/G
         eOmo1bQ0hzcPSbhCT6E5yNT7X56j1DtP3Mwijcfhht66BsokiLuysE8VZ6ToWQ2cAnlq
         IpF1Z7zde4EyDgte/U8/APuoA05EoGVb0A8YWNkG6z4AQN8VRfusBL2o2QCLN5lB6e8x
         avbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913073; x=1792517873;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwog7Istc+fIBrJkEcS1h+8HETAF7LvLAVFr6xgg7kM=;
        b=VpPsx1ujkrFtDcHFzWABeJ0Yv+6gPwlh1qG6pVx1rLPzy1Cfm0/mSw490VcVEsXtUd
         RXm9YyfFNHbsiOmIFxfvEfcu7yHXExa9W/OoPUpdMaK9AXJ8fhAkyj8p5kHdpxURKpF+
         pFaU2HkgTbLMi8cBSK2ZAmo9l5N7hazpjF/gxxh653aO80FbRW73vxmkuUrn5ArKgaIH
         sHmHJQ38rlCTZCRqIkPqobh8JIeGk5RJv7FwYUsWmlkcdQaflKxF+jqvSu87jcv7P1F8
         l4jFhdO/xpQy/un4MV5HNTJzt9c4fQMK93USNPVfB5QGVyZfGwlU27h9ZSnXVjAtQIM7
         iyLg==
X-Forwarded-Encrypted: i=1; AKwUvBzL4Anzc5P8dLDPYJHA4pNhSN5ZQ3wCJti/2VTituZiAwO4V/AT1myxvwQuRUAWBmxvokiB6j/ZzGHdLZ0GKWc=@lists.linux.dev
X-Gm-Message-State: AFq9FYLV4gh2/Hqlq21UJnVu2AIT2//2dW3oYAe2vAfDquLk1KCoI6WO
	CkMt/oeCVRObZIHD2FHJa/erkg2VuMqrgyitLFhJXGL6Mr34dvRS/Y/UCz/lA0DOgPLVYKz3Tl4
	MNO2pa7A=
X-Gm-Gg: AYBFou3dfvYJOH1fLeS3XXxbLoQzbVKZHkQAiAWprSRnfbiF8vhnEMP+9sZYJZH10ld
	ApGHont3k8XxUKLDTbeE5aQB4Ic+WAA9bDdqBIl6hPHMdCtZx/PR6B7LDEivM/NNS1L6IuFmp2V
	YyK7KgaSbriI7d/X3CPmuRVAFh2NBpBPFh7mQJHL66bFCFt2CbX9g/yPjq+pCH6hpSZr2KiOBsU
	fTOc9oZFvKxReakXaMSvBZBCSz9ug5QdVRVFZDuavGy+49LImufkJODWn41CiX2TYo4uD9Vh9Lk
	7Ipc58GggD/8VryekcMpqmfj5RKM+tjW5IT74Z0BlKge8KaObSn5JTd+VCYvVAbkA4gHOFtmIx2
	XPGz2pPRz0qgU7qvLywO9jOiJINAAvXzJgaHuTylY8XkbhbePIOrw8zxEBP7PbJ4fzfqvN8s/UP
	zGV/CiM0JexGQMLmHZpnFskWQHZqrK88WnSpY/HtzHJBcrE7OPOUsjvrav2yQr+goKerq2TFdYG
	/l9FC25z6YqOVyAEYvl7x5X/z1H
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr260249025e9.33.1791913073155;
        Tue, 13 Oct 2026 10:37:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19303d518sm350899745e9.0.2026.10.13.10.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, 
 linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <87ld81v8y1.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
 <20261004205551.6279C1F000FF@smtp.kernel.org> <87zewti2pf.fsf@bootlin.com>
 <1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
 <87cxtni7m6.fsf@bootlin.com>
 <179181904945.33566.17882786294681341398.b4-reply@b4>
 <87ld81v8y1.fsf@bootlin.com>
Date: Tue, 13 Oct 2026 19:37:51 +0200
Message-Id: <179191307176.266355.13493126045902473311.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vwYzSJnJvZdAYWxZfVM9vG2ExZs8LLQUp+M4wnaHYLA=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnncvKjl3suKowPOtp5+qSoXF5T18EXvDv/W8V/7Xjrt
 14gsle3o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOJN2Nk2GKoapzC1Ly2w+Wu
 5vXmWObm6B65iODHAm93OqTnlmlPZfhnuvOiacDxqbXP1Tl0pFKOX85fd7Vr7bZFM57m5izU5nr
 OCgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9


> > So 2 possibilities:
> > * You just need the .hw then I don't really get why you are doing it differently
> >   for this clock ?
> 
> True.
> 
> > * OR, this is one of the those clock where you want to check DT first then
> 
> It is not.
> 
> >   fallback to a fixed clock, then yes you need parent_data. don't forget
> >   the fw_name (which I did not see here) and use a local variable for that,
> >   not a global
> >
> > Did I miss something ?
> 
> You got it absolutely right, and while implementing the change I
> remember why I used the name instead of the hw pointer:
> 
>      clk_hw_register_fixed_rate_parent_hw() exists, but
> devm_clk_hw_register_fixed_rate_parent_hw() did not.
> 
> So since it looks like most of these helpers have their devm_
> counterpart, I will add this new helper in clk-provider.h. I plan on
> doing that addition in this commit because I think that is what Boyd
> used to prefer, but I can add it in a preparation patch that is your own
> preference, I don't mind.

Separate patch for the new helper please. Same series is fine.

-- 
Jerome

