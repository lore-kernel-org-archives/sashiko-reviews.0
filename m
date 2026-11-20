Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170403;
	b=G+kohj6/e6Ib645uMZBV3+UMUPB1WBisp/IDDLlshM2hbs3B/yCt7SHalQmu7zELuDfE
	 agbfSVGaeiokNP8vjMuQ2PNMQvVV2gmRAPWE4J93awqaxtq5q0z2IHg8WjDMxdElUPK+4
	 zcelOI1DyDc0e6nlW9yhu6XWteSe1SKvpTcG/7VEF+M1M39Ycr6TDsAZ4b0NrYqilsm1a
	 HW8jru7afyUffmucpIUncWDr+FH18NTuwJxSlfhX34bhUslycxnXQ/ccQ5f5Mtb4dkNv/
	 VLi+ZtKuHkMQsdXG22nsPpGjf0KwuaT7uYTK+hTEKbF9TImHt58nGTv8jovIXgq4kIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
	b=HWpcj+1V5Bvvqpqjr3x7hKzM7cQgzOdUhyl0Y4BWu87LZFZXcg+/v3QN1ZQQS5nEge5R
	 X3seiB1h4c6dc9sq/hc+EvFahNzuzGs7OLjdDEoBYtDmKBG66YczAN5/uUwiKh2ZxN1im
	 Web/HEw82HeAYY1y/dbhvfDL6pcskoogWa0ZzAAf9N6b4GpHXbLroeM9trYWnwufLLn/H
	 boaQnK5spWqSkKFAJso+AjWz2UPUHl7Ka2Vslr2R6SlJUoyxijWv45rog6i+5tn5DqOaL
	 nyywqMCDIPUk/9eR0DQ1ChsECm1YeGj3tSlgil1VzEyqlsHV1A0v5bupx3HzKhgYnXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxiF1oIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C08606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxiF1oIV
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b904d10882so320287b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 02:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170402; cv=none;
        d=google.com; s=arc-20260327;
        b=CIM8bd3rUoYZSm367zVYHx9vM+qGFGiaB7XA2hOe2JperFZ9lbnTuiubNIk9cVXvlq
         zlkCoZf3Lkj/uC2K9jG4FQYIJpYHEPYY7hFvadb6etsrcBWTEe0e40sv3fL1nG5CqORr
         6dC0MfPOc4+BkOPfqrsxjg+jqif1zT8a2IrBYwE5v0tfbgqLlB5vy48JYFKgReQx7iKN
         QxfRfOsjEm55AeRrc+aWjCd5TddQ6j1fP+ToeHwq0N6g61Zt2Q2XbfYwEzJdlY5gv1MI
         9/G6IJZ631VZvnceBkbL428kqqGGwHeSVzoL53896BoocYf8SIt18VWa31fh4QthGvan
         X1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=MjeOnfmHrgztM7xy20YApfbEohTXH0hQQSTHak+Ww1SWjSTU34l59Ki/4+cH5FCMRR
         WXHbxjyyrAcun6vS28vIoF50WBrJZDkcNJkv63gZwsLP+Yh0TuH+LfScTOp2jyQURD8M
         ZClbuKbaHqrd4V8tfgfUAMZf3TuYPZ3Afa2mjkyQceSEwueCVxRk+umZWkerAfaVk2GF
         o1N4ke6z4WTReObG4I2UVXaq+D+PTRn3fwt4G7ywkBGY8EOd2+U2ZP5JYfFBb5fR2jaX
         no72+sMT3QDb+OdGollLZkbqTmRU0ozN3HvqwF1p1cU98jAdV0b8TLsglHvNX41R0pxI
         4fKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170402; x=1795775202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
        b=SxiF1oIV6YhVhhRnOnKkvuMet5shgCp+kR8NijIhu20pJbgEl1K7C0O2gw4JTRLFxX
         aRdq9ruokibUJ72gPK3WwQfW1ioMmUnZdqAXKzPCu5RsTbIP8qwM6GVY4ajaWma3jpTs
         ebGfdJQhN24e4tMb7sZ4N4nH5CaoOIg2pu+rnxxnFB9BkNVXfKDTkYX5nBvpUsYtPg/D
         8fcTm9SuCCKIZPShoGc2mYA1HMVvrKeMrGHaSMIYRAJGGAdY4sWB2ckxigpPYKcEWnO2
         9i+u9Q188URUgu536+mt/xY8Ljdvq48aqcipZ4FUPiwwpM2eydKS7H8v9Y2yKW1j7BIU
         mqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170402; x=1795775202;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LF2/f7qLTUBrb9c2xXcASr++BpW6e38apQYvPO24BK8=;
        b=JH40oEKd7GZdWAxut4g1KVedTuJHIU/n2bqRpZFpGng4DaCnFKo1/ii2iPNa0jBaeo
         OuwDcMAb3YMQMEC9lJvBvZsZWFvefWgWJVEOxlhP1deMILMIG9mR9o0HDnkKhWLAARan
         mgpN4JCWPvZiXTvb0FlM68AaQNHvadCrxDSnSdWFIJaX27mcDEopsMAqGEfywF8IXAka
         dwiUJJdBY0nPVi7jlbOPO4mzb55zjcPPYgHxlcQsqwtduPRt2acAtUZI8YDR+6ZBbQY4
         K+U+iYgHzIkDOosdCkvPTOziQBgGHjorYYa0nBSNxObzkenJ4TBR4PVVcZj1dWgur7r4
         3Zcg==
