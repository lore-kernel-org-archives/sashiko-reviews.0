Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77436376BD7
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 02:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789268167; cv=pass; b=eysrHydwFUJ9vMP7f+ZJP81CBhmmlo0xkvwhsf4VjDcHB8Lb5aXUVj3QzRezEDqDBSrcxDl5W3QXQVoT3uI0+eJ0Ex6tJ8618IQs/1xpUY1TCCL+NT+K7TxbSSeq0fSwHRD2yo97K8r8xIsJS8gogoGawmSq37Sn8CLniRlVM5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789268167; c=relaxed/simple;
	bh=DZGKf+y2yHjX0JATUvwRU5kGsye4Uuh7hr9rvML6qF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhGD0HHy5S8xoPPaLXK0Rxsm51yGIy908xvEK1TMGrq8r+rcUYO7ovn02V6k5axfV1PhVDSQ4y0DuaHrfgaX/8Jc/UNpqwBBojdW8fZcCs0bMT8mc9EvJyjB/Z2b17x0pLXTO/uGhWE2rCQa8WWplIsUpr+BgkjiaPBhuSfaU3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYIovudI; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYIovudI"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab19125so868595d50.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 19:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789268164; cv=none;
        d=google.com; s=arc-20260327;
        b=T+lpdYey0syBgjHXdM718Oimn1Cy23uJL+WCQ4IFMgddBRyMVnLe6cmQd8sfG+5cHG
         pUgwRZhHfJuzfjpVv4IqpO++f76AUB6Fn1N/MqWuLLpDNcINcFqkFskUAz34CrRT5VY7
         tXlob0bsShYRJrL5nDyz33+LcHdX1+v56QZjPAEn3gNCRFc8kiiCxirFZiIGncpyCHby
         IZ1muiaYsufRq8RPEO4UhC4RbQf3fCdMO/pCl0h6djXs3XjOloIEgNdzKbku2MX+rcxl
         bSSyGR4/c9QreYM/UaAq0E3ro186rwshqE8Xf5BnLl877YM39xt2+0oTN9bdoIyk4VpV
         MDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DZGKf+y2yHjX0JATUvwRU5kGsye4Uuh7hr9rvML6qF0=;
        fh=1EIuu+bdlLwalOgztuD6wHLYPeJ+Dj4z4JI7muwdNRU=;
        b=QCeCu2S0iomxewazAlHl6NqtpsfXLEGQx80Lzg/9Qp7DHK+yRSqruPx9U9qlEVcx2L
         Y0U7EzQquIsuzOF6Ncwu1w8czoeNQN9/r4QBbrJWY5+08wIiOMnW9DIUlnEdKksBWgHF
         pAD2/sfjVgOfDWOleEjXEj9TT+3rnt4ZGTvoHUHFE/a1R+4ghxbciJwZjsF+QE2XbR/b
         QTtNjlzBJkQTCxoy/ZMRR9lETfMvlptHcGOg7KjT4vDCoUlQpnP6o10IkEKaka2rRpiP
         hiJ3dAb4bPL+0Fn38FaTD89naTU2E9ZeS2VpSd6eGPmhn5dPc5GE7BG2hU5hEM4AdqW5
         qTqQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789268164; x=1789872964; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZGKf+y2yHjX0JATUvwRU5kGsye4Uuh7hr9rvML6qF0=;
        b=QYIovudIRXfVkzRsFg3Q5XNlkNpHLDnkTHmxWcjhiFLM9vhYNpaEdYiecEEEpZSaYV
         Vm074W9K0MJ8ggVxuZvFNL87H8khHRMEEG2WFmgOpKbpog8aIIA0r0IwRmFjEBe5UGaV
         hlW7IRDd02TwJ48u2gICp77oSa6jKDhbRkc69LvF/XUwzQM0EJfde3po5TQkLjB4qlgR
         sfxiWnRTY71zHB9w6SGZTLpbDsIjahNhmLM3wwIwwxiTcTz1+By0oI3sVXvGhLUFGH2z
         aQZ3D/eWs1TfNzMQtx0Toe0Jc4s9cjPndT/JCs0+n39lV9BFU6iBDbuIcd5LKj5wPPqa
         rl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789268164; x=1789872964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZGKf+y2yHjX0JATUvwRU5kGsye4Uuh7hr9rvML6qF0=;
        b=kVsNh8ZYk1LA3H+wKaUaCIH9n4iuKRBVUjVPb+mYh6WLNKfi7CLtR4qHYqCdfnUSkj
         Nzw5L7XGMon7GQnCTJ/z8l8GGlVPcXFa/6aD6YS7SqkPMZkDlsxnvvcz1h88xMMb4yI3
         VCHKAblbMcKaCG6flP55YF5hxI79qAe8M382zwinysoKcEhk0CEswGY/T9xvJJkA47lf
         o73ImvLo0U9yqQuVP69O8/s4OceOwOgM8LH5Og1iLY19CjKA3t5j64Vaow2qKFJvNHrq
         XoXP2z6a2fF2VTD3TUmNtFtup41aNhdNuiqzqUsC8SqJOdOaeukMG7XNfNKKw3HTSc/N
         Qr2Q==
