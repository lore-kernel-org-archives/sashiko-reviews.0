Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087134;
	b=AqCHW/HifmyqeghChGkJUeA2XvtFCEMau0jWjAlU45P47earDsyBJjXdZMcs9yDy5kvm
	 iboA2O2hs8+MHZcVG9KvCXT4baX90oAZHX3PN6TONjDeZARnsrf4oMCkhEwuyefgPc8Ig
	 8o5/9gdJzVPyVWyjR4Z4SFAHC2LjsI9WhlsAVMotnZKFMhcpR9el97Md292919BQwO+/f
	 kPcx0IBZ42f1kMHmpBzIw3kJ8mWAzA+7m+5fd7pnC6wpjSAiY4FEXnm6q9CQhX7YtNQW1
	 T5iVM4BgVOZgUxjdH5pEl3pAQGvp7LyiAyfpwCcXVIUH7L4mztwN73fMMtM5KdbBnYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
	b=hCqP+yM/J1bpLxEEIhPmO8IaxZ4Esn69Wwio2vFiIK6PkgrUaV1p4imH8SdrbvYfz3uy
	 dgoTL1edl4TgfIQ+y4OmvG3Se+XUIz2fGLtoY7QRBrQV3hkbEK0XlRLI5qfkZPRyzt4+L
	 v6BcPpUfkrXdwxXEKvngvtglpPMpV6GCy0oPq6ktDyrkpJ0jC/8XaucHMLJsBdiAMzC+u
	 BKoPZO5YfVALL0ciesJUsGuHnBonqNoZlPirBnXdprQ8eBgl4RClo94NFcfAOMF4XLgUQ
	 DpZr3ttokPcdZ4Dqu165tY70oN3Tqt6oIg1o2naNAIAcPAQuhnG97OnDKI9TteWBa3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KultaqGT;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C310606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C310606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KultaqGT
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so3234626c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795087133; x=1795691933; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
        b=KultaqGTGPu278lH1IwQZ6/Xci5M7LifwUaul1lX2Tb5LiL1gAlcTF1xim+WA98fcv
         vbuj9P/8Hnc7uJMw8VTIbzfLpT6d5H/Bl0H72PK963pjjv9eKWaQhlBE+W1lKQsta+yW
         mhkVhN70usf5rDS7L9QL6L+tqk/OSLCqJm7E4ebEiMsotAPehcNKniwCPgQAEnWtWUTM
         CKX550KR+Pub4rcdqYPmZNx0JKVEFiuYcOzDPXqijJkOivJbsJZw1qrNrNf1qwVzgNgt
         badu/cJDXDVHbW50jmXu9EsXE2oRHUAKB8ci5BO/izxXr1ujmZHp5gtnQBj3Ufdy5E8x
         b/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087133; x=1795691933;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsZrgdffbixcAT0MIaZMhRKdxCgLgvf8zPgL2cWZJCE=;
        b=gmCo0AigiJQRSe+gMPyDfyuQvrajc3bcpGJ2DxfpSabfRBB17R71KeVq/3jcWNTlin
         N9e4CxoSV2u/UO3+uhbvEuANxSa11B65Cd0VmSk8OajuPZUeqT1t0FD8goua3eBtIfkc
         MNgufwVKI7hlVCh8VdF6OgS4LlG0zfC/1SkB8W33nQzx3yEJjzpRoIPuoAhaxtru96At
         aZwtQAm2lTxYQ6wEkqSImwh6WCJb6xxV1xbVhhwPZEkcG/ixpxcbhDz4t5d1+zoO9yDe
         +WtJzR9o1Dc6Yb5S4a8UnV4misKncyAKGyJ27LslKEKa/mKG9MWy/1qAdvo8XVyWpUxO
         mziw==
X-Gm-Message-State: APuU4Z9lb1pOQu/txXT/riQ0H/arGMbCpxt1JAAFkqll5Gak38Qrm7MY
	zAXxAAntfuKbvK/1IvCz7Y15lGyp/5rDjF02vE44dejCne7nGMCYRS3bqNb2cMjFcNGK3w==
X-Gm-Gg: AYBFou2pYu0NtLNwUI65jpby4N9ZXb4Z/ZnyxMsrtisdRGHgvoJpYBqVG/N2WsnM+y0
	4823a2oNPePFCYOnAORViiqFHdo96u0ga2ooPgqYr1LulfvMIgpG8U3zXiWgSvG/e/EoTdVLh/9
	PWb1Doz+p+BQSCfQSfpdM0iVEx6pGzjxhwOMZrtd9EU/2fQxUjc14/k+PP5dnSY55juEQxIAVOQ
	hV+vgTvXf/VAqlDRzD44dioU++SYDRyS9KDEUmfG9Hp8DlLHmjS3JxE28gN/hxw90AgUpD3GnZF
	MTFmM0k55w8nNJ4eYP3sZRJm0UN8K+V/UG+o1uijO2yexdB9anGPx0PeUsJ6GonbxZfrw+3FAuF
	qw0OKMTCq8zR1+nXndaqYlr4XZIf8CLxTj9Y+0NhJZ+y/NaDp5P4VfTVKZZ/ULGOhM7qv0q8lB8
	D6WX6G8y97osd0CENiefNSy/Fn/ib0X2bHM+uLqvEpEO3upbzarNa6LYCLjK2Cb1yR1XxVVCH2T
	oAcSVVli9ufRG5drsMYCM3uXh8WYx9NYU6HGFPV/szaAzxYLidVh0/R/2NYgG2+4xjwx9mmy90O
	0b80CK5bxJpDDP2LA3p6c57OcW0FI1ExMfyRnckyg0IU0u9n5sDhJa1762wxyHXGy9QvCEcBzgk
	PGsMPf/rf86ucHuLtm+CkrnpiyyAotByJjjwTrT0pd6j8NQ==
X-Received: by 2002:a05:7022:7e83:b0:1b2:60ab:1e9d with SMTP id a92af1059eb24-1b543c3fb96mr6183656c88.37.1795087133021;
        Thu, 19 Nov 2026 03:18:53 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm20583004c88.11.2026.11.19.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:52 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] drm/msm: release the cursor flip work before
 the KMS is torn down
Date: Thu, 19 Nov 2026 19:18:47 +0800
Message-ID: <179508712793.3615754.817569571407027777@gmail.com>
In-Reply-To: <sashiko-outbox-222715@kernel.org>
References: <20261119023604.1495603-1-shunsheng1218@gmail.com>
 <20261119083133.3437277-1-shunsheng1218@gmail.com>
 <sashiko-outbox-222715@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi,

thanks for the review.  You are right, and the check is redundant in the
current mdp4 code: mdp4_destroy() dereferences mdp4_kms->dev at the top,
before the new guard.

The guard only protects the CRTC traversal this patch adds, and the v2
commit message says that it does not make mdp4_destroy() safe for every
partial-initialization state.  The existing problem belongs to the separate
KMS initialization error-handling series ("drm/msm: fix the error handling
of the KMS init"), which was not merged in the msm-next baseline used for
this RFC.

I would prefer to keep this change focused on the cursor flip-work
lifetime; if the check is more noise than it is worth, I can drop it in a
follow-up revision.

Thanks,
Yaohan
