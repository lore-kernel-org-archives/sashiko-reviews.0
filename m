Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793115552;
	b=QbqQEtyZDjW7xk+dF2y2yFNQ5cyR3eMUGXMmVEaATvuYWhHhyQJSb6hzPtB/AziXb1lj
	 Ya+mBai6m6wU86PoGBbXjjAS0N42yGgFDqDGFmAX/PuyiaVYkuRAkXcesVXVYrC79aBhw
	 MRLsfZaLLP4/51+/MA0N2CUUx1kSm51Yo4rwRbtGgs50CWvUO5N4ecmw/6apVAmWgyCGJ
	 Aqp6/Phdm+BuwZaPvKODyOpg55iaUlMwTGKsdNz4SYPSNgF+1TefxO6qpX7v2K3IQAmkQ
	 YgYU2ND86fobK4iA4OQP4/Zv2crPtuWS/2zWyhXTJgNVPsxHfj1jQEaxBwjZR6/CVmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=8jh6Jxx2tdaMexEWwJuCJFDK6A3SmElL44H9Ig/Sa8g=;
	b=bMck7/JouQzNVLEZuzv645SyyyLCUYMPK5qYmfwBFj+7xdsgiX8wHmrj76brFRshAuPS
	 HZAmjMHdUvgf2CdJso6AfQFc4q0nLS3XTLwUNFXJHlVXEJlx8ft1q34oRgrBIIqQKb/JX
	 cKVZ4EFH+rOgZOYD53nMMgQ875M9hK3V2RqSwiC39v83pB0oUv6EbNFsPu0mlHuttnNmC
	 yjqZ9w4OZz8Ash/oXAtwHMMnVMlMDgmFBIKMHYi19NQzeMwTOU9RRtxgvWetegyOzhIuZ
	 +bPflQM5a/dPl9DEUqm7bmUwMPriAfpZNZR+wmft86XQyVCWODwmFalrdsDHq3it9vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ct/JiFxH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.139
Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49109606B541
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 15:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49109606B541
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ct/JiFxH
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-82757b1535eso1931967a34.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 08:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793115551; cv=none;
        d=google.com; s=arc-20260327;
        b=iLC6NbTWkurRaH2Ks36tWCE+u/wkiO1QRi3xOZ98hjaHOukSBPyF8PsR5WoDytdNlL
         CWl5RIQqgcsWl4DnJc/rWDT7ZBY5JY7ludlxsPjv4GsZKmwUAhs4PGvAK1GgOnVCm1Hn
         HKDEnsj3BzP/fKzUu2mFvKu7Qic0rHa+MoFkghlje9oEJGA0PkqHBPqMsiBq5HTr9IGl
         i8TRkJhGxOJmA42QpwFe/mmYUgPJ4TGrrlpY3MiopdK+yJmLzXZpgndpzjG1E895SUUd
         6Ubkz7Eh9P7I4l/Bn7L1jYpWnuMCYDVjhiXPlEECyAG27vt5N/nsQ8BU4YHEdsr+ckft
         L2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8jh6Jxx2tdaMexEWwJuCJFDK6A3SmElL44H9Ig/Sa8g=;
        fh=/QP+n2O4Hyc4wPS4zFFRlhIZQ4uvqm/l12+HjjpmfsY=;
        b=gKQt9qHseSzBYdCb1MFJw10VyRrMzHBa9SXoejuYf79+k7qiLYdEnCBWUiGRP2AUyN
         WWrSbzRhk84fgWb1xPHihB9cwUAQAOt8DBZQEYkDB8FmdcMKLpKFgPSTfBZP1XMyHgc8
         u4EffrI84QVYjaTR4MrUAkn4bSUc4o1nnVihmymvW8iOYoutzAO4z0urCMnY5kL/QXL7
         GWDoTyKcQ681cUoH3n+Z6FtfEr9ZssUtcrxx/3bPVGp2jkETUAzKoWje7NpnW/nu3ZxX
         gWv92V9REAO1sT2yTvlfT8B///hbvKYsga/Xnu4G06YQeG7yT0AIFT0uDR8zMTelRrbN
         ZMZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793115551; x=1793720351; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jh6Jxx2tdaMexEWwJuCJFDK6A3SmElL44H9Ig/Sa8g=;
        b=ct/JiFxHYD5ymhP9DCzEeUP12a4xatV4Xodw6d36CqsRprhU7I0AOLwEsaHkRUwFsX
         fNKoiWB89oPl92c34f9bHkXGsUWbQfjAiW40R95ei4mrpKlvHleMuXZuh8TDruGx2jyF
         btJANuIzzdmL6Tw6zshcnSgaGJc6KkGYnndPMF/Snrv1SEFaeOSTqOcrXLKIxj2gsBDE
         1xtyyr2rfqNV9NEnMXH0xDvOk/tpx+EDD9YPvxgcq54D6XmIyGjLgDR3Ztui/YUroTB1
         mEeMqSLJggbjM1kqdeHlFzvlIcEaVy7Rsrt2ndf97mEL8DyNozCgEAV88zPd5yzpLNIW
         RD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115551; x=1793720351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8jh6Jxx2tdaMexEWwJuCJFDK6A3SmElL44H9Ig/Sa8g=;
        b=ZkX4Vmoqa0zgoyS+/+nwilHo4oXp3qrcSu5vArdfZMmI0jDTZ4Jz8+LB3RetMYwkE8
         KpouTBdjZHDURZnJbXsURniRTFPIT0jFd+McWVsGVS+BtgGTi88MrO7Twz9X5qHdVXM7
         2ET9VdumAEHrz8xUYMokukEP4C6qmLz9NrlWs853K9UZvCcYzehUfNxeJ9cKQic24CCR
         vW3z602Yc8QRGQx5O0fBjH9jMVgZpqYP/YJnYXLiFH3bLl3d4qlt+cQ7DR0uE0wh2tfD
         OWmVAV8yWyNnX//VoGOff1PRojrjdrve1PCVeG1yhXbXxTwmGrW2HUOI1yuzhTL2uSeZ
         85ZA==
