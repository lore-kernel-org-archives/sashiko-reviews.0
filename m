Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743822;
	b=vshMfYXzRsyQuNvy1RprdrG0KWB8Y7e9HJXswkquLR+whiKtDzi/YXGrXXyATBNm0wnq
	 DijEnXMNhuHqDaKoRLtE/28AF16RoBj1zEoYpegBc561I2zopTK+av9IRKx45icw1yvnj
	 1DxjJTOsrGrg88h056YbnME1q3+Hu92ZZE9S+xC6eukgWX2V4XBqeAT1tw843pBrunGvZ
	 3JXf6gUkpt4BpbLcABwD07BNop5m5H7hBubFxmWGhXmurKMIkX+FwlcLjo7wztoklDkV+
	 nUWub0i5cBeINhvQumJDy7nZI+mhM9FJKr+rWHxMCswzUo5YUx2MqSYBsCoco2D32QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
	b=3KtYchfUOw6QSouxfF3bOXOtdHLdUZTOsuh05nYPNYP6Rhus7rkJw/HtNIx3JtLMWE0O
	 /s0wsQFeswx0/7Tw6LZdtnTc4khmjkV/mqiDPJjYoWiavopD3+UQl3XYbKvn9S+Lq1jHP
	 qET6WZNmJVsOnQke8lmOsrxqNan8c05lcXV/EL2DgVefDKusFQbSn6i3Zld6asCkmSXnw
	 P+yrVTPpgY3HYVQmp2GxYjursjxUIBcyCEFl47KaIByocQ7s2iggDk+szDsHFYWoP2eQo
	 OKq0yNIdKJGJql22X47Qyez3OwTxWkj2PM2n5Gj2+MgErxsPmLVKCMaI6pte9OSKlmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5bWiibG;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28E4606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 01:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d5bWiibG
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso72579745e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 17:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743820; x=1796348620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=d5bWiibGmo9NGQLhysaAR6myQGK19cpWa/lnK1fOsiyFW9QOE1egWCX6odLYPVR0T1
         O8F7wr2B14x4fsAvMGLdX2SlJHFnpj7qc6rKh6hCprT0BdhT4GC4uPnakMerBlunZqq0
         6ZVjs+kX+Fuf+55lkaRNJeRF+OSJ94lte+WQlcFqqEKOy/TGK2aeZlqyUfHi5O9RGa/x
         5lka7D1NSLRgf9gNUjK2J6j0lZSTAJV48jo3YrSv6lrMynnzFoZvzL4NbBUHeaYWsm8V
         snijocyoAkxPODhjX2t+jb+C2liqigQE3MWV6kuDiSQQPejhPDqFi4uuhMfiIEZpYFN0
         Bl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743820; x=1796348620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xo3KnX6pu8TstZvZVNZC/xXKsDzkxxNmibHn2OhPFZU=;
        b=I6XuFPnQlo22qeF8zTnXPTiLE10xtPsNl4CYoRqYpW36UoN8P2agMOLiRCZEa3+r5d
         Y02oM6wHwTU2EKH1vv+00H90H5RR/WWqAXC4gMq9v8xUUV1BlRKdHc2YqPqo5Xf0vm46
         fiCAib2NnwYOwJgIMtz6aPMi3Vc6l8XPO+xnYf0Q7SukixTmkmuvKoIzy6VL7OtmdUHT
         PEDa1njl6gFEwyEECQo9p2fj4PqwW2mi+Nbldx9ZVo26IheQbj35HRx6/Mjonc7pHGUG
         6OEAaF3aT+6TztNQSLhH0EHsjmgKVG3pnYm0fPHuGjntfltlgC/fJ0Bz0Mo+fBLfB3Yr
         4D0g==
X-Forwarded-Encrypted: i=1; AL+hErESLJvYdEuJt6yZ56zoMnFMqAVatXz6Vn7OyEJjV3ivm2mDnHUY5zydpqJewYAZz3YqGy9IkiLYkQRtmOhybpE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/a9tcm511hndAWd+7rQccUHUdf38oUQUI65Tl62hc/JuHz//+N
	KEO1kqWXCXBvrzdfYc8BS7jR3/iV5WKxziNwO++zGTGzBK1gPUf8zkii
X-Gm-Gg: AZFdTZcfIdG5z0RRJN7o2xcycq36ShNvOsP2WpJ076YCpQlhiq8S//Lg7p4fOPyuaWg
	FIrCcxvFKmGAJeCIhWq2EsXyJUlck+m0OgVri+UNko5al4IjMBr1T+75Vc1CYcu9w/G1oZJE40F
	GH12jPVKXxKa2Drc6n3TBOnj95Wy6MDIFDMMEkacaqQrEOPDv1EzFlS/BeoMWSEEwE98qKnU8NI
	Hag+LLc2+zMUcIMIwiPlWnxXPJvN2n305tEhNJd4ZbgUluEOTbtE7Csl7bGubIHR2zF30V8NA7R
	2RIJNp1zld+LS581Jm+p+D+cF/aKPzSb9gQWyv0sWhqj9YA/pJu9ZQ8PbQSj40r6DMxQymlGPdx
	BfYJ+KxmbTjCgQArLFNhD+n6kcm2MdJ8s3X3JvnRqdUqKpsCbOd4dSrp9s5jDqgfrgZcCYCdY7A
	Kx1SBMFJg2mivvh9hbyB3POnxpd1DuOpZy5lbrvhc7z7YiqxFvhie70vtNEHhkL+Oeg0nPysVUJ
	9oaUvPvLFqFsH44Mazf1VONMiPNHSCDVehfMsqM6ViySNwPQwD6zOGJGM3oC0pK/K0AxRFyknNB
	O0k0ZvKDugNmK6f4JjT471zYZ9dyu83iEiLMM0IVaJsg+VwoJa0rmgO5Q8QjmD+CNmAyUHPkX5P
	OEeM5zsOIhgHj3ZPGjdkQqp/YMIKlE2pomt7kvUDHZLmwxQ==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr521380065e9.13.1795743820179;
        Thu, 26 Nov 2026 17:43:40 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm385176475e9.5.2026.11.26.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:43:39 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Fri, 27 Nov 2026 02:43:39 +0100
Message-ID: <20261127014339.1611234-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179476597358.140154.17606905713832103924.b4-review@b4>
References: <179476597358.140154.17606905713832103924.b4-review@b4>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Nov 15, 2026 at 06:06:13PM +0000, Mark Brown wrote:
> What about the configuration with both set simultaneously, so HPL = L-R
> and HPR = R-L - that's fairly standard with an actual mono signal (ie,
> one channel as opposed to two copies of the mono signal), doubling the
> signal over the speaker?

I tried it on the PocketGo S30 (speaker amplifier bridged across HPL and
HPR), 7.3.1, plain stereo path (AIF1 DA0 "Stereo", headphone source
DAC). Bits 1:0 of PAEN_HP_CTRL set while playing a tone on both channels
and another on the left channel only:

  bits 1:0     both channels    left channel only
  00           normal           normal
  10           louder           silent
  01           loud             loud
  11           silent           silent

With both bits set the speaker only gives a few clicks, for the
one-channel signal too, so on this codec it does not give HPL = L-R,
HPR = R-L. It does no harm either, so there is no reason for the driver
to forbid it: v2 will expose the two bits as independent switches
instead of the enum, and the S30 turns on only the left to right one.

Thanks,
Romain
