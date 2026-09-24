Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20F3D1AB5
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 02:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216311; cv=none; b=ijSK4+1ZBqJRR7JEMF7St5stMpLb4dT+QLrQdI6P/oV8GGYjskZz4ZtHX0ulqUjeeH1OovxaYVcsyQo8cT+cyBZCaupIVrt8JUVyKlx6IfGeBlgQvpnHHySAZTnAe50HO0fuKjcraQMhOacN4gNC7Q30eoRHCYA/j1EzzDxiWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216311; c=relaxed/simple;
	bh=6eqLqdxdZnQfhuRFBuoUOMB3TvRuvwD19HIqai7vaFU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Ybi9ZkPmLWl/pAWcXvTYDRr1cpFyKJpyn7+Uo/w+0y4N+ZazwMP/hlwlfi6xpXkRFnRiqH6ZVNVbzKArcG7gI4W8aFGtSzmoqtOxoPjVjtn0GOqdDqgxbxsxZ8gTLUV+c+q+7BejdawTbvFJQRYKs6InYfu/6/x7D4S1uu6JyY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYdyOgQw; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYdyOgQw"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso9657795ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 19:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790216309; x=1790821109; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0znCr+Z0mJneqMTm4htrgffhWJ/mVEoGgq/qNX6FvCM=;
        b=NYdyOgQwagETd+4zahNGodkjvbeGKd/3MhjgN92FKjTPBVEnX4GqqgDtn79EjH0gIs
         rMjBVZYB+Sp7G6tps9Zr2iFqDLlzovgh8UxAGyaeSZCufFBRhQPpZwr33lRvRXQfIOCn
         kA5n+lw6P/HCI8SKUPKq4AjYnFMg+xoWdN1I7yEieK8o6XOwKj8wILKGkmzAwLcaqvzO
         i4Vu0BDnY3VDrOw+l8egszqYUPx7oBrNYFxjwruOXtc01k5zxE6+ZvwIckmSgwsRhBn0
         QwTRhFKLkBp800SkZF/SNfDbkzBbpPx5S8xLMtTXEbSnwa60GiUxt7BQWINEJb/+ddz5
         sdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790216309; x=1790821109;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0znCr+Z0mJneqMTm4htrgffhWJ/mVEoGgq/qNX6FvCM=;
        b=J9LF74wEsQzcwc3k8IJhl8aNtfOf0WtcVBGo2PjWi6MCPiNJ9FlmX5Uld1NACVYewd
         CjsZSZjaeZ76oVHTZN8j4Du81cnBz9drHPrMQ3rft+zn0XhHMkbTOsl0Xzt2nzLjLT4h
         DcO5jRE7Y479UxxpYyr78/EuW1Hxv4DY3Bt+Q9ALpcl9hlj3rQj1335F+YTW0Tepo811
         htupbwrHzl0RQM9E/86SBaYu8cUUICjY8zZp51xFdP5QBSLSrwWiWN/V4yZ4zcEvJJXd
         vwYiZ/5rsYBaKSCddFf5JtAbyC2vPHT/35l9fob37eOU7n6+U3+YA3XBLq/dLi/RTmvr
         VnLA==
X-Gm-Message-State: AFuF++lrRiM7dtN21Pm51mSsKwmnIeCXA9AK070lk03/T3QIZQ9rd2I+
	2SbPwwDvc5Z+PMBNYljp1DT7+h6l8kurELV+PnDgUz7pMLLoLzWaaL8K
X-Gm-Gg: AYBFou29v69dgWtz4irg6DntMv+ji6ZJznoOuZd4iINKTbnbEv9dLrYI6o6861ubz72
	EwZg/QGzI9yA/zzJ00iWkeJAOHDzr1mA2tsUD/4GeDCssQ13PmwLvFLpprOoDAmcnUp9x3/5CuF
	jD76PGp+qcQD17J8vL9cHn7Epe8+ZYofb/9Qr4hmWZsYpHwAEZTT7g4RtaRpLG5GSuPLmBdkbTC
	JoD62aIPFm+On3swgaqGl2bxUV3l0xqtOOHoCNxNRtdchYAokaRWZIvClSPGCGNrgUts7cz2zTz
	wtng8iP3cgLZ46Rj5KG3ClShQzC2GMrIYsDs+aAI7XM2LYZgimFSu9e3yCX5BE87yDGNdvU4Vql
	phmkmLC9EP3b7pF94sGn67E08yyz0m1+u1NyAqpkeDtEqEviCxibwP+7ENcOy0mBwYRl2HYe9Oq
	UhselZtJytmbEw6AD8DZp/O8reJondRdNHunCWjlfRtOexXfoIt8i+HWb5U3YDY5Qb2GmlECJly
	qADy0SnDV88+kxpYBZuflSdkN0452oz+NaGS0PVRNKi2SFczS8aozavpIvkclJthwwIARfsfatI
	0W0=
X-Received: by 2002:a17:903:1447:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2df7e11d07fmr8703805ad.32.1790216308788;
        Wed, 23 Sep 2026 19:18:28 -0700 (PDT)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a5157sm19125315ad.14.2026.09.23.19.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 19:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 02:18:28 +0000
Message-Id: <DLN6PUF2FMLF.NU2U8L9V0XWH@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4] bpf: crypto: Use AES-CBC and AES-ECB
 libraries
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260923032703.59816-1-ebiggers@kernel.org>
 <20260923033742.D45A81F000FF@smtp.kernel.org>
 <DLMEAUZ632XP.210Y7S9N70NHW@gmail.com> <20260923041124.GB42709@sol>
 <DLMEKP1LHU07.31JTP12GKADU8@gmail.com> <20260923042128.GC42709@sol>
 <DLMFF6THNB1F.260JQGVX0PO8Y@gmail.com> <20260923050134.GE42709@sol>
In-Reply-To: <20260923050134.GE42709@sol>

On Wed Sep 23, 2026 at 5:01 AM UTC, Eric Biggers wrote:
>
> Module code can only be called directly by module code, not built-in
> code.  So CONFIG_CRYPTO_LIB_AES=3Dm && CONFIG_BPF_CRYPTO=3Dy cannot work;
> you'd get a linker error.  For a module to offer these kfuncs they would
> either need to be their own module (e.g. bpf_crypto.ko), or else merged
> into the module of the underlying functions (libaes.ko, though again, in
> practice libaes is usually built-in anyway for other reasons).

ok. I feel it's better to go back to v1 approach:
select CRYPTO_LIB_AES_CBC
select CRYPTO_LIB_AES_ECB
with no prompt.
That will keep kfuncs on every BPF_SYSCALL kernel without a bpf_crypto.ko
and without moving the kfuncs into libaes.

Another alternative is:
depends on CRYPTO_LIB_AES=3Dy && CRYPTO_LIB_AES_CBC && CRYPTO_LIB_AES_ECB
but select is imo better.

