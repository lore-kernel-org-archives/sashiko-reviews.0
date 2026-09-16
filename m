Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074052ED31
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568592; cv=none; b=iUWFDeX0KSwvQNtGPe9JTrZKkxZPWudbu5f+v3E5oLslFOGxQbj5tLC4wJvhDdNkHJjDyy/8YsjJv3hjz6pKQUWGhLgs4UYnbGYbTLOmYaX0Tu0SGHqrETdIsTDI+pxrE4kvNkDOf/eoGc4VgiewB0nTWNbwIfLvuBKc1fFC1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568592; c=relaxed/simple;
	bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=p/h3mdV9h+LNAeoWTFW2GCKPLXfLE+5KjRLwarVHWLLVeLskWTml5YxfkD4/M08V/yZMfOZTbQU52uGMCoa7kTz9cUl4M7hF12L7kTBJ49GEiXayg5tsB7vEW0TZ/+DznEPMRwqL8smdOSbYMUJtcne5LK3/4imToJJV1h2kcwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfwPMeeq; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfwPMeeq"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86efece610cso781093b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568589; x=1790173389; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
        b=ZfwPMeeq8QySUAzAbP4KTP1HOb5zB+mra3BBNgs+yGtH4crWdUVg56iKYU2Vyn1AAD
         IZ/K+nx5IuRzaFUBL2V1BwDqNRHGPVwGuJCoJpccw02SpGu5lh2mGQfhqtYXmk6JDPi2
         xmDoGLR8KRXMsWRpXIC87ABRqu3tHR3+F5ITHuNOBXFFfJ/Y0WP3rirVoBJiDXlySe9N
         NFnrmWx0+xnSK7i62pGXnfIdd2mqSIhXjtfcH+DDwcffwvQB7ZQ7H3rKoQATtW3IchFG
         WBQya+HZAYrw3H1i9e1eFIW+bh0vvHxoVcPJMXm9IpkawVn+DeFMrAq6W+72sB3fEJHa
         StGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568589; x=1790173389;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
        b=iAZ48YebAbqPtgRs9GrphMRQKBVG2FRq79RvWH64JIFvNZDGben/q3g/KbzJvthA8n
         gSv53MiK4bF6pMlzcPhMRD924wlY9CkDDsIioHA4ykD5c4hI1h7ecw0WSfpzSWzdLb1l
         464kBsrL+xkkbYN1fVh07IZNuLUsw/RcGf0lG+0K/AZjc5NwpW3PhmuRfU1AZkK3JsQ2
         ijfFbTWhniV7SipXEZ92Qz9hRmzeW2Yf5qL41IENYNBbYpDjLS9Wt9pn0q5h9sDHx+wt
         UfQ4CfIL0c0272tKzg5WuGiItLHpR3u90id2yxdeGIIxhsux2I8aASYUGub1212CZT4w
         sT2A==
X-Forwarded-Encrypted: i=1; AKwUvByt9so9mlznEAZFoOr5qBEaOvvrp2OTkX1IW//2xJLTC2GpRDjn7EMTkFbA4C8/xNY49fDi8QrpWw7eT13wabg=@lists.linux.dev
X-Gm-Message-State: AFuF++kUQ4+9NY0fGTcDmS3HeSjw8xrmByqlLBjIjhvLYLJ6u29P3olr
	6LvPyl5PyUKO8/gy19plqnp0sSeX6evFc/neTZ063X/w78mTEP3jGpN/
X-Gm-Gg: AYBFou2DQYSGd7S3G3K4/sna0BFBR5jfpNx4F0F+a7+83uoG6mgCyBZnuU2qc5T+Plr
	YqJg7mdSaZTdHy8rG2Pje48iipVUp2JWovxpM2mNjJtxz1+iRjf+lSvMBcEkIRs8G717J3XcERN
	vXfBTbtejFM4aa/NyUUxb5MDh5LirnjBL2ITH7fjD7DuoUn71HtpDYm92i+V9nvPsjuCnhfkFeP
	U6ah8QuhDniX1ix8qLq5ZAsb7HbycytEuJBIEHvm2uRaHeoGBDC/yDiwo789R2Lvz6Uui/Nsze9
	ccNLvP2ph8Vp5fWSSrz+Fx4AuSmfr07N56YsjA0OXEvnlhCdEQlRwZ+mqnWVSuiKCAYmoDQXl+3
	kCjgripTmTJ45TawvI5HWoUAhsdg7nm91jzvtCgjsaYtFlwDlKYbzjoyr5Uyb4WTNDTVfc6ftsh
	AfXIL7PpUDT4qpjWdiJN3lxv9QnQKJ2RzXhXfmtYwSmSkWOcgnsGsK60griMPfTdGP7/0D5OA=
X-Received: by 2002:a05:6a00:4c81:b0:86b:b308:b926 with SMTP id d2e1a72fcca58-87238c81c3dmr5081392b3a.14.1789568588753;
        Wed, 16 Sep 2026 07:23:08 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d179aesm1390884b3a.50.2026.09.16.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:23:08 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v5 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 14:23:04 -0000
Message-Id: <202609162200.ReplyLee0916b.lhw@gmail.com>
In-Reply-To: <20260916130602.GS11487@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com> <202609152112.RFCv4-0.lhw@gmail.com>
 <202609152112.RFCv4-1.lhw@gmail.com>
 <20260915130050.E8CDB1F000FF@smtp.kernel.org>
 <20260916104305.GM11487@google.com> <202609162015.RFCv5-0.lhw@gmail.com>
 <202609162015.RFCv5-1.lhw@gmail.com>
 <20260916122740.921E51F000FF@smtp.kernel.org>
 <20260916130602.GS11487@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

On the three sashiko items: the naming one I took as a fix. The doc
says sections that don't apply are left blank and shows "phy3::wlan"
for that, so v6 uses the empty color section explicitly,
asus-arion-0-0-0-0::led-0, with the "-N" ordinal the naming section
asks for when several LEDs share a function. v6 goes out as its own
thread.

The other two are the same false positives as in every previous
round: kzalloc_obj() has been in include/linux/slab.h since v7.0
(this driver builds against 7.2), and blk_rq_map_kern() takes four
arguments on current kernels, called exactly this way from
scsi_execute_cmd() in drivers/scsi/scsi_lib.c. The bot's reference
tree looks outdated; is there a way to retire these two from further
rounds?
