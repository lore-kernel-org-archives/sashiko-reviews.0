Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153711;
	b=G5FPSrrHwSKXDdDHCUC6ODiXBZQ+0D2swZHLU0w/KlCAJiH2dwjQO08VZtBcgcJD7a2b
	 k5oU0mW+xJ6FfNHDSfKswFaoX7hPZj4lq085gPFwEIqvOh136Q0qmSqZbspnWYvqYTZ6+
	 3bQuGDzGRQg/m8Y+rNU7JPu1u0r6iGFkHWiE3Avmr6IrmKW0to5bEB42rqLN8mLjdaBhL
	 5Uo4dXMoO8wXee+21TSh/3AC8pDVBkGY439KoXKHjh8zecvwGjeC4cDxaVO3NarJv8sML
	 qhdTtINlWWjSBNZA0hMFlkdbR1R0oAt0TcOYwfEv2hZ+CK+h3yRzH3iLK9mzPcvY8lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=QGinyiMrrwZtrLAfiO31oHhjeyRs9IZr6anPmafpqog=;
	b=oWaV1AFz3mPfjqnCki+mRWslmOxPdYsXNCJuBuy8zGQfi5/hTp0KwmHHwE/BgJyP83mK
	 YepTlsB1caoRx6bHVpYEHIsnG18cpNxnVGjt43Zjl0+fgs6HwXcDKEaC/f2u33m9P8xJT
	 AwIExv/Q6jtB4BtrPmf2SSiMWjxyrdMItx5tDYVBMhFvIJiM2Tg+g6vmplSZ9SDIEmwYa
	 ofpXFY9JcZPL+bmOPhNBjoj8OJpF0CJkU9p3hBdLOsD4LYE+Aru4HA0Rd3I63zs59QuuT
	 qSbw7qbmtk9zWjWtPYWgjoctnL9XfMQdDmpu99WB9g50M+kPBXMxcBCGRPmPtzjkLnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aVOxv1c;
	arc=none smtp.remote-ip=74.125.225.73
Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66675606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 02:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66675606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aVOxv1c
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-48afbc2b18bso202002f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153710; x=1793758510; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QGinyiMrrwZtrLAfiO31oHhjeyRs9IZr6anPmafpqog=;
        b=0aVOxv1cbMLiGfJvG+GBpdcWtqBgq/JulEqFPMgePZNcln3Jd90eybUvBVJBWpk+c0
         l1FE0R9JxEw6oE6zCC2Icg2nzWhG82tnPykeLJFmoM65qNjL3kmGU+LODqrSpXf9vxad
         z12MFCbrArbH6hJ5Hj3E8+i5MPQD+fgyhaB7LsBLbxs+HOmIkRp7JK2FdEKkUd2j883T
         7RLUK3uLYT7VWS6h/hZhpyK8+aVJQeGDF3OUGnf+sVZwm7oH6xd1Fd8zNFAzjxT57Phg
         2EuIW1Tyhmmq7+PPfkC14JQ8OZ6Sq1Pvo/9Np7q/aKnpfmAIK4pDt67g5avltHeSkLEe
         k3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153710; x=1793758510;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGinyiMrrwZtrLAfiO31oHhjeyRs9IZr6anPmafpqog=;
        b=sj8MqOGoxwqN9jY+F2D/M98Owx2xK68EB4Y5AINBIA9ODSHvximULUYn4srV4vK27x
         PzC61Zq9wEQStBIQvYWQ/8RySpSufIBe2DbFvqB3MHwp/w7Csb6eirLBz2aMEgaQu8zS
         YgqMQwEiPMWUGXN3X/yXC8JzO/f920K2LBQMOduZOesymZI8YivR/0ocbAgcx1UoLGl5
         ikjqAeTVbDUcXgEEm9ZgrNIp3Hn4UZ4ySwI4lPoKwyRW6zLacoEPWlWsUH5SuoECHPpY
         uB1BO//wZ1D0LSB9nQVrJ5q+ZorMeGJ2gEwpb26HOzjP2Ayupi3JXsU3+b2P2DcT10rt
         YvJA==
