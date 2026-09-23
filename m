Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFAF39DBCC
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163749; cv=pass; b=N5kOH3Bg14/ecHTfYheIIdAYKIOx18up63Nc8CSrshi7iQQbSVpyp2SvTmoxFVmraL/Qw8izT/st5/NRejcCTB0caN1FjOGVecpqMevfOf2ne1Jx8gXgTbJkTo5tFsiM5ycBe0X0FdhOKNZ24c24SfQIW4T3bTBXSKdGfZe7g0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163749; c=relaxed/simple;
	bh=nM7tbZ862fD4OC0Mg3Y7YqIbQSRAS6s7yXDWKfA5Yyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrCeDEFk8gdEVy+avz2CBLRZVhQzmKT2elGdgW2bdtdRc36/SPDJtlroP9qMjUoiV0sofmYuvG8xQI822Cx0NLjPXZf0PYkpHJ2KYTJLBHzfFBDGxqn9pX1/apbkTwbQR+cqVbzR7dDuzMCxKsBsnVF/TtZtpGfdjb6JnK4Glts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLAsQdFD; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLAsQdFD"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so125251085a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790163738; cv=none;
        d=google.com; s=arc-20260327;
        b=DLYKAV1pyoNVYNEwqK3vFI0F8IJdp+4+SFBQS+JcsDMv7RQtzxV0oGOSsNE52RmQDZ
         dXNrikv+qUW5bY8SIxcLY8yo5lUCMBEIyi6Rzr/EnqUMPP1roHQqNtULF+NhKGfbY1LQ
         DUGtjEbsa9UIfoZhzQGFZr814yTfben6MGCq4O3t8nsMP+BH+etAr3xUrznGigOWphA7
         biZ28hdQoFiLThsamQ2zQv/ltgQc773CttYsL40yA/0qsz3wB4DalgONAAGJmpCff7zk
         B1hzC9/4Zg7/alSLefwjksi7M402s1IZAQYcGkiNIo89MAd7EPh4Bx0gkViCbotImQDj
         OJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        fh=mDAuwFAhs2mIusZI9ah3F5O0wx0xm7KPAs+ghUnUShY=;
        b=RWyI22o/hGUHpYZunrGXZOiwbuZCPwUK1YdLuHh+hFDINTAhspFvfg0vu/Wn3V+WBb
         2xVN2AGDIqS90GeglZwbwyCUdgWEuS/2BmfO9SOHAILYQwHIC+XSW9LfXvmarOr7Jt1D
         SeW0GvPzMRFnIEMuXd5ymn0MFJZkE5X4JzjlLK+UX+nC7aAOns5SEUCoDPti6T6y12n7
         vhVutJSEWAHfcz8lqD3ut9+UiobQdNLED74qViLg5q1i0LT0F6S9pFobISFaiHDsYsyT
         En8AHgINqrwWrKEA/nS9P34+8h6mreZ2B7f3vSB/Qpf+hTNhHk7qqn5X0C9hlzCbU1HE
         05Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790163738; x=1790768538; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        b=QLAsQdFDSHJvOdiuWIUw5GDVD9EIDLtl6jOsbly8R8eJG4PI1TVFssVVn9enG+Foye
         uGNSzjknTYavaC9V4qXMmekiccv6iAJc0ieW1YmbaRW1hFK81iQ5WsPt2O22y1XMABg1
         L0YMTLwU6SnuUMAbUVUzP5+MVS5ZjXPB7Nfj3E+ZaGvz0+LAl9tjBhMyFu+frbkQzkID
         DyfGunRVo1uHIi8Hd/6VilcFhlSYKLxmTlnjLco3ZUJroEAMU1vBsqoaeDnV6zifhOem
         8O2SBFDuZYQPsk0v2iP2sbqTe9JIpkXj72G+p3tNCWPEL3zBvJF7UTOrMys+Ed0EZjwL
         AxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163738; x=1790768538;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pWFPGMzX1L+HVqe105PucXhk0+tLBSplzJw7zI8y/mo=;
        b=OC0h/UtDn+Uz3K1QJ4GrFeduGe/gjqX+4iHYpmBNpiLivOzy56p0CR3HHVIbYHH6TF
         qqO4xzFreHGw1NsOf8Hc2i95nl0WRRTeMNlw3S0et6PHKgfDnO9IFrnpMzIERI5hYS1L
         I9acH23W8FkErp9oUndlDO5R+IPK/KfE97dTwNg0m28lcCnnd10MpkbN9EZgLTAdmWnR
         V7i66RK6IVNFUoBv6O3ccvOW4fdFBlXf18PiLD07cTdGgEMNqHTsQnJ+ViBOTlDpxLDL
         CgRsZL5oVaUu/hnGUU+XlZx7gySWRKP6F+tSDvRHqduN9EyICQl4WRlkJsNarJ+C0ykb
         1f0Q==
X-Gm-Message-State: AFuF++m5IsBeYg/mbvol9TdNRrYr+5TdVX2KSe9sdE4Y2a7i79V9/goK
	Pc1PFtmmZH8LX9vZWC7XMLdHIaYqFVR73X6o79qyj53yI3LVbh53Ghyv9fBinzlqDK5d9VKvzD9
	Nc/PEFJl+bJU6peNquuqDMlnfA52TAjxS+LBUtK7B/Or6
X-Gm-Gg: AYBFou0E2AlrzvIX1mnDCNEm3Hmkgrohim6aQAFhs2WUQWjTsFpAd48mGWRF+rHHK6O
	QPSaZFrBf17W0mUreBMJrq1IaJF6o2FE4Gvtf3CnL7u24/1DanD4SPaU/b7agW9eet1GtBHdsJZ
	jd14R4gvoNwoOSs+jWEGGs0yyscuJ40xM9ZShyF8Ii8MSZ1PShQzJIg42QzlJ8oIJwlneMfaJ1p
	gPFIeynJArnYvBRmuBKyB6zc2jjf/cplY27/m5VyI0w57IimM8dvyTkGNKETyUmrDU3ReYE65fl
	HHJAOd63YJYofL0ZLwRkMcbQ0q40bRuuoLbostHsUhrpvWSTVyI1Vfj1plzTEsXl2BkY
X-Received: by 2002:a05:620a:2a04:b0:939:b94c:3e85 with SMTP id
 af79cd13be357-93c250f8407mr332746685a.24.1790163738125; Wed, 23 Sep 2026
 04:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
In-Reply-To: <20260923105920.CAC761F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:42:06 +0500
X-Gm-Features: AcwNN1WQplWtIF5el8zF5Tmhe4QX7yFqwnVJq9zazF13PvpPkafeV1wGHPP3_pA
Message-ID: <CANHPwAR6+f0dtOrBdwD8C4_cO5HvnpNKNnhxLZY+Bm6h-dicrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for the review - you are right.  The two buttons and the IR receiver
are on the optional 24-pin expansion board.  With the board detached the
LRADC input and the IR receiver pin are undriven and float, which can lead to
phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a devicetree
overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a Makefile entry,
following the existing sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.
