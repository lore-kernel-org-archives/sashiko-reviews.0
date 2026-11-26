Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795720455;
	b=NiYwp3Z2ytPbwTW3urqAmBZCNgw5gIGJ3adG4sAPlQ/E3BS4uHmZrkICQlWQGVENW6Ll
	 o6FxUCMOiHLLSePJ0AF3QNdfIBD8p1GDwKoLBrdg4cVxcq9WudRDM/LHcNQ/bLG3fWkrD
	 nAk5AU8KnZgltQcBZn2o0xpovmdz8maWIDhzlS9JWp1h9MoLDSlFQSBLu2JO9pspz24sJ
	 K/+vDXFMrdnFE9FU8U3SdN6j5r0bR8Zq4d+Zx2S4Pa7KVHvrYr/QdnpbNW43ResG8kyDn
	 qJOxaQJ0SehxUvtmm/w0Tb3F6EEga8nr0QJrM4FPdXutHnUuWvkabdbnSoHt6JmJFVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Z+HrvYkLsnq/67deomAXM5gTuzGmxqPOZTXghSZHfhI=;
	b=U1bmyLBDOM4ta2baYh0ukmH/NxEAcJdL07xqGrBQrbatVOpCdb8/azU2S/lATL/ZI8Va
	 JNlUR37xhHY9BMMsa7tCpNuwjYQAEHEbMcK4EEpsynuSyMVHSEwE+SyVw5IA27MM18k1G
	 Kh3E4tu2AqmSV2vi4z5bT4+Lp0VuINpzBsv0YGx3o+Z7s/M2ezwAkAiXOfHHSDIbXdY6U
	 dBpx1Dwb/QBb8tZIzta/4akHMC3SlpFHlHp6z74BBHsFTouYFjK9OUB/XgYeVQXX+mSNU
	 RGGC7ZyPZsS61LthX0vAvAoUSpE6z1+sXyaDxyD572yDgwCGSvwH4eZY+hFj+B6OPmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FENAg66n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00F606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 19:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE00F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FENAg66n
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-847ac7ccd85so4145322a34.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 11:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795720453; cv=none;
        d=google.com; s=arc-20260327;
        b=Sq7gWuNAmt/YFMMKtCb017+3vDiX6w/9VCEYBW2WuijStS6dk26CCHv0ujD/2UTy1s
         FD9lvr3fQonVTDY8vtG2xFZjJEfJAeOweFrRFY5XzC3qwp6SAiWaL1F3BNxDTibzIPQn
         PSxJX+JeXxhWFsLKp3BV7jcVugGptWs0g9ZaqJoCSLphYx5VR3ZFhZrrcstYrjMwgtIz
         DnULfKA1UWM/A3VUB3+rDhg3qAN+qYGdvcXGxzfUHEscYzNhBQODhiUZgG1Ynibrb74M
         rai+ctH5615B6yDJDxSq6KSMk6tiGKfyipvChj6HCE0IPDQh4JzykxbuVwVMzcusXdpB
         iJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z+HrvYkLsnq/67deomAXM5gTuzGmxqPOZTXghSZHfhI=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=pyU1Wnqh2Im9UqpirOV/fsDPtxi9p3eNyVhHBO69awfe9GIVbuEsD5AKf6kIUGM4cl
         mPQkGYa3nnAX0foaD1M6Ppm31SAyjVT8LQR8VZ8/FJV911ZGWlZS21aE40Zn/gCJQVPD
         vTHA0XedauQ1CXNxSMrb4xxrSN7cxDfdkjxjVhWJttOzydOmI5kO/l1sgC75MmcJ6Bf+
         XUDULTavMeyyd0s5TBbXrgo/sa4cAqU8RgZkPxg56QdlZ6uAJw8uJLsB52VdVeZGiQfI
         EBrM8A0biDAt2G+o+hq7dshODTFSGRmlH6Xy8XgKzgmzkLTwrL7ESHPhDkbP73NNGHM5
         63Sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795720453; x=1796325253; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+HrvYkLsnq/67deomAXM5gTuzGmxqPOZTXghSZHfhI=;
        b=FENAg66nwiKSKA+cjzv6+rGN6G954S/Vbh6dj5oTkjHkJ6RdsziDzgkRoXcli+ry7i
         pvGXhxdEGWYlKu0a1T2hplHZniunzpVKW+Yv5BJpOpbqy39Rw75KUWNQIgv3QKGvDC7h
         oT+JNlnMm60AM95a+5b3DeVH6KWCElSWEbZeZ/jNrNiny8QKdNGH1ztM9i+Ntq9QdeQ2
         EOeXrJzXzSMP/Gne1DBfAlExMFDruvmCYKWirGKZuM8vCt2SCN2Kx7RaLs3yVhXcaCPG
         Zk4EwtxgQb7nzQON1Oe1j5sZwLKoWJf6Lan/7+ITQR0j3or717zJR2npy4f0/Nf/YYGL
         Ti4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720453; x=1796325253;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z+HrvYkLsnq/67deomAXM5gTuzGmxqPOZTXghSZHfhI=;
        b=NIM5cwodozQJfwJIKpP2rUhrMK+gkuwKxMXZmDEe2V22qsAjOPkw3Jak5lXQjIV+WS
         dTvwJCKXIJFyE72+bYZSjEDM0wC2/v83GG5yvzVLm6MnbEklOxS5eofFG+KhXzN4QOP3
         D13A0nMfYeXxJ+2VaHvnYq8jUe5Aomi66ohf+Hts45PZJ3a/7SlEmyHB5aERpSISp0E8
         twKAIh3goW0ziJmC/5wIGcfbSGpb6ihpPqd8nb43ZwtIoq7zkAFShju6hVbNl6rk+dYh
         Ve5qw9VxoBMqCtn2bCc57ueDACx6KJnJmVhVCaawNN3qdKbKdZpg6QOzXHFkQQrdRS/L
         1GHA==