X-Gm-Message-State: AFq9FYKrft5mBf0L1s2r7SraB/AzytLOZbHJ7nAQTzYZexrkF8qj6hxx
	+OIYWGxHqL0ka3rGeLr9/MzJw+pvzCaYbT0ZsoZ0lcqrxMVkQJu9I7f0gXTpbQbX
X-Gm-Gg: AYBFou08vCo2GU1B0kWVwxCs5lVa4YriS6V3IJ9nFNhpUJ6jeZEE6C4CBhUzvcECRN6
	2fbnf6Zahs0Fs1sPUfLnZOnDYL991xrQc6F8Te9ixJSWXJW/qfOk5MIRTJ3uJU3PHO/Dri/HkVe
	wYNvIShYBovhnOYXfuNFJrSR8a3BiwL6a8iFdkgMPl0N6E7qSaEOsR4mA+dyp19wgS/c6TcpbRS
	6DqefGwkG9VhfT3Z1W5rfLN4qdvrU175s3sQxizLjdsmP1KJnqGdvKn6SsNvsZeLCPBGccOmsFu
	Hgcett9panYoHminnff0RBZldxHW76tblA0vnIJTSvEeudMsZVHS5VYgtX+4pvck6hkQ92gUNns
	KCWVGxDdPvOcxBT3cajvXJ8p9H+xOrLqJE+AqbHa4RxTkcIV7jrqUoECDsRFT7bGH5Ob2k5+u8R
	nXU7qhlr21PaFLo9lGPbGKnTTy9lGGGHJl46qT6OQ+ICqSFIxWCUmgwcv57MB3ar3ddqYWp9UfX
	gbd4ov1wR7DC43zMYlkTmVzloOTFyxM5TnTe16SOr/UAvRzpzbQO/z0mUw71NB5lF5y5kSf63lb
	Gd0JYRdpqQWCil+LErBz2OCO2BhePqT3Tobn38GpRjdHWgur1494FMKnFELsCUQK/nzsiWZ0AfF
	h6m/9O0QbEXfGXfzVfCegxXsuC42qlw1BKhA2gZaoVlGWhOT0HmZ4uTsq09TgiVPa1pTw
X-Received: by 2002:a05:6000:104b:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48e5d308277mr2011252f8f.43.1793153709469;
        Tue, 27 Oct 2026 19:15:09 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd35c2sm25220146f8f.39.2026.10.27.19.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:15:09 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next v1 01/11] bpf: Give a helper a way to call its callback with a pad
Date: Wed, 28 Oct 2026 03:15:08 +0100
Message-ID: <20261028021508.1203900-1-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-187312@kernel.org>
References: <cover.1793147364.git.memxor@gmail.com> <03d6c53ccdf3eb0f5503eae9f9ffa5e6570549c3.1793147364.git.memxor@gmail.com> <sashiko-outbox-187312@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed Oct 28, 2026 at 2:20 AM CET, sashiko-bot wrote:
> [...]
> [Severity: High]
> Can evaluating the macro arguments in ___bpf_call_cb() on arm64 and
> __bpf_call_cb() on x86-64 clobber the caller-saved local register
> variables before the asm_goto_output() statement is reached?

Right: the compiler keeps no local register variable across a call, and
a call in the evaluation of a later argument clobbers the ones set
before it. The next version evaluates every argument into a temporary
first and sets the register variables from those.

> [...]
> [Severity: High]
> Could the compiler eliminate the *slot = to store in bpf_unwind_leave()
> (on both x86-64 and arm64) as a dead store to the current function's stack
> frame right before returning?

Right, and gcc 15 does drop it, on arm64 and x86-64 alike: that is why
the gcc runs of BPF CI returned from every helper but the array iterator
instead of unwinding. The next version stores with WRITE_ONCE(), on the
shadow call stack too.

> [...]