X-Gm-Message-State: APuU4Z9WKoTlUiQhHJwAhZ9ScoDQcMfIiPnjs/rLL/6STiVLcIXyHKkZ
	EM4YGXoafSkyiYULVaOAgYrkIegkEiDhH1RJJgJvOpSfW5lLIO5WxcK0B7CilZcgk1lLu72qJZ6
	VJqhOKRqZYMKYQQPAH1UoMuEjG33hYdJzTBTv
X-Gm-Gg: AYBFou07nj/unGIDKedzlG+Vv4BvPZWrNSNyKP16BqSb50YCFlgbt4c4nb/bQATxOBn
	6qoRXu1JjIPnQQFGtFE0idtGCBy2QkvCd3/lmMQGcNEqew10y96WeYP+a+NZfpj4IpeA1m9Umlx
	ukHhPEFkrJ2lkQqSJC2wJA7MzU84H3Ogrz7sKSffFGOk9IVWoOV9BYYEN4+84Gl4W5dMNwo7Dbi
	3FFsLSBsWzXB2R2OuRFvGyPx3YVF4OnL+s5zaBVl48fJF4yrTK9Ffd2KbENsPs+aStgF1OS4Ekk
	LQPvAE5HafnBcCZdRJ4GaxJW4aS8JbH5lfsI9HRx6jxq5r26ENzmoJXFYaw4pHTAkr/0lxrOew6
	ADs65hBokckkwzVLYfSSbCuQenDeqXCt+t5PYC/3bYTfXZtq82FYzN931o/lygAjmeg+v2CoOSv
	mMOySTBccLxR+enlsoAdwZw4uYBqLs3bZ4N2DBJqoAnI3gUbhR
X-Received: by 2002:a05:6a21:3b8f:b0:3f8:e16d:c9b1 with SMTP id
 adf61e73a8af0-4014e254f09mr3223108637.45.1795170402519; Fri, 20 Nov 2026
 02:26:42 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120100408.8053-1-phucduc.bui@gmail.com> <20261120100408.8053-3-phucduc.bui@gmail.com>
 <sashiko-outbox-224911@kernel.org> <CAABR9nEJ3Jgva3iTo2GVacHXRp_FVrqVxQ-VCdGg41vLbh4htQ@mail.gmail.com>
In-Reply-To: <CAABR9nEJ3Jgva3iTo2GVacHXRp_FVrqVxQ-VCdGg41vLbh4htQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:26:30 +0700
X-Gm-Features: AclHuK8GZnsfv_ewo_R90J5NHdMDIeazjGuJGm3zsdOP0C8Jt5X981fvDU5EK6o
Message-ID: <CAABR9nEVZp4-3xws7qm0N2gCnDXsh=kRF-UcHDeme7ZTbs10sA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers
 as volatile
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 5:22=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> > [Severity: Low]
> > In commit 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX
> > Controller"), mchp_spdiftx_regmap_config left .cache_type unset
> > (REGCACHE_NONE), so regmap_read() read SPDIFTX_ISR and SPDIFTX_IMR
> > directly from hardware.  Regmap caching was enabled later in commit
> > 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support"), which adde=
d
> > .cache_type =3D REGCACHE_FLAT without a .volatile_reg callback.
> >
> > Should the Fixes tag reference that commit instead?
> >
> >   Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")
>
> Commit 06ca24e98e6b already fixes 4bf54ca60f99, so I included both
> commits in the Fixes tags.
> I don't think this is a critical issue, so I'll wait for the
> maintainer's opinion.


Sorry, I got that wrong. You're right. I'll update the Fixes tag to:

> Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")
