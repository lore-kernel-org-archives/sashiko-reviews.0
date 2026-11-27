Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772487;
	b=f51tk/g1p7OKiDARFUYKiaTUSt7uCxi1tq7UD3KFsbtL/iD2GgS094zkdcEXCqKZVno3
	 vpBgzs3WVrKKshIckkyVU+ImZoUjii3YfRsx6paPnOIdEuimrDc6TiGAEPudOsFPAP90W
	 gT548VIeSdMrjtmAhsYMRbKntJmjueCiJuwn/ProunqMWZrlGT7o13pKi6qZ49x/OcW3Y
	 MOVP9qrEHTBSZ0iQnyydNzKGm+aO2CspWcZJ+hI6YNEwtBmbQnkmnlaWU/KW24Da38vTN
	 3rxBna96VBLzgz2UQYsdDH9v5dN9Tp2xmYfznA9h/2Vfs4iLRJ4Sp8+7o58Mb2fOI/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
	b=ObwL+4pW1gFIHIY9ql0hxmoFmRJ1rNtWaWvS+2OdGIiC1sspD0DhK4hEm6y7O3sJr4QZ
	 DReYiQTFuLEBdkPWLPMD29dfpJIhYXhN24WZ8muBqQMmA48A/em+LNhvfNOSa9p2SCb4h
	 Zk/wREnsq0U89ldirKl0RoPr0HMj0RBfc1tU7YhcwWOIend2Ier+3t32WpqAnL4saLIfZ
	 aWwpR0GVrBt36wdABdInIayQZKQjPljLZk6IiYU7kF0FERR6g6liVeY7xH5pGE4sRn9Kz
	 GOD1VSoDlQ2cCb/Pq6XXTfyaghn5SkwlS5rY3cYApPkRPHFg8HAp3IK7MCTwUOx6A2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CiZRhWQ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BAD606A327
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 09:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CiZRhWQ/
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdece95eca4so243140a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 01:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772486; cv=none;
        d=google.com; s=arc-20260327;
        b=jfZfCo+Xk/dEWlQC55qEL+hkSwQMpAfaCDPKO9u0vRxrVj5mc2HmQCtA84gFaC8Pd5
         +m1NJk1AhzsNxgUpVgA1ZBtEaxMEJOJ/2lE2cEzS3FaKJTn7QJwT4JlwI6YO0TdP5L9y
         GGNupHDRY1r9SRZHa0NcuDsNp+EW8o5qfihssksfWsIoc2SSUov+SYGZOdXGZhXjiOFp
         lKl4smmz8u7e9A94HOMTJpfy0u1hLJNP7XPaBLdxt7bsOZgffSFb4i40vDkaZ3AgdS3d
         mXI1MpGEWRuU0RkVnE4imfO/3n1N5uDowq9GYO30yvX+pvv9mFj1K2Tc+8TXzPAvPKKF
         hW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=H7cd6XHXQWsXjnefZY7KAKlIUXUUAOAPSsspZKcGUhqAlxN4GGwtlT3/HlX3e0H1wl
         /U3KS6YDYFRqkPp83NcSy3FRrREvpCODWQUWVl+IFYUrwLH+3p3rsmZD5N5cOyeBeZt7
         HQFuOqesQpMcBTTojfVTlw7OgkCLLjWQAtAhGWW5zUZyzhEv930E5zaRdEdFxwqPFKJD
         AW+PxrC7h5G8q76R6JuvWI9yaGSTNikvHbVKTjk2YTk8emlJ6eM6iL+MYZn2qEfqUliy
         u34WI+Wp7dZ+Tu8gSWdLF0ghGFaSNWoK5KPOUbL6ofybVvBYKWyzHh4t8F2+JJll6MAw
         ZDRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795772486; x=1796377286; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
        b=CiZRhWQ/k95r0N7Q4pP98UYBles1arzu/L/BA/OA2wyLt2rX6Wnup5x0u2sHL33DFi
         UyDF5mBQ9CNoW5UBFbWpHaJZD7cesuvf6tC0lZ3v6c2yBHX2zwJrKGdlF8Hxfh++q42T
         lz8QcPbyJP3PNPwLQjkE3Fmy4llxUg1WlUaUV41UUv7Q4Ppqt/SbWclTueh2dpX9GHUG
         Oxb+0LSJFBWGYk7aRviOzT6P5pU+BC4cZyJTLwYi6Ku41DGlwy8WZWrrX1M5aG3Tb+LK
         koWEHD/AD9RnQCwV0Y8+u3S2XA3n6vTFAXZUDdOo9Z9Oy6fwX95prA7CnpO5lZl1JcV3
         hlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772486; x=1796377286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KlAawoXCn4rT9AMA2lK2Vv2/LjbQvX3VkwkKXul9jPw=;
        b=QFzy4isAcmLpvcxUrtmNStFT7fbEEaQzzYkTV4Bvqlnolgbragx3otHR5Obf0ogi29
         FBitbe9MaSVwjuwTR1V2v11OZLRCd5plyUX/fYZ9V0EhMiW9NQPQWc6jKA/ZdYy8LSbQ
         CM8e9/KlrB1WjfxW6aCVHoO9BiYpnxJSqWQ/jma48+hlsFP1v1AsWz7DtlwzFV8tdKA7
         Q2BSnCIcQQ/JQQvo6XE0CHFCOwod3gNHe7Xqb/LLlnUeStNU/G9od2k3yR9YkIZk5u+K
         WNlr5+ZKF1Fmkyasvb3Ff7+YOU4/5qu2LGT9/W27ujAvle7VNRN5FdI0Rksw0W1bnPjT
         Vvcw==
