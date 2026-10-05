Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BDD400986
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 21:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235224; cv=none; b=IGhZBPNiYyzdOpMvFb0giF5Uj3idkQH1nlAXLd4mwEsCZraGEO/oxUkhJsuujKlO3ngS3RAyUoM2o3StTFC6HSKp49exUlRj64Xjms4B0Y5ql+JM8q4B8AiYt9rIrMYjDFDS1NCMPXhALH0GcwhlQBpP4nw7tkg3Q5wVnFOKDtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235224; c=relaxed/simple;
	bh=7XvMoZmtsZIWL3FDKVW6ia1/PqdjN347tZrevHVbUYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fw4mBw3oA1D1VN1ql3lfFP6JGFY6UkUD5zrbRRQZcw++OT/7VFFdeI2xF/763g0E96uLYd5wVwY33C1jYkGukmYUhTgnxCe/IH7gTuOXW6tMBM/Djr2pUcslb2dusV+UmYitzCXjC0N3MeK0v6DcJCGfQGWg886w7k8/12DOfSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=joPZmtSi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="joPZmtSi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a169d33ef6so13311755e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791235219; x=1791840019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rc7IAhff66GVhjOkCyBspogq0Dd5n6sEZ9HS+Dhw3U=;
        b=joPZmtSi+GmfqOxVUpcXVLDCZpSfI12sjG1vGfX5jkFGHcRVjjnS9uVWklWFY+oBPZ
         U20hiG/vOZFUc4D8hPTI88MmRHtMESJwEtTvlBFNqWhRKMc/x2TILozbuD8KgMOnFlgd
         R6EhMuuPEyHGpNSPgEeR6zAlVPCItlbL2J8f+3hKoNaDTogiheFmuYPI1BSighb/0rSI
         iMwWc6P2QRRgAQAMz5+CNV9pe7z/y8wz1BLyv9hu2iqWAOUF56iPqWzDIFn+knNumxb4
         clZZPqkDPSt0I9Zs8DEVeE61oBSkyzOuZ3d3ou9VHWHOVmGRJ/lqwVmGYyqjY2FBY9/4
         LrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235219; x=1791840019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rc7IAhff66GVhjOkCyBspogq0Dd5n6sEZ9HS+Dhw3U=;
        b=EACA4BnG0zZif+koxyddTwoufStORq9JIov+1OUBawz0256i1U4SgvNKmvuy3iGo8P
         E5jcE6TEqYvN5tTMuFnrkdb8qYaKy7RiLxO2biaJ04jdLa8Svt8PZsZLp3JSKGHbJUmD
         jNP0/3B2mrDarJPs8t4IYGUBSS+8Q1pXzzUEYDpL/VrOssHhWgKjZwuO8q6SjlT4fmen
         /4xtqwfnA4Q96BCiOJQNhu5RkGKXkRggPdDVF16jx56zHZSaO3EXlcrgzhVxzTttXx2d
         LCScAwOQfLSb7NdEfe5479V6964QQhK5vXxSU7w8OwE945mY+Sr5Q8YIcSg91/y/dcwm
         DsrA==
X-Gm-Message-State: AFuF++nnOFqYLiTc+9rQtECPzAn/uoUnBX7sy5zB6x2Uowca6h+vtDcG
	b2vItnDls41o1yKj8KgV4eyV6ocibmibE12NDLkn4JsIns/KkOD/1f7swpfTCz/3az/Y6JVTaN7
	aX/OqnQ==
X-Gm-Gg: AYBFou37HqdKUKsTdT9U7LIJpcY96b2LZ/TSsS6M1g9Dwg3HVnndv0sOOJduSe39na6
	WHDdSmtb7NlcGMJMsAv6Eq+U0qJ08IhvFXaPoujLLPgBEWX5BXCxL0oDKHHpIeQvmEA55ctgpK4
	TTDf9gx2C1tDFSYncBJElBzIwXnEGaa+fL4hm2VlB58PIjymjdLj1RnhUXCICdZ9tN8IxHBBkBV
	jNHb+j2kDcl6GglT44Jd24r1UN1rBjz5pPuYoezvH8gx0rC++KMy/v5oTdgYb/S/6jwM8njp2wu
	fMO0UzpP0AN6DjVNJ+skTymDlPJUN/Yvhiig7wgf7Vn9m/N9CDTL/tP0m0IuoQCP9H/6jljc/sQ
	hW3gaNia7XKfIJK+b9PGp+rB7nJ3oZL/6aA2dWL4O1nZaTtf0wuncAk3m3CGqCapdTwGPyQGZYb
	fzL/jjC/YicaC5e3ELIb6VJuzQ2637czsSa+he1U9rxU1/aIcePMzr6d8Lr3gZBenJd8QDdAPPk
	tDQj4y1jUv/6nSlHl+NvAQCMbjN0wEQRgRmCXAkuwcSVrO44Uo4W7A50uemEWKbcnm2EnWinNwU
	nF0oEhExD6XVSMqokDbs0xA51ULRiLo9sXgssj0cpDzZEVVmw97K87nzYpiTZ0E7/DRdUynwRn0
	QceHwryGdtlp/IRn19myFAC8tcJ2S9BAp6VZVMM+A7f6AChYKcKgIkNUjmXxprNirY5w=
X-Received: by 2002:a05:600c:3510:b0:4a0:c4:a1e0 with SMTP id 5b1f17b1804b1-4a02756729dmr208314965e9.9.1791235219172;
        Mon, 05 Oct 2026 14:20:19 -0700 (PDT)
Received: from Desktop ([187.40.54.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178cafaa5sm21526585e9.5.2026.10.05.14.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:20:18 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: sashiko-reviews@lists.linux.dev
Cc: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	pablo@netfilter.org,
	fw@strlen.de,
	lorenzo@kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Mon,  5 Oct 2026 23:19:54 +0200
Message-ID: <20261005211955.2971-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005171647.CCCB51F0089B@smtp.kernel.org>
References: <20261005171647.CCCB51F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this silently ignore explicit QoS queuing requests from TC flower?

Yes, and the commit message says so. mtk gets tc flower rules and
flowtable flows through the same block callback, so
mtk_flow_offload_replace() cannot reject one and accept the other.

Rejecting the action would stop offload for every IPv4 flow with a
non-zero TOS, because ip_forward() sets the priority from the TOS by
default:

    net/ipv4/ip_forward.c, ip_forward():
        if (READ_ONCE(net->ipv4.sysctl_ip_fwd_update_priority))
                skb->priority = rt_tos2priority(iph->tos);

A flow forwarded by the mtk PPE does not go through the egress qdisc, so
the priority has nothing to select there. mtk already accepts and
ignores FLOW_ACTION_CSUM in the same way.

No change planned for this one.
