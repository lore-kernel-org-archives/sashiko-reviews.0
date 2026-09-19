Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE331A55B
	for <sashiko-reviews@lists.linux.dev>; Sat, 19 Sep 2026 05:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795641; cv=pass; b=cBTUVm86yzz2asUWyTrqlZODywb572g3IXMGlu7YDp6EMxQdnq7wSrxGIf2j6z7u+NtArZjBzhTwNBizbFTQ596yAgD6ZNGP2sfC6YYpsMHBqKjfREpipTk4s48z4/GiM1xnVEK00gcXqcwuasmboTPtkKxgAeXZHJrY0fhP0yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795641; c=relaxed/simple;
	bh=7Ym68WkUnxb5YSpZaHGF4WPXNzm2GnFyeCYlwumjXfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlLwwU6aQJMGpX1QUrqqA8YYczfP222PD/XOhVh12UFKK2+LkTntPNTLzw+wdZDc5RpA2AxONn7JBHtAyPJvY8A7ZQm6K5a3iovAuaTDmoVsqfopau5l54oZggJykKPGsOYFEJeOkYSen+e+4NodTdDN0s3XcwBJ2JNXfUnsz2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=BqEFX+wP; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="BqEFX+wP"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d4ddd1d91so10645377b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 22:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789795638; cv=none;
        d=google.com; s=arc-20260327;
        b=R4imtHbVfZ1A6wYASetx5A3M+myDN3ax5nPh4+QLSH/8ri5rtIhZBWSe81wvPetnXU
         XOAonEF9wyGS/qsHYT3mk45x34R6ROHMe5ZIY2JuOmS9IWHXFa+FMoC964iQL+CA5WA0
         8ZhnlUXZB8vQS7v16loz+Mwv3hYWGGYBUAwSh8NujQsfzSesIRi5Vxvh6zGiS3qrj7e1
         kiI/Krwzf7FFzAfXCnK2CxqWi9sary9ipsJ5vUWCQeGGEEPOecjHHwBpshxE9ZBm99X5
         pUlZ9IbSx+fYQgoLy9V3BWjlYz73UxKyix7Yxsh1xaQWiU8ybQC75S1aKBR6cxDk1MHo
         fpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fsOGbbrKrxDZ019/NpDN7Ost5CQsExzoQfoaJGWhuYw=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=KWeBa9h752RIphmCG2OKme6M9xxfIbOWCaWFNeXPesJrGAnQdQL8nT7QRctdntf7qZ
         xbeo8J8PA3Tg6F7PT60WBiHFc/c4yiSqfB8H0QIJm/ayiwVTWMBFu9jaaIwJIebmfTA3
         bhEXov5WLF/Vwp4XQlZe4hyun77IzpPLb3NgpBhZe8CTcO8lD33Gg0qVnzl+08Pf9wqp
         dNnD0RUauZHU8aLHtpE0x7vtxIsAXtjLL9fm7QwFVzLmfjXMOlgg1DKHIjCNl/CBZmno
         VrRwcTTP5p3sBKjOdiwbMVsmYuKWy6XsbsNydtryYqscoBZGHjhOwp3Agt8hpDz+ZQOK
         1uEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789795638; x=1790400438; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsOGbbrKrxDZ019/NpDN7Ost5CQsExzoQfoaJGWhuYw=;
        b=BqEFX+wP8MBKLChh5RJOFbDz6DFVgZC5uwtmPNXZzRG8Hiu3AlAn9Rk6DodisLFicY
         Pj1a7pbY7W0Yvj00Fljow85kESLlUNLnMYq17SHGZTMRr4Ajhc0hO0c3zJgyAQHeSWi/
         TMNKnr2Wm1njXaXJyPJxsM7myvFHnpkzfOJlbZCCqUB9zDLwa6lPv5G0P7LuY7+FITjA
         V5fBWs+bJ6k32roWmqcMA9Vp+VaKwgJe4JxSqLqM5r19c+kimAmpf0+jupB1F7sbMeWL
         Q8vR6j79TzlsmbvlnlUxZqRjfwMDHOJO1VppDKjHATd9DXkapv/P7A9OrornBT6jgIRv
         i05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795638; x=1790400438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fsOGbbrKrxDZ019/NpDN7Ost5CQsExzoQfoaJGWhuYw=;
        b=ywW6ayqnp3MGBL1w8s/rMhCetx7AIkdGlDiAyKvr0neIH+D7niPGCg2OaQnYSPpS1w
         LTJk3ZjtGMABpOVpFg23IE/nSsEhjoJ3mmfSPYamqEeq11ue/QQWNGH8L9iJLyT95vLo
         CqqAMfGzgZ78+ZxwYvHZ5FGCWpXw0KyQrYLgqXaUVEEimdPpwvxIxngG2NMmI3EkWDkl
         jsG4Wd+0r+t7MOIcXEU4CUb6k2b+RRsSOTptgUbC55WRpevzHwniSojLOC7nr/QUE92L
         gSwOHHRsDOmNVyd3yBbC7tfXjHoKpe2hfukga+/hRiP1xHsXEGRUpdeHJ952GIE6FZS0
         5tHg==
