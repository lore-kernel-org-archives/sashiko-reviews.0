Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7823A8756
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 05:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103581; cv=none; b=DrVdrF9xGw5dGs6rcJcecm4JaqNJtuWnzfzqfCCB2T2T0ekGOOQ6BWKZoL9i20w9s/TU4bgOctKBMiV87XVVOGXZu12ZAGVZyUaGl6a0PZJeUasKJsNyiDf2N3oRwhByPKA5qB7zvw0+Cj1OPv5urmbIp93LsjxzQPOtbDKEzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103581; c=relaxed/simple;
	bh=m3lPXZNnA996zszd8DuLG8P9OW5dv8BQxG5hl7wsYrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BlJxJiw09eQoHYy1C5hf+iU5uDfMi0rCI+Ferao8MOFWI0BCy0yKMKG9/pKzd8kV9u5/9KgqJniqp0F0RwJe8bAssX6mL2ynlgeK6ODhiP/KJSfmOi24SXU42ncb99FYMvUZ8Kqt0ekxCo69WBfSjG7iQEqJcdRTNt44A9zahgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3S7jU4l; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3S7jU4l"
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-398e10200a6so272841a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 22:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103579; x=1789708379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3lPXZNnA996zszd8DuLG8P9OW5dv8BQxG5hl7wsYrI=;
        b=s3S7jU4lv3Aa0YoXuPMYSl7llMCD4/vq2DuMuNkha1yQP3Ef3EHN2QQ0sF9y1UqD9C
         +0WeaEiVyGBVk/nk8B7ARLKQHqlYrQyNPoqMkMJwePT5nz7rtcM1eRgngBhmIU12YNuc
         EBdv9D3UbovGR6WsF+3z5HjapXfsziSihKPXCfrwnQrel4iX81Lxfv7Dmgb71S0Wbg2h
         erkCwDudrHtUVdWDrNYBYOhYYjY1Zlt4oHLIF49u/hQOxQZR15uNXwShzXkOyTA1BMbd
         dm3rFS89k9JfTvr2vBcKFI1v1+c9fjowpD2+2g9/sLriJqzacsstQtUQtai6apD4H+4N
         wD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103579; x=1789708379;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3lPXZNnA996zszd8DuLG8P9OW5dv8BQxG5hl7wsYrI=;
        b=CzU4HkzTRghgDi6UqAFnFMECNE8XynM4NW8hT1sMNL2nBq54zgN59TFxMN4PSJ3seM
         MeF3trArC9kb7GygXZRGG5Z1WIDERDGWLZFLyfngH8vzpFOM8dIEFEZDfjrUBu+ILNFJ
         /QWYdltTJJ5VKYvNBpUwfKJBtYOGpE2JO3rikRuXhJ/JdI2l6ig1TtoSryH9o7ckp6L+
         jKGBRFTwLPm/NzK+f17DxDO5P2szmIcKgMErEena4dGwP4hluCg9Pf9S74+GLDdzPvNh
         y6FTHcSuockCvDBb+isEaf//TxsOUiJHHUFO5EDKVKTxd1OR2DBVWAPv+0pLvkSzOAQG
         x6XA==
X-Gm-Message-State: AFuF++m8vZW0I4OG8skwU0mmjqMVmuRJtIwSS/Febjpj4sPWUEZRk7lz
	YJov2PaBecFD5u57bBB0DjomxupWDfvr/d8DSvTD3h9eIMBk1k/ESbejYDX7ZorH7Y0=
X-Gm-Gg: AYBFou0UudsFz0dVTe4JT3xdMqTTFZVvwbhdFsVGV4iGQ4fZ90UM1bMlNwAzGgZg/SK
	Rnl76Z0d7l3pPED3FKaM1Iz4+Zt/atXgXK5YgFZjTJVhhJPVa1f3M0crXpFCt3h7E5mVfkyITJM
	YRnTwG2o+lDdzdpSMivncGRgWEOO976ItxrOk+R9SEjaIhVecFsD54GYRLCop0nltbL39jUf1X0
	m+hdsALf/Z1ZBDDZ6uTMI3ufibMX72eqAqR6e9eBCUknaDwMCiMHN3ZYgCwv3eRDrhtBaBxmuW7
	6WnKGZfxGnFivN4bRZ8/DVF/36ipD/ELveZE+0LDv083Rq8v7+IXI3k3kJA/F/HRm2nGnprsqEH
	CjLVGecbof0P9ssR8pwzU5KyStZu/UMF8HxZDwlh8yRyx20mxigC94V4m6dPp0RGCaHhZGeUJT4
	QW40JAnnQOOdOSPOYH63XO5zFVEBn0jS7hcfTTF7FB
X-Received: by 2002:a17:90b:35d0:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39d9bd91016mr4090723a91.8.1789103578599;
        Thu, 10 Sep 2026 22:12:58 -0700 (PDT)
Received: from fedora ([2602:f921:f20:17::a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf015csm3274601eec.4.2026.09.10.22.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:12:58 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 2/2] selftests/bpf: Cover recursive bpftool map dumps
Date: Fri, 11 Sep 2026 13:12:42 +0800
Message-ID: <20260911051242.284102-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911035503.891321F000FF@smtp.kernel.org>
References: <20260911034715.219552-1-diannaaav@gmail.com> <20260911034715.219552-3-diannaaav@gmail.com> <20260911035503.891321F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bounds check is useful, and v6 now checks for a negative snprintf()
return and truncation before advancing len.

I have not established the reported overflow in the v5 fixture. The
loop has exactly four iterations. Even three maximal elements strings
and their JSON wrappers fit in the 32768-byte expected buffer. Only
the fourth append could truncate, and there is no following append
using that accumulated offset. The actual fixed maps are much smaller.

The explicit guard makes this safe to extend and reports truncation
directly as a test failure. All 12 recursive-dump subtests passed,
including the multiple-root case.

v6: https://lore.kernel.org/r/20260911051053.283421-1-diannaaav@gmail.com

Thanks,
Tianyi