X-Gm-Message-State: APuU4Z+LD9fzY4ryxuYjqOLe6jkXH49EFoertz8dxi6uSCnCBk2oIKUq
	DwKgY5HCVDHHHInlE0EfQIeC3zEVr1v1Ta14xhlfmKi9XVn4s1ZG0Xw7wzHWc42SXogpETitIPA
	NzO5KXRGn+WYkz4qrQRfLJ8+ZRXQSFBAmpKHk
X-Gm-Gg: AZFdTZeeOpVRhzbzO/j/7dmjMj0c19h6XVM6ECamTqsNA1pZwH6IGLszwKX3+lJB85F
	6VByrl5L7c+Md0+n/aLIIGQYeJi8xeyNreSHbLOGsCnI5+6vIjZ2U2YLr0w/JbQn7fDbGoVE8cb
	BKbItGTO5VplZDmXMGvvGiuatwHMhp639FuOQqaQjswGrcO1ZoAH0X8oEdEox5Um7DDI+AMZ738
	zrgYpO1wDAr4v9ZM1x4XA9DM9lvb5xPhddzSQY1v7n/bIHEojjQ8MmR1rrOLGw2hJinJWB7wwYm
	X8KmsfFAWhbSFMLkcRplR6CKbGvlZVhzhMMby3vfdLWmgpo4g004RKrXLoeJnoao0vydsHHIEe2
	SACo+3zTA5srWtgw2olghBgsrNV7+q2wUEQL4uywPQ8eQDT/LQdwFTYAZS+bMupCIl0t/J7L6Ww
	FXsqtVBI3v3Q2UrlKTPwuYMC/6Suv7MG+OM3jkejVjc6LS/1Dn
X-Received: by 2002:a17:90b:2701:b0:3b0:dbc5:c56b with SMTP id
 98e67ed59e1d1-3b41c7d5cbbmr19171403a91.6.1795772486477; Fri, 27 Nov 2026
 01:41:26 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261127092345.12383-1-phucduc.bui@gmail.com> <20261127092345.12383-3-phucduc.bui@gmail.com>
 <sashiko-outbox-236987@kernel.org>
In-Reply-To: <sashiko-outbox-236987@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 27 Nov 2026 16:41:15 +0700
X-Gm-Features: Aa3M54qrREKeThvp52eX2yKw7ElARWYDZQ9GS04ouorjeA01SIwEAb1yW8CpNrc
Message-ID: <CAABR9nFAQsj0EOJtcf6NrkhCZkTa9oAnu+0zdOyfQTxyMux+gg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: stm32: spdifrx: Fix refcount on sync failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> This fixes the refcount and interrupt mask leak in
> stm32_spdifrx_start_sync() introduced by commit 03e4d5d56fa5 ("ASoC:
> stm32: Add SPDIFRX support").  Should this include:
>
>   Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")
>

I don't think it's particularly important for this low-severity issue,
but I'm happy to add the Fixes tag if the maintainer thinks it's necessary.

I've been getting quite a lot of stable backport notifications for my
previous patches,
so I'm trying to be a bit more selective with Fixes tags now. :)