X-Gm-Message-State: AFuF++me8bzHFuLrGdKraPf1/YdzKcfWjvsctdZBIVHftT/+s/5tuc1g
	NqbViYRnukEEWDGI0kuVn4S1jOn9DJ2a+xMzDrOZdpf6fLT3aRXu6bwLMaB8CZSP+KPZOEPPjC4
	J4NMPJXtgcwUdVZqXFwIfhAJaL2YjQCAtNaA4+SdB2kleRNixTv6l4GFLMdVC
X-Gm-Gg: AYBFou20VyQEC5vtkDMWXhMa7U/pZxIftZu4cIzknOu8Gyhx8lZQrCbT0WTP34FEBls
	LW1PyDxpXAIKPDWn+gbWBCFwa6h5AEpXSes0C9vEzCmiCYPkV8ixJNVbw+jz3m2rsKFP9X/mREX
	BJBEJNlMZj7JalBIlcqd9fxHuUmu5Kaq1RQFh98hofwBKrnpUO2HbNvVeyYekgX55z7iLT9QNs7
	rGe7YSINZLhKrO97g8M/nFdVsQOsIxBN9r0cK8FubyvAAQFPO7CUanJYGTV57d0l+NKd/SItNY8
	ZuUh6zqGV3X3Mzv9U8KYv8yhw6t8UVqvl2v8JGMY/5aWsuDppj7xKIXNl+8PrkenLnCt4M7kyOe
	pUW/tJtuiYTA79BDy/ANYNqs=
X-Received: by 2002:a53:ac90:0:b0:671:3add:3af8 with SMTP id
 956f58d0204a3-6717fc61354mr1406656d50.3.1789795638457; Fri, 18 Sep 2026
 22:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918182317.143223-1-karl@asseily.com> <20260918182317.143223-4-karl@asseily.com>
 <20260918183931.CE0831F000FF@smtp.kernel.org>
In-Reply-To: <20260918183931.CE0831F000FF@smtp.kernel.org>
From: Karl Asseily <karl@asseily.com>
Date: Sat, 19 Sep 2026 08:27:07 +0300
X-Gm-Features: AcwNN1U8eqVCHpfs6q-7BtlpiMzLJGyEq1TzZdYhtWj64BwB1WOouCpFGOqiras
Message-ID: <CA+gvwbqrav5C9e=9Jx1i31nrEZGDko73tAAhGzzexeRa1f72LQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> Does this copy include the ALSA TLV header along with the coefficient
> payload?

No.  snd_soc_bytes_tlv_callback() in sound/soc/soc-ops.c passes the
pointer through unchanged:

unsigned int count = size < params->max ? size : params->max;
...
ret = params->put(kcontrol, tlv, count);

There is no &tlv[2] and no size adjustment, so the driver receives the
control payload and nothing else.  The payload format for this control is
raw coefficients with no type/length header, which is what wm_adsp does
too; SOF embeds its own header, so both conventions exist in tree.

The hazard you describe is real, though, and I have met it.  A userspace
tool of mine did prepend an 8-byte header once.  Because the callback
clamps count to params->max, the driver still saw exactly 384 bytes, the
size check passed, and the two header words were loaded as taps - one
non-zero tap in 128, about -33 dB, found only from i2c tracepoints.

The driver cannot defend against that: the clamp means the true size never
reaches .put, so a header-bearing write is indistinguishable from a
correct one.  I will document the payload format at the control definition
so the contract is stated rather than implied.

> [Severity: Low]
> should this use a named initializer

Answered on v3.  sound/soc/codecs carries 202 i2c_device_id tables and 136
of their entries use the positional form, so it is the prevailing style
rather than a deviation.  No change.
