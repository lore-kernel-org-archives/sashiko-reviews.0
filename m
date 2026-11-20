Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207336;
	b=vVpZmwQmalaLncFv47lhKMXLmEPMwK6mJFGXjrtLsmczIjsFg4twvbTdQaCGpdmQgNy6
	 y8fCz4LjPq/4K8ATxtdxJIvPcb3aSqvgZ1pmZDiZmcWEVB/Qben3CmR9Mokfo3xE0Ju6D
	 VghOb+hHgKiQPDd93VQyzNT2Z5/wAGGfn88rDiOaCGPSpU+O2D+gkMhQ3ClLmrCoSQ9tT
	 Qoy47UUQKhsXpcioqD9fzNVTGDTp4LMQWnp4ySjJXf6gCa59xnEUkP4qRFF6AfPgnXxkg
	 Er/CA+J4yLqYXzaIosgQrGMdZMb9cHPRILmGWWznu4UGBJlbt63xjBhgfPItS72+g0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207336;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=M1o1LqMhEI68Ps8j5jmIHuqxqlG+VGNC6ppq+rvyi8A=;
	b=lEnCO/0qqpmTh+FQupUOuGNee+OmMGmjh6qR+qLKrHWRnqlFeSywIX4mL3fwQW1TfgLd
	 /R2VDd4b5dPS07LmJJUU84sovIU7dGfJWnFtbEhR2z0wlG9SeGamKPXjIVYuNxQ5m8eoY
	 WukQPIIMqqlw06etsmS5/De02BuV8yT25Ik+ZJJiILYDDFTorTNOQpMze2j718VrrewWY
	 PuBOoxRDvvoRWc+awiQrsTTjiCAmALvRASri5bRoBFQM182AZ5/Js1t55j5FeznGfx/WZ
	 0nrzFBKL1w/01FRehDtlbTAXgExHt6UDeDOpbxHlj0Jt5OGTA1mSp9VqQiRvCblup9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE71606A6DD
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 20:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE71606A6DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-94961ed97bcso153227885a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207335; x=1795812135;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1o1LqMhEI68Ps8j5jmIHuqxqlG+VGNC6ppq+rvyi8A=;
        b=rHjt/IwxAKzNlyEUvQedoQPMVyoKjqmhglSA7Ghe6sScdYvM7PkVfj2y+MvgGw3SMo
         AmW00PysYN0T+QaxJ9iCYGT0sQN0Rtk7+K6dSrRHidmqPdJMNObjNlt4+XKK/a/lsjtC
         o++qyZZhfKdRoWkmMke6tN1HUYbcIFd1o3G47kXFB5nKjvsZQcoOA1mmtsogEu/yEP3F
         y6N/jUm6OVcMPsFyUErv77czXLx5RAifz1ysoScpupg01LNdxqkn9Ppjmj9yYKdNMTxZ
         4e/7ioaLYhyL+qkux6oHvBBVcfDOoN7drP0P9KhlbfBA8XfTPq3PpKVApBcoXCSOZmff
         1HAQ==
X-Gm-Message-State: APuU4Z8e+BC/XStlAnGcrQ/V0FF6jtA72MKxwxLqmCpXN6Yc1YGRWGwn
	/iS5BVkfpKAzPZJDpUFdkHFye9FNDeerAzMB57sZ37rI547M83LjDFSL4SmEjg==
X-Gm-Gg: AYBFou2VYlHxHK8Q0sJnEZyZ2XA/MPgDcsVrFl6duzxigqP+QUIBYVtj3h0LkLkIU9J
	hu4z6uxIzhYxcSQcrl1RqieeTTSa35gnHMx81lfTZ8NEjRslLz6xDDgCR/EFZ65NePa4kjpLMO0
	PMUg8xx9ZJ7iu8O5QBaksjSZ7djUpAgzAkCqLCZ3pblZTbLaF2V5Jj1SiXR+qo11NyT+PWdmXCO
	ijLpe2lYzxnWpbvaiJ4q0Xem2s4TyvMfqUVBbR/T2tvoLatMwdJdjs71SSVhXXdSheAsSQy1BNW
	oArKVXnbiYPeTBR6tl+AcOJXE0aY0aNcGOtaR1iFQKWlDpsaxZ0F4R+88eV8N7tTmbeB7ULHSm6
	8sQelPNh43pZP8qJMi/6cMlC0gSg4RHzpUQhE8eOnwjDSNkluUNEVn2kUNLy58EpPMKRyoSszQ0
	uxecm3VjM0BKGeueaSfAJeB6HmVfQ+1KNMHWrLHnlaN/2q9ziiQyMZR6C0VPcusIflbOZgKiFcP
	XEZD9kwrV69hB9CP26rDvs9kfFWpHPhM0K2X8DcN13eZVZkV5tsw4N7Haf4VmDossmpcw0JWm3U
	Kyeeqyxee0AdNK+eXh5FjMLJyLaCqS2dQv8RLduJWVgA0l64lYlzed74ZCuQO3/ZQQslCA8qmpr
	FBT1wkMabtKUAKW3OsYKYg/moBs1+sLq4kZZjgnvHUrytoX2jLg58
X-Received: by 2002:a05:620a:f0f:b0:949:57b4:388b with SMTP id af79cd13be357-949bab0eb6cmr787060585a.41.1795207335160;
        Fri, 20 Nov 2026 12:42:15 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm278786485a.30.2026.11.20.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:14 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH bpf 3/6] libbpf: ringbuf: Handle position counter wrap
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711425.18576.13916601537797650655@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <DJAXGXLF4NHZ.17HAW2R1YDK7I@etsalapatis.com>
References: <20260613-bpf-ringbuf-fixes-v1-3-e623481cb724@kernel.org> <20260614020552.022A11F000E9@smtp.kernel.org> <DJAXGXLF4NHZ.17HAW2R1YDK7I@etsalapatis.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> if we're going to modify one let's also
> modify the other.

Both are now fixed independently by 6ff5b56a50c5 and fdd4fad0bbbd.
V3 drops the duplicates and retains the user-ring drain fix.

> [...]

> they're a bridge too far, we have to draw the line somewhere.

Agreed; the mixed-width ABI issue remains separate.