X-Gm-Message-State: AFuF++nn428nOLHkekbQI5CSkIItRH5UWPQy7a85q+xZvdfwsGCRxRYd
	QDEmmJNYq49T4NUHl++FLEkyQOoWHRM0o3pg51O0TW0NfNYLHbG8hr19Gq9Qy9s2bOCmGp1xEM4
	5TW0L5KOPbJvL1/k+w0bzthYL6X2sMHKnazW2
X-Gm-Gg: AYBFou0iRyBUyxsul16wortdJRaIGpPIjB+9E3mGn5PYcSH4sbH4zlPMjWgo2LRlLr2
	1IEGiDZZKYTaQI1UXzNwpJ3vPb2eEZ+AQa80itmiq6ui/xQrHi6nNBpT+duvpytqjw+TSoQBvP3
	urjvQ9FjqzYEu6ULtxIrK6za+m33yFCQilu9f4Ew2ZEywfJlSfpxu3yIsTjJtEe3cRGDw1bEwgZ
	jZbclC/JqXHyEgFB7d1RvCKBiy5FRBi6QM045RsZ2vIzn2y1g7wdtOS+5WI1ML3bpHx4DUCO5mZ
	eA67CalXvOQl50eE5BTsUczYOcqBNf0hy8b8ISA+O1xtEN1B+GT5ZYYyByb2ybo5/qzAWzSGpYU
	AXuy9JCzkYmW8YA==
X-Received: by 2002:a05:690e:4806:b0:66f:7c64:9d47 with SMTP id
 956f58d0204a3-671245e99d1mr3820657d50.23.1789268159132; Sat, 12 Sep 2026
 19:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913024228.72317-1-laoar.shao@gmail.com> <20260913024228.72317-7-laoar.shao@gmail.com>
 <20260913024817.2A6DE1F00893@smtp.kernel.org>
In-Reply-To: <20260913024817.2A6DE1F00893@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 13 Sep 2026 10:55:23 +0800
X-Gm-Features: AcwNN1XGxR-mMsAb0YOJXftgs1Id2BmjtGz_un8fTW9E9IfSrfUP1F5C5C-13Hw
Message-ID: <CALOAHbCyhyEhg0upyMgZSaArg1WEDtpOdZw7zC_+DtfF0_h__w@mail.gmail.com>
Subject: Re: [PATCH v9 6/9] livepatch: Deprecate stack_order
To: sashiko-reviews@lists.linux.dev
Cc: song@kernel.org, mbenes@suse.cz, pmladek@suse.com, jikos@kernel.org, 
	jpoimboe@kernel.org, joe.lawrence@redhat.com, live-patching@vger.kernel.org, 
	Wardenjohn <zhangwarden@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 10:48=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch removes the 'stack_order' sysfs attribute from the kern=
el but does not remove the corresponding test code from the livepatch selft=
ests, leaving a block of dead test code.
> --

No, the test cases won't be removed, as they may still run on older
kernels that support stack_order.

--=20
Regards
Yafang
