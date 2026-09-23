Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F48383300
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162395; cv=none; b=U+6lI0plvY+zN4sXl7slL2QZyTQ7KLRUO8fEZVBFyRBOnlxak/J09jFI2yjYgk+i5xMypJ3vzSY5ZT8Fz42X3dT5hEMWuSY3VwGxWNKZm/dPJOhMpnSe7/4f9TyXf+Lt6FkbZF4+QLHxm2RqAV0F70jm2ILFeiAsCmDIR5GiDVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162395; c=relaxed/simple;
	bh=0L+s1VkLpLCjh6wDTFg0SJ6tYpQ9eOqBt93snrw7zDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XI8rWW92RAtaNMBFY3iCZlkglJFUfPnxYVDtoCnSrzsZ2Mc/KWj0gVeGH0HD5WxYkHc4BrPmaztPTguTTgV/PI9iTZ9sfdThv6VOo/crYYbJaVVZOcLB8Fcj31C75SkIs5RTntwGhTm7fwHutpS4evu+/XeWp85lxbhoRMTsxW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+GXbVux; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+GXbVux"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a990so596601a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162393; x=1790767193; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0L+s1VkLpLCjh6wDTFg0SJ6tYpQ9eOqBt93snrw7zDk=;
        b=R+GXbVuxJof1Dhks6rcGfm6D+qA9sbHsG7lvAXptkwxCkD5JeBaUgoVCIyD0QbvzOq
         XYNSVWiKwAivCALAP+J34+VpoPw+FrkbUB/aZ2VXs/JTxwKL06eOpwVvZ4Eoi0LmcV7u
         6WYeG8jwqRX0LxcEfJ+lBHnGQhmds0FQ69VWaKxAxKXQO+C/757Ask3f2hLcZPDXmoSv
         HhkQUEtch0VpWHNrUgt1l7SHbc9PcN7NLLdrUXCv20I77VimVDfCijVTphUEk9BRL1Gy
         1iwTI4+12n+dC1LQazQrCAg5eq4kXW2RbaoLHiaUhbnEg5MM0V+0ytjg6V0mzVIQLE8W
         JPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162393; x=1790767193;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0L+s1VkLpLCjh6wDTFg0SJ6tYpQ9eOqBt93snrw7zDk=;
        b=iIcaBh1eTRlJdb1Zfoxtf78sMB00bDhQMJPLMT4VlbCykM+tVbUJEw7rL7iK6W3Y1P
         UXiSPKjEkmV2fogsZ2jWXXWNx5p7e2YRlF1gmvicnyJmTFI4wU9ySkJmrAztd9Kh9ncI
         /rJ4ME2lKT2FiLookogp0grP/hczOy6e08ldy04hKRDfIctFo04FgrdIvbz5vS3fDq9t
         FlwnwYWHSe0wPFF2QmU57wtSkV/i1z0tfBOkhNTMa2wox2kDeg9amkWkWWZs+pqKKZw0
         MXEDBG9uoL9alB5ZCff0rJKm4Jc0qsBfBO+EGgoGdlAtohR2jDVtvP4Ud6cPkoug26L1
         Wk2g==
X-Forwarded-Encrypted: i=1; AKwUvBwpJrZHAtZnjJ5kS7AdfLF7MYRtN0SMd5HYE7nPYoTAHKcbvvH2Fhy5wwwp302v1ewiePH39451hgjAtsIQvws=@lists.linux.dev
X-Gm-Message-State: AFuF++nl6VNh9EtbYnVzafhGl15E/uYvgQKUk2gP1AfulB4OwrlJ270m
	FlV23bdKTRHWxfoljItSjcEhtsRge5CtmIDS/baZWex7is0wFopxUp5/
X-Gm-Gg: AYBFou3yCcXLzlzq301F4NLHlTCDrU3E7vbSFh9Ro9xLm7ZMvdXDEsX18bp7+MMkWBi
	BJEgwkKh5RQrjDSibGPbaGkuxWvBgavXxhSeMT+Fxr8wgpgtNlOsFO6OFN5AJ6y/reiOKAmz4ia
	M3YGnVdfJb0Ch/xtFv4uaolzDgz7VUC96nVYrWWeG1Lv0ziASNq5ZeXxFBP9QL+sQkJg7QG2l6r
	zu3/cfDcm6hIElfb9qP0+8q0lwBFTWkF2FOz6KqMv2X9GkcnWnD0+UpFLA4qTI4bpcVgtm3b3rk
	qSFGSNDu06x7fy/ir8iQu5bvGR0euWY2JUiNmM+0+yr8Mg5SFzxv8r3Qh4XnaTr1QbZpFy9gPGG
	txBKRxfquYnDpDt4BU8QLnZooxjcSf1+UwgphImDJIDLOWArP35Sz7MhLj4nOxWXifp4Rh+4V55
	XvUKzCB8T+pnGO0Olm/VVbYeeXDmSRw8RllxusRtKkD9c2yQ/27OML75ogc0EXYjTRuLa27GNqZ
	d6Yrtfo
X-Received: by 2002:a17:90b:3d8e:b0:39e:4c80:44bb with SMTP id 98e67ed59e1d1-3a07e520a8bmr1848980a91.30.1790162393208;
        Wed, 23 Sep 2026 04:19:53 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm4722646a91.5.2026.09.23.04.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:19:52 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [RFC v7 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 11:19:47 -0000
Message-Id: <202609232340.ApologyLee.lhw@gmail.com>
In-Reply-To: <20260923104559.GF3864833@google.com>
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
 <20260916130602.GS11487@google.com> <202609162200.RFCv6-0.lhw@gmail.com>
 <202609162200.RFCv6-1.lhw@gmail.com>
 <20260916143832.520721F000FF@smtp.kernel.org>
 <20260917112840.GJ1605367@google.com> <202609172115.ReplyLeeR6.lhw@gmail.com>
 <20260923094539.GA3864833@google.com> <202609232015.ReplyLeeR7.lhw@gmail.com>
 <20260923102812.2353292-1-nbg2974@gmail.com>
 <20260923102812.2353292-2-nbg2974@gmail.com>
 <20260923104559.GF3864833@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

You are right, and I owe you an apology.

I submitted v7 within the hour of your review, having read only the
three comments above the diff and none of the ones you interleaved
in it. There is no excuse for that. I am very sorry for wasting
your time.

I have now read the whole mail, all 33 comments, and I am reworking
the driver against the full list. Where I think a comment rests on a
misunderstanding, or where there is a real constraint on my side, I
will answer it in the next submission instead of silently keeping
the code as it is. The next version does not go out until every
comment of yours and Ilpo's is either addressed or discussed.