X-Gm-Message-State: AFq9FYJgBx8ttFWq2BAPiBa6ahHQBN0LfoWGh4i4DO6DiH9/jYodD11F
	4XQKvjtvVTkotlns2Hc4ywQ3mH8DjRtwXLeRH6O+Uajs7u2S7fJTZHtP/vqorzs6TyK1yMEl2r5
	1h2FojKkYGub24nerbupJjKQyJQSTv582KmO7uiq3Xg==
X-Gm-Gg: AYBFou3uGp+VmdFwIM2lRmQ8/Yx06XuYUvJHS3baMwE6F2wutMjJ1cPtWClpesuZIs6
	I+2fWpmIRU8wBTpvxqcAWrsvTJjHxTYUXYZtrmm3gNZSqp+AHnqzJ8XRyskwD+pC8ghvYYLGF/v
	id4jjQHCj4FPBe0UJZBpWPgwwwGWUacp2qokioDS1M4Vn2siqdS9htved4FCA03xdmIoWRs4F4d
	kQDG/Cpn49Zu7qDa5cTGJQSkpQNHYS7qXKV9bsUUY+TlWhyG2tTqMB/qnOBkGsV4szEmmH0Y7tl
	9aBz3G+q8BNaeGgL1BHw46+tiAWy7YqFDgL5Ul9woFLhYymHtZUg96VrCXrPxf/dNemireGsEoE
	2wshycDuUV26LtsJZVzBL9mo+s9XdNR+4UxMU7GhcZDjf/HtsyG3GiG7vMKcbhJMcez83rfRv
X-Received: by 2002:a05:6808:1b0f:b0:4fb:ac9b:b07f with SMTP id
 5614622812f47-55c003891c1mr6060735b6e.49.1793115551041; Tue, 27 Oct 2026
 08:39:11 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027082236.56724-1-dennylin0707@gmail.com> <sashiko-outbox-186286@kernel.org>
In-Reply-To: <sashiko-outbox-186286@kernel.org>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 27 Oct 2026 08:39:00 -0700
X-Gm-Features: AclHuK-mmp76fq9pZeuX5A4D73PpytefZnzEC0dLCyPSsykm8KnPnRBRfK6MUvI
Message-ID: <CAGEkeHeOA9HOKQXwLmbHRfq5uCAM5DnGXcyPfAX3h16xA2Q6BQ@mail.gmail.com>
Subject: Re: [PATCH v2] tty: discard flip-buffer input for TCSAFLUSH
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Sashiko has reviewed this patch and found no issues.

Please disregard v2 for now. Further testing found regressions with
PPP/SLIP and a locking issue with VT selection paste.

I'm still investigating and don't have a replacement ready.

Thanks,
Hungyu