X-Gm-Message-State: APuU4Z9zxEc392ItI9BpRifi//ColqLVoAzM67NbTUSJGJuZnK0E2qaS
	Nh2HYUGhlz0wfHoPXzFMf8M1TIqTld+CY67KsxLUo3y7vE/oo+v8jSoOPbQIrK066wkmzvrZRJo
	PANCzLfgrEo0ovhHugn8JyGK6HQTO3r5k+ETibmy+bhRXwK17pjsvTSvNnKo=
X-Gm-Gg: AZFdTZeNrM9srNKt3vGzZoignZPHinVXNRGUGv+uuNQbMiI9CaBJJw87o9JNssyCBQq
	iNl2aXBEtpmg6Rm/E91iwaVM1WVd3AfivCmm19DE3680pUhYlOx9/RaPH0ZLL5/j2D5UEk3jBM2
	sXp1Rj98BMSHxBMGLxFWZDY7BwQym3TRMpFE5ac0grqhHej0/MZZq7QqwyXOC13J+IcX10bLl2A
	8geD5Nm4k6wyO1GwF35WEL/6tiW03GHDaTvvqL6Onwu1YsJ/Z0MlYBWbowYz2cwtHWPW8jYvYBN
	LRI2BuwbK3ftnhG14mUffs3ck/8g+CnXjnFN7fuqwNNFbSXsZUaQgEPFfNXzTsaMQEuALbT7Jyz
	UZjnot6FMu8eJ5ZXGc6MXG1ZsTLrUyMhkEhHha6pKhUvPb20RBAseJ4aMsfstKo0cOiPFQWuacE
	h5BVioYA==
X-Received: by 2002:a05:6830:719f:b0:862:c685:84bf with SMTP id
 46e09a7af769-863152f7117mr21481338a34.4.1795720453104; Thu, 26 Nov 2026
 11:14:13 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126185344.2784303-1-jmoroni@google.com> <sashiko-outbox-236047@kernel.org>
In-Reply-To: <sashiko-outbox-236047@kernel.org>
From: Jacob Moroni <jmoroni@google.com>
Date: Thu, 26 Nov 2026 14:14:01 -0500
X-Gm-Features: Aa3M54p1wd51trqoh2-IhNw4UneDMSp3yOhrSTLJWQNF6Os4pbacuIGx2Jk7Uk8
Message-ID: <CAHYDg1QULQELHrxpbDevy7LTA_OP7Cubf_z9YH9JuUwVfj_ATw@mail.gmail.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/irdma: Wait for all refs to drop when
 destroying RoCE QPs
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The cmpl_generated part is what patch 2/2 of this series fixes. It disables
the flush work before the QP is moved to error and then scrubs the QP's
entries from cmpl_generated.

The resize_list part is not reachable. Entries are only added there when
irdma_resize_cq() is called without udata, i.e. for a kernel CQ, and there
is no caller for that since commit 6c45efd8f9bb ("RDMA/core: Remove unused
ib_resize_cq() implementation").

In fact, a lot of "resize CQ" related logic can be removed from IRDMA now
that it's not a supported kernel verb. I'll add it to my TODOs.

Thanks,
Jake
